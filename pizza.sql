mysql> create database if not exists pizzahut;
Query OK, 1 row affected (0.06 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| company            |
| emp                |
| information_schema |
| mysql              |
| oracle             |
| performance_schema |
| pizzahut           |
| sales              |
+--------------------+
9 rows in set (0.04 sec)

mysql> use pizzahut;
Database changed

mysql> create table pizza(
    -> pizza_id varchar(30) primary key,
    -> pizza_type_id varchar(20),
    -> size varchar(10),
    -> price float);
Query OK, 0 rows affected (0.11 sec)


mysql> load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/pizzas.csv'
    -> into table pizza
    -> fields terminated by ','
    -> lines terminated by '\n'
    -> ignore 1 rows;
Query OK, 96 rows affected (0.04 sec)
Records: 96  Deleted: 0  Skipped: 0  Warnings: 0

mysql> select * from pizza limit 20;
+---------------+---------------+------+-------+
| pizza_id      | pizza_type_id | size | price |
+---------------+---------------+------+-------+
| bbq_ckn_l     | bbq_ckn       | L    | 20.75 |
| bbq_ckn_m     | bbq_ckn       | M    | 16.75 |
| bbq_ckn_s     | bbq_ckn       | S    | 12.75 |
| big_meat_l    | big_meat      | L    |  20.5 |
| big_meat_m    | big_meat      | M    |    16 |
| big_meat_s    | big_meat      | S    |    12 |
| brie_carre_s  | brie_carre    | S    | 23.65 |
| calabrese_l   | calabrese     | L    | 20.25 |
| calabrese_m   | calabrese     | M    | 16.25 |
| calabrese_s   | calabrese     | S    | 12.25 |
| cali_ckn_l    | cali_ckn      | L    | 20.75 |
| cali_ckn_m    | cali_ckn      | M    | 16.75 |
| cali_ckn_s    | cali_ckn      | S    | 12.75 |
| ckn_alfredo_l | ckn_alfredo   | L    | 20.75 |
| ckn_alfredo_m | ckn_alfredo   | M    | 16.75 |
| ckn_alfredo_s | ckn_alfredo   | S    | 12.75 |
| ckn_pesto_l   | ckn_pesto     | L    | 20.75 |
| ckn_pesto_m   | ckn_pesto     | M    | 16.75 |
| ckn_pesto_s   | ckn_pesto     | S    | 12.75 |
| classic_dlx_l | classic_dlx   | L    |  20.5 |
+---------------+---------------+------+-------+
20 rows in set (0.00 sec)

mysql> create table orders(
    -> order_id int primary key,
    -> date date,
    -> time time);
Query OK, 0 rows affected (0.04 sec)

mysql> LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/orders.csv'
    -> INTO TABLE orders
    -> FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\n'
    -> IGNORE 1 ROWS;
Query OK, 21350 rows affected, 21350 warnings (0.49 sec)
Records: 21350  Deleted: 0  Skipped: 0  Warnings: 21350

mysql> select * from orders limit 20;
+----------+------------+----------+
| order_id | date       | time     |
+----------+------------+----------+
|        1 | 2015-01-01 | 11:38:36 |
|        2 | 2015-01-01 | 11:57:40 |
|        3 | 2015-01-01 | 12:12:28 |
|        4 | 2015-01-01 | 12:16:31 |
|        5 | 2015-01-01 | 12:21:30 |
|        6 | 2015-01-01 | 12:29:36 |
|        7 | 2015-01-01 | 12:50:37 |
|        8 | 2015-01-01 | 12:51:37 |
|        9 | 2015-01-01 | 12:52:01 |
|       10 | 2015-01-01 | 13:00:15 |
|       11 | 2015-01-01 | 13:02:59 |
|       12 | 2015-01-01 | 13:04:41 |
|       13 | 2015-01-01 | 13:11:55 |
|       14 | 2015-01-01 | 13:14:19 |
|       15 | 2015-01-01 | 13:33:00 |
|       16 | 2015-01-01 | 13:34:07 |
|       17 | 2015-01-01 | 13:53:00 |
|       18 | 2015-01-01 | 13:57:08 |
|       19 | 2015-01-01 | 13:59:09 |
|       20 | 2015-01-01 | 14:03:08 |
+----------+------------+----------+
20 rows in set (0.00 sec)

mysql> create table order_details(
    -> orders_details_id int primary key,
    -> order_id int,
    -> pizza_id varchar(30),
    -> quantity int);
Query OK, 0 rows affected (0.04 sec)

mysql> LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/order_details.csv'
    -> INTO TABLE order_details
    -> FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\n'
    -> IGNORE 1 ROWS;
Query OK, 48620 rows affected (0.53 sec)
Records: 48620  Deleted: 0  Skipped: 0  Warnings: 0

mysql> select * from order_details limit 20;
+-------------------+----------+----------------+----------+
| orders_details_id | order_id | pizza_id       | quantity |
+-------------------+----------+----------------+----------+
|                 1 |        1 | hawaiian_m     |        1 |
|                 2 |        2 | classic_dlx_m  |        1 |
|                 3 |        2 | five_cheese_l  |        1 |
|                 4 |        2 | ital_supr_l    |        1 |
|                 5 |        2 | mexicana_m     |        1 |
|                 6 |        2 | thai_ckn_l     |        1 |
|                 7 |        3 | ital_supr_m    |        1 |
|                 8 |        3 | prsc_argla_l   |        1 |
|                 9 |        4 | ital_supr_m    |        1 |
|                10 |        5 | ital_supr_m    |        1 |
|                11 |        6 | bbq_ckn_s      |        1 |
|                12 |        6 | the_greek_s    |        1 |
|                13 |        7 | spinach_supr_s |        1 |
|                14 |        8 | spinach_supr_s |        1 |
|                15 |        9 | classic_dlx_s  |        1 |
|                16 |        9 | green_garden_s |        1 |
|                17 |        9 | ital_cpcllo_l  |        1 |
|                18 |        9 | ital_supr_l    |        1 |
|                19 |        9 | ital_supr_s    |        1 |
|                20 |        9 | mexicana_s     |        1 |
+-------------------+----------+----------------+----------+
20 rows in set (0.00 sec)

mysql> create table pizza_types(
    -> pizza_type_id varchar(30) primary key,
    -> name varchar(50),
    -> category varchar(30),
    -> ingredient varchar(200));
Query OK, 0 rows affected (0.03 sec)




mysql> LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/pizza_types.csv'
    -> INTO TABLE pizza_types
    -> FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\n'
    -> IGNORE 1 ROWS;
Query OK, 31 rows affected, 31 warnings (0.02 sec)
Records: 31  Deleted: 0  Skipped: 0  Warnings: 31

mysql> select * from pizza_types limit 30;
+---------------+----------------------------------+-----------+----------------------------+
| pizza_type_id | name                             | category  | ingredient                 |
+---------------+----------------------------------+-----------+----------------------------+
| bbq_ckn       | The Barbecue Chicken Pizza       | Chicken   | "Barbecued Chicken         |
| big_meat      | The Big Meat Pizza               | Classic   | "Bacon                     |
| brie_carre    | The Brie Carre Pizza             | Supreme   | "Brie Carre Cheese         |
| calabrese     | The Calabrese Pizza              | Supreme   | "?Nduja Salami             |
| cali_ckn      | The California Chicken Pizza     | Chicken   | "Chicken                   |
| ckn_alfredo   | The Chicken Alfredo Pizza        | Chicken   | "Chicken                   |
| ckn_pesto     | The Chicken Pesto Pizza          | Chicken   | "Chicken                   |
| classic_dlx   | The Classic Deluxe Pizza         | Classic   | "Pepperoni                 |
| five_cheese   | The Five Cheese Pizza            | Veggie    | "Mozzarella Cheese         |
| four_cheese   | The Four Cheese Pizza            | Veggie    | "Ricotta Cheese            |
| hawaiian      | The Hawaiian Pizza               | Classic   | "Sliced Ham                |
| ital_cpcllo   | The Italian Capocollo Pizza      | Classic   | "Capocollo                 |
| ital_supr     | The Italian Supreme Pizza        | Supreme   | "Calabrese Salami          |
| ital_veggie   | The Italian Vegetables Pizza     | Veggie    | "Eggplant                  |
| mediterraneo  | The Mediterranean Pizza          | Veggie    | "Spinach                   |
| mexicana      | The Mexicana Pizza               | Veggie    | "Tomatoes                  |
| napolitana    | The Napolitana Pizza             | Classic   | "Tomatoes                  |
| pep_msh_pep   | "The Pepperoni                   |  Mushroom |  and Peppers Pizza"        |
| pepperoni     | The Pepperoni Pizza              | Classic   | "Mozzarella Cheese         |
| peppr_salami  | The Pepper Salami Pizza          | Supreme   | "Genoa Salami              |
| prsc_argla    | The Prosciutto and Arugula Pizza | Supreme   | "Prosciutto di San Daniele |
| sicilian      | The Sicilian Pizza               | Supreme   | "Coarse Sicilian Salami    |
| soppressata   | The Soppressata Pizza            | Supreme   | "Soppressata Salami        |
| southw_ckn    | The Southwest Chicken Pizza      | Chicken   | "Chicken                   |
| spicy_ital    | The Spicy Italian Pizza          | Supreme   | "Capocollo                 |
| spin_pesto    | The Spinach Pesto Pizza          | Veggie    | "Spinach                   |
| spinach_fet   | The Spinach and Feta Pizza       | Veggie    | "Spinach                   |
| spinach_supr  | The Spinach Supreme Pizza        | Supreme   | "Spinach                   |
| thai_ckn      | The Thai Chicken Pizza           | Chicken   | "Chicken                   |
| the_greek     | The Greek Pizza                  | Classic   | "Kalamata Olives           |
+---------------+----------------------------------+-----------+----------------------------+
30 rows in set (0.02 sec)



mysql> -- Q1] retrived the total no of orders placed?
Query OK, 0 rows affected (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_pizzahut |
+--------------------+
| order_details      |
| orders             |
| pizza              |
| pizza_types        |
+--------------------+
4 rows in set (0.20 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe pizza;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe pizza_types;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql>  select count(order_id) as total_orders from orders;
+--------------+
| total_orders |
+--------------+
|        21350 |
+--------------+
1 row in set (0.06 sec)



mysql> select sum(order_details.quantity* pizza.price)as total_revenue  from order_details join pizza on order_details.pizza_id=pizza.pizza_id; 
+-------------------+
| total_revenue     |
+-------------------+
| 817860.0508384705 |
+-------------------+
1 row in set (0.07 sec)


mysql> select round(sum(order_details.quantity* pizza.price),2)as total_revenue  from order_details join pizza on order_details.pizza_id=pizza.pizza_id; 
+---------------+
| total_revenue |
+---------------+
|     817860.05 |
+---------------+
1 row in set (0.07 sec)

mysql> -- Q]3 IDENTIFY HIGHEST PRISE PIZZA
Query OK, 0 rows affected (0.00 sec)

mysql> describe pizza;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> show tables;
+--------------------+
| Tables_in_pizzahut |
+--------------------+
| order_details      |
| orders             |
| pizza              |
| pizza_types        |
+--------------------+
4 rows in set (0.01 sec)

mysql> select max(price) as highest_price_of_pizza from pizza;
+------------------------+
| highest_price_of_pizza |
+------------------------+
|                  35.95 |
+------------------------+
1 row in set (0.01 sec)


mysql> describe pizza_types
    -> ;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe pizza;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select   pizza_types.name,  pizza.price  from pizza_types  join pizza on pizza_types.pizza_type_id =pizza.pizza_type_id order by pizza.price desc limit 1;
+-----------------+-------+
| name            | price |
+-----------------+-------+
| The Greek Pizza | 35.95 |
+-----------------+-------+
1 row in set (0.00 sec)

mysql> -- Q4] identify most comoon pizza orderd?
Query OK, 0 rows affected (0.00 sec)

