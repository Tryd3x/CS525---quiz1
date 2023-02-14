--write the SQL code for the answer to Question 1.1.1 here. We are using postgres.
SELECT DISTINCT patron 
FROM Receipt
WHERE id IN (
SELECT i.receiptid
FROM Item i JOIN Drink d ON i.drink = d.drink
WHERE d.type = 'beer');

-- SELECT i.receiptid
-- FROM Item i JOIN Drink d ON i.drink = d.drink
-- WHERE d.type = 'beer';

-- SELECT r.patron
-- FROM Receipt r JOIN Item i ON r.id = i.receiptid
-- JOIN drink d on i.drink = d.drink
-- WHERE d.type = 'beer';