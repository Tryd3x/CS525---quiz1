--write the SQL code for the answer to Question 1.1.4 here. We are using postgres.

-- Info on most expensive drink
WITH expensive1 AS (SELECT bname,bcity,drink,price FROM Menu m WHERE m.price IN (SELECT MAX(price) FROM Menu GROUP BY bname)),
-- Filter expensive drink
filter_expensive1 AS (SELECT bname,bcity,drink,price FROM Menu WHERE NOT EXISTS (SELECT price FROM expensive1 WHERE Menu.price = expensive1.price)),
-- Info on 2nd most expensive drink
expensive2 AS (SELECT bname,bcity,drink,price FROM filter_expensive1 e2 WHERE e2.price IN (SELECT MAX(price) FROM filter_expensive1 GROUP BY bname)),
-- Filter 2nd most expensive drink
filter_expensive2 AS (SELECT bname,bcity,drink,price FROM filter_expensive1 WHERE NOT EXISTS (SELECT price FROM expensive2 WHERE filter_expensive1.price = expensive2.price))
--Extract2 most expensive drinks from each bar
SELECT * FROM Menu WHERE NOT EXISTS (SELECT price FROM filter_expensive2 WHERE Menu.price = filter_expensive2.price) ORDER BY bname;