mysql> select size,count(pizza_id) from pizza group by(size) order by count(pizza_id) desc limit 1;
+------+-----------------+
| size | count(pizza_id) |
+------+-----------------+
| S    |              32 |
+------+-----------------+
1 row in set (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_pizzahut |
+--------------------+
| order_details      |
| orders             |
| pizza              |
| pizza_types        |
+--------------------+
4 rows in set (0.09 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe pizza;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe pizza_types;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql> select pizza.size,count(order_id) from pizza join order_details on pizza.pizza_id=order_details.pizza_id group by (pizza.size) order by count(order_id) desc limit 1;
+------+-----------------+
| size | count(order_id) |
+------+-----------------+
| L    |           18526 |
+------+-----------------+
1 row in set (0.10 sec)

mysql> -- Q 5]List the top 5 most ordered pizza types along with their quantities
Query OK, 0 rows affected (0.00 sec)

mysql> select pizza_types .name,sum(order_details.quantity) from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id  
    -> join order_details on order_details.pizza_id=pizza.pizza_id group by pizza_types.name order by sum(order_details.quantity) desc limit 1;
+--------------------------+-----------------------------+
| name                     | sum(order_details.quantity) |
+--------------------------+-----------------------------+
| The Classic Deluxe Pizza |                        2453 |
+--------------------------+-----------------------------+
1 row in set (0.15 sec)

mysql> -- Q]6Join the necessary tables to find the total quantity of each pizza category ordered.
Query OK, 0 rows affected (0.00 sec)


mysql> select pizza_types .category,sum(order_details.quantity) from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id  
    -> join order_details on order_details.pizza_id=pizza.pizza_id group by pizza_types.category order by sum(order_details.quantity) desc limit 1;
+----------+-----------------------------+
| category | sum(order_details.quantity) |
+----------+-----------------------------+
| Classic  |                       13529 |
+----------+-----------------------------+
1 row in set (0.14 sec)

mysql> select pizza_types .category,sum(order_details.quantity) as quantity from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id  
    -> join order_details on order_details.pizza_id=pizza.pizza_id group by pizza_types.category order by sum(order_details.quantity) desc ;
+-----------+----------+
| category  | quantity |
+-----------+----------+
| Classic   |    13529 |
| Supreme   |    11987 |
| Chicken   |    11050 |
| Veggie    |    10652 |
|  Mushroom |     1359 |
+-----------+----------+
5 rows in set (0.14 sec)

mysql> -- Determine the distribution of orders by hour of the day
Query OK, 0 rows affected (0.00 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> select hour(time),count(order_id) from orders group by(hour(time));
+------------+-----------------+
| hour(time) | count(order_id) |
+------------+-----------------+
|         11 |            1231 |
|         12 |            2520 |
|         13 |            2455 |
|         14 |            1472 |
|         15 |            1468 |
|         16 |            1920 |
|         17 |            2336 |
|         18 |            2399 |
|         19 |            2009 |
|         20 |            1642 |
|         21 |            1198 |
|         22 |             663 |
|         23 |              28 |
|         10 |               8 |
|          9 |               1 |
+------------+-----------------+
15 rows in set (0.02 sec)


mysql> select hour(time),count(order_id) as hour from orders group by(hour(time)) order by  hour(time) asc;
+------------+------+
| hour(time) | hour |
+------------+------+
|          9 |    1 |
|         10 |    8 |
|         11 | 1231 |
|         12 | 2520 |
|         13 | 2455 |
|         14 | 1472 |
|         15 | 1468 |
|         16 | 1920 |
|         17 | 2336 |
|         18 | 2399 |
|         19 | 2009 |
|         20 | 1642 |
|         21 | 1198 |
|         22 |  663 |
|         23 |   28 |
+------------+------+
15 rows in set (0.01 sec)

mysql> select hour(time),count(order_id) as orders from orders group by(hour(time)) order by  hour(time) asc;
+------------+--------+
| hour(time) | orders |
+------------+--------+
|          9 |      1 |
|         10 |      8 |
|         11 |   1231 |
|         12 |   2520 |
|         13 |   2455 |
|         14 |   1472 |
|         15 |   1468 |
|         16 |   1920 |
|         17 |   2336 |
|         18 |   2399 |
|         19 |   2009 |
|         20 |   1642 |
|         21 |   1198 |
|         22 |    663 |
|         23 |     28 |
+------------+--------+
15 rows in set (0.01 sec)

mysql> -- Q8]Join relevant tables to find the category-wise distribution of pizzas
Query OK, 0 rows affected (0.00 sec)

