--write the SQL code for the answer to Question 1.1.5 here. We are using postgres.

-- Obtained cost per patron per drink
WITH cost_per_patron_per_drink AS (SELECT r.bname,r.bcity, (i.quantity * m.price) as total
FROM Receipt r JOIN Item i ON r.id = i.receiptid
JOIN Menu m ON (r.bname = m.bname) AND (i.drink = m.drink) ORDER BY total DESC)
-- Total income per bar in descending order
SELECT bname,bcity,SUM(total) as ttl FROM cost_per_patron_per_drink GROUP BY bname,bcity ORDER BY ttl DESC;
