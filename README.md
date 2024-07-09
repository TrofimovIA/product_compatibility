# Отчет по сочетаемости товаров
## Задание:
Изучить сочетаемость товаров. Идея простая - мы анализируем все чеки по всем магазинам и смотрим: какие товары чаще всего встречаются друг с другом в чеках. Если отфильтровать очевидные товары типа "пакет", то это поможет нам извлечь массу полезной информации (например, продумать акции для повышения среднего чека).

В качестве исходных данных имеем данные о продажах всей сети магазинов.

[Тут](https://github.com/TrofimovIA/product_compatibility/blob/main/DB%20diagram.PNG) можно посмотреть структуры базы данных.

Отчет реализован Metabase в виде таблицы: товар 1, товар 2, количество совместных попаданий в чек. Дополнительно реализованы фильтры - даты, товары, магазины, количество совместных попаданий не меньше N и так далее. 

## Код
Код для решения задачи  можно посмотреть [здесь](https://github.com/TrofimovIA/product_compatibility/blob/main/compatibility.sql)

## Результат
Отчет реализован в Metabase в виде таблицы: товар 1, товар 2, количество совместных попаданий в чек. Дополнительно реализованы фильтры - даты, товары, магазины, количество совместных попаданий не меньше N и так далее. 
![Результат](https://github.com/TrofimovIA/product_compatibility/blob/main/comp_metabase.PNG)
Так же цветом выделены позиции котороые встречаются чаще и реже всего.