mysql> describe pizza_types;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select category ,count(name) as destribution from pizza_types group by (category);
+-----------+--------------+
| category  | destribution |
+-----------+--------------+
| Chicken   |            6 |
| Classic   |            7 |
| Supreme   |            9 |
| Veggie    |            8 |
|  Mushroom |            1 |
+-----------+--------------+
5 rows in set (0.00 sec)

mysql> -- Q 9] Group the orders by date and calculate the average number of pizzas ordered per day.
Query OK, 0 rows affected (0.00 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select date,sum(quantity) from orders join order_details on orders.order_id=order_details.order_id group by(date) limit 5;
+------------+---------------+
| date       | sum(quantity) |
+------------+---------------+
| 2015-01-01 |           162 |
| 2015-01-02 |           165 |
| 2015-01-03 |           158 |
| 2015-01-04 |           106 |
| 2015-01-05 |           125 |
+------------+---------------+
5 rows in set (0.07 sec)

mysql> select avg(data) as average_quantity_per_day from( 
    -> select date,sum(quantity) as data from orders join order_details on orders.order_id=order_details.order_id group by(date) ) as derived_table;
+--------------------------+
| average_quantity_per_day |
+--------------------------+
|                 138.4749 |
+--------------------------+
1 row in set (0.06 sec)

mysql> select round(avg(data),0) as average_quantity_per_day from( 
    -> select date,sum(quantity) as data from orders join order_details on orders.order_id=order_details.order_id group by(date) ) as derived_table;
+--------------------------+
| average_quantity_per_day |
+--------------------------+
|                      138 |
+--------------------------+
1 row in set (0.05 sec)

mysql> -- Q 10]Determine the top 3 most ordered pizza types based on revenue
Query OK, 0 rows affected (0.00 sec)



