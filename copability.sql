with filtered_product as (
    select name
    from product
    where true 
    and {{filt_prod}}
),
filters as  (
    select *
    from shop
    where true
    [[and name != {{reg}}]]
    [[and name != {{format}}]]
),
union_data as (
    select 
        sales.id_1c as cheque,
        sales.datetime as dt,
        product.name as product_name,
        shop.name as shop_name
    from sales
    join product
    on sales.product_id = product.id_1c
    join shop 
    on sales.shop_id = shop.id_1c
    where true 
    and {{sales.datetime}}
    and {{shop.name}}
    and {{not_product}}
    -- исключаем дубли
    group by
        cheque, 
        dt, 
        product_name,
        shop_name
),
prep_data as (
    select
        ud1.product_name AS poduct_1,
        ud2.product_name AS poduct_2,
        ud1.cheque || ' | ' || ud1.dt || ' | ' || ud1.shop_name AS cheque
    from union_data ud1
    join union_data ud2 
    on ud1.shop_name = ud2.shop_name
    and ud1.cheque = ud2.cheque
    and ud1.dt = ud2.dt
    and ud1.product_name < ud2.product_name
)
select
    poduct_1 as "Продукт 1",
    poduct_2 as "Продукт 2",
    count(distinct cheque) AS "Частота одновременного вхождения в чек"
from prep_data
where 
	poduct_1 in (select name from filtered_product) 
	or poduct_2 in (select name from filtered_product) 
group by 
    poduct_1,
    poduct_2
having true
[[and count(distinct cheque) >= {{cnt}}]]
order by 
    count(distinct cheque) desc