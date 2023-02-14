--write the SQL code for the answer to Question 1.1.8 here. We are using postgres.

-- cost per patron by trans type
WITH cost AS (SELECT r.patron, paymentmethod, SUM(i.quantity * m.price) as cost 
FROM Receipt r JOIN Item i ON r.id = i.receiptid 
JOIN Menu m ON r.bname = m.bname AND i.drink = m.drink
GROUP BY r.patron, paymentmethod),

_ AS (SELECT DISTINCT patron,(SELECT SUM(cost) FROM cost c1 WHERE (c1.patron = c.patron AND c1.paymentmethod = 'cash')) AS cashamount,(SELECT SUM(cost) FROM cost c2 WHERE c2.patron = c.patron AND c2.paymentmethod = 'card') AS cardamount FROM cost c)

SELECT patron, COALESCE(cashamount,0.0) as cashamount, COALESCE(cardamount,0.0) as cardamount FROM _;