mysql> describe pizza;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe pizza_types;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> select pizza_types.name ,sum(pizza.price*order_details.quantity) as revenue from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id join order_details on pizza.pizza_id=order_details.pizza_id group by(pizza_types.name) order by revenue desc;
+-----------------------------------+--------------------+
| name                              | revenue            |
+-----------------------------------+--------------------+
| The Thai Chicken Pizza            |           43434.25 |
| The Barbecue Chicken Pizza        |              42768 |
| The California Chicken Pizza      |            41409.5 |
| The Classic Deluxe Pizza          |            38180.5 |
| The Spicy Italian Pizza           |           34831.25 |
| The Southwest Chicken Pizza       |           34705.75 |
| The Italian Supreme Pizza         |           33476.75 |
| The Hawaiian Pizza                |           32273.25 |
| The Four Cheese Pizza             |  32265.70100402832 |
| The Sicilian Pizza                |            30940.5 |
| The Pepperoni Pizza               |           30161.75 |
| The Greek Pizza                   | 28454.100021362305 |
| The Mexicana Pizza                |           26780.75 |
| The Five Cheese Pizza             |            26066.5 |
| The Pepper Salami Pizza           |              25529 |
| The Italian Capocollo Pizza       |              25094 |
| The Vegetables + Vegetables Pizza |           24374.75 |
| The Prosciutto and Arugula Pizza  |           24193.25 |
| The Napolitana Pizza              |              24087 |
| The Spinach and Feta Pizza        |           23271.25 |
| The Big Meat Pizza                |              22968 |
| "The Pepperoni                    |            18834.5 |
| The Chicken Alfredo Pizza         |           16900.25 |
| The Chicken Pesto Pizza           |           16701.75 |
| The Soppressata Pizza             |           16425.75 |
| The Italian Vegetables Pizza      |           16019.25 |
| The Calabrese Pizza               |           15934.25 |
| The Spinach Pesto Pizza           |              15596 |
| The Mediterranean Pizza           |            15360.5 |
| The Spinach Supreme Pizza         |           15277.75 |
| The Brie Carre Pizza              | 11588.499813079834 |
+-----------------------------------+--------------------+
31 rows in set (0.16 sec)

mysql> select pizza_types.name ,round(sum(pizza.price*order_details.quantity),0) as revenue from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id join order_details on pizza.pizza_id=order_details.pizza_id group by(pizza_types.name) order by revenue desc limit 3;
+------------------------------+---------+
| name                         | revenue |
+------------------------------+---------+
| The Thai Chicken Pizza       |   43434 |
| The Barbecue Chicken Pizza   |   42768 |
| The California Chicken Pizza |   41410 |
+------------------------------+---------+
3 rows in set (0.15 sec)

mysql> -- Q11]Calculate the percentage contribution of each pizza type to total revenue.
Query OK, 0 rows affected (0.00 sec)

mysql> select sum(pizza.price*order_details.quantity) as revenue from pizza join order_details on pizza.pizza_id=order_details.pizza_id ; 
+-------------------+
| revenue           |
+-------------------+
| 817860.0508384705 |
+-------------------+
1 row in set (0.07 sec)

mysql> select sum(pizza.price*order_details.quantity) into @total from pizza join order_details on pizza.pizza_id=order_details.pizza_id ; 
Query OK, 1 row affected (0.07 sec)



mysql> select pizza_types.category ,round((sum(pizza.price*order_details.quantity)/@total)*100,2) as percentage_from_revenue from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id join order_details on pizza.pizza_id=order_details.pizza_id group by(pizza_types.category) order by percentage_from_revenue desc;
+-----------+-------------------------+
| category  | percentage_from_revenue |
+-----------+-------------------------+
| Supreme   |                   25.46 |
| Classic   |                    24.6 |
| Chicken   |                   23.96 |
| Veggie    |                   21.98 |
|  Mushroom |                     2.3 |
+-----------+-------------------------+
5 rows in set (0.18 sec)

mysql> select pizza_types.category ,round((sum(pizza.price*order_details.quantity)/@total)*100,0) as percentage_from_revenue from pizza_types join pizza on pizza_types.pizza_type_id=pizza.pizza_type_id join order_details on pizza.pizza_id=order_details.pizza_id group by(pizza_types.category) order by percentage_from_revenue desc;
+-----------+-------------------------+
| category  | percentage_from_revenue |
+-----------+-------------------------+
| Classic   |                      25 |
| Supreme   |                      25 |
| Chicken   |                      24 |
| Veggie    |                      22 |
|  Mushroom |                       2 |
+-----------+-------------------------+
5 rows in set (0.15 sec)

mysql> SELECT 
    ->     pizza_types.category,
    ->     (SUM(pizza.price * order_details.quantity) / @total) * 100 AS percentage_from_revenue
    -> FROM 
    ->     pizza_types
    -> JOIN 
    ->     pizza ON pizza_types.pizza_type_id = pizza.pizza_type_id
    -> JOIN 
    ->     order_details ON pizza.pizza_id = order_details.pizza_id
    -> GROUP BY 
    ->     pizza_types.category
    -> ORDER BY 
    ->     percentage_from_revenue DESC;
+-----------+-------------------------+
| category  | percentage_from_revenue |
+-----------+-------------------------+
| Supreme   |      25.456311211146232 |
| Classic   |       24.60306012196988 |
| Chicken   |       23.95513753228847 |
| Veggie    |      21.976217180404426 |
|  Mushroom |       2.302900108727754 |
+-----------+-------------------------+
5 rows in set (0.14 sec)

mysql> select round(sum(pizza.price*order_details.quantity),2) into @total from pizza join order_details on pizza.pizza_id=order_details.pizza_id ; 
Query OK, 1 row affected (0.06 sec)

mysql> SELECT 
    ->     pizza_types.category,
    ->     (SUM(pizza.price * order_details.quantity) / @total) * 100 AS percentage_from_revenue
    -> FROM 
    ->     pizza_types
    -> JOIN 
    ->     pizza ON pizza_types.pizza_type_id = pizza.pizza_type_id
    -> JOIN 
    ->     order_details ON pizza.pizza_id = order_details.pizza_id
    -> GROUP BY 
    ->     pizza_types.category
    -> ORDER BY 
    ->     percentage_from_revenue DESC;
+-----------+-------------------------+
| category  | percentage_from_revenue |
+-----------+-------------------------+
| Supreme   |       25.45631123724405 |
| Classic   |      24.603060147192945 |
| Chicken   |      23.955137556847287 |
| Veggie    |      21.976217202934453 |
|  Mushroom |       2.302900111088688 |
+-----------+-------------------------+
5 rows in set (0.14 sec)



mysql> -- Q]12 Analyze the cumulative revenue generated over time.
Query OK, 0 rows affected (0.00 sec)

mysql> describe pizza
    -> ;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

mysql> describe orders;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| order_id | int  | NO   | PRI | NULL    |       |
| date     | date | YES  |     | NULL    |       |
| time     | time | YES  |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)




mysql> select sales.date,sum(revenue) over (order by sales.date) as commulative_revenue from(
    -> select orders.date,sum(pizza.price*order_details.quantity) as revenue from orders join order_details on orders.order_id =order_details.order_id join pizza on order_details.pizza_id=pizza.pizza_id group by(date) order by sum(pizza.price*order_details.quantity) desc)as sales limit 5;
+------------+---------------------+
| date       | commulative_revenue |
+------------+---------------------+
| 2015-01-01 |  2713.8500022888184 |
| 2015-01-02 |   5445.750003814697 |
| 2015-01-03 |   8108.150007247925 |
| 2015-01-04 |   9863.600008010864 |
| 2015-01-05 |  11929.550008773804 |
+------------+---------------------+
5 rows in set (0.10 sec)

mysql>  -- Q13]Determine the top 3 most ordered pizza types based on revenue for each pizza category;
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> describe pizza_types;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| pizza_type_id | varchar(30)  | NO   | PRI | NULL    |       |
| name          | varchar(50)  | YES  |     | NULL    |       |
| category      | varchar(30)  | YES  |     | NULL    |       |
| ingredient    | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> describe pizza
    -> ;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pizza_id      | varchar(30) | NO   | PRI | NULL    |       |
| pizza_type_id | varchar(20) | YES  |     | NULL    |       |
| size          | varchar(10) | YES  |     | NULL    |       |
| price         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> describe order_details;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| orders_details_id | int         | NO   | PRI | NULL    |       |
| order_id          | int         | YES  |     | NULL    |       |
| pizza_id          | varchar(30) | YES  |     | NULL    |       |
| quantity          | int         | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> SELECT 
    ->     pizza_types.category,
    ->     pizza_types.name,
    ->     SUM(pizza.price * order_details.quantity) AS revenue
    -> FROM 
    ->     pizza_types
    -> JOIN 
    ->     pizza ON pizza_types.pizza_type_id = pizza.pizza_type_id
    -> JOIN 
    ->     order_details ON pizza.pizza_id = order_details.pizza_id
    -> GROUP BY 
    ->     pizza_types.category, pizza_types.name
    -> ORDER BY 
    ->     revenue DESC;
+-----------+-----------------------------------+--------------------+
| category  | name                              | revenue            |
+-----------+-----------------------------------+--------------------+
| Chicken   | The Thai Chicken Pizza            |           43434.25 |
| Chicken   | The Barbecue Chicken Pizza        |              42768 |
| Chicken   | The California Chicken Pizza      |            41409.5 |
| Classic   | The Classic Deluxe Pizza          |            38180.5 |
| Supreme   | The Spicy Italian Pizza           |           34831.25 |
| Chicken   | The Southwest Chicken Pizza       |           34705.75 |
| Supreme   | The Italian Supreme Pizza         |           33476.75 |
| Classic   | The Hawaiian Pizza                |           32273.25 |
| Veggie    | The Four Cheese Pizza             |  32265.70100402832 |
| Supreme   | The Sicilian Pizza                |            30940.5 |
| Classic   | The Pepperoni Pizza               |           30161.75 |
| Classic   | The Greek Pizza                   | 28454.100021362305 |
| Veggie    | The Mexicana Pizza                |           26780.75 |
| Veggie    | The Five Cheese Pizza             |            26066.5 |
| Supreme   | The Pepper Salami Pizza           |              25529 |
| Classic   | The Italian Capocollo Pizza       |              25094 |
| Veggie    | The Vegetables + Vegetables Pizza |           24374.75 |
| Supreme   | The Prosciutto and Arugula Pizza  |           24193.25 |
| Classic   | The Napolitana Pizza              |              24087 |
| Veggie    | The Spinach and Feta Pizza        |           23271.25 |
| Classic   | The Big Meat Pizza                |              22968 |
|  Mushroom | "The Pepperoni                    |            18834.5 |
| Chicken   | The Chicken Alfredo Pizza         |           16900.25 |
| Chicken   | The Chicken Pesto Pizza           |           16701.75 |
| Supreme   | The Soppressata Pizza             |           16425.75 |
| Veggie    | The Italian Vegetables Pizza      |           16019.25 |
| Supreme   | The Calabrese Pizza               |           15934.25 |
| Veggie    | The Spinach Pesto Pizza           |              15596 |
| Veggie    | The Mediterranean Pizza           |            15360.5 |
| Supreme   | The Spinach Supreme Pizza         |           15277.75 |
| Supreme   | The Brie Carre Pizza              | 11588.499813079834 |
+-----------+-----------------------------------+--------------------+
31 rows in set (0.21 sec)

mysql> notee;






