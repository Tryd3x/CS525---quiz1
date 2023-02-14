--write the SQL code for the answer to Question 1.1.2 here. We are using postgres.
WITH p_drinks AS (SELECT patron, drink FROM Item JOIN Receipt ON receiptid = id),
p_pairs AS (SELECT DISTINCT p1.patron AS patron_1, p2.patron AS patron_2 FROM p_drinks p1 JOIN p_drinks p2 ON p1.patron < p2.patron)
SELECT patron_1, patron_2
FROM p_pairs
WHERE NOT EXISTS ( 
    SELECT 1
    FROM p_drinks
    WHERE (patron = patron_1 AND drink IN (
      SELECT drink
      FROM p_drinks
      WHERE patron = patron_2
    )) OR (patron = patron_2 AND drink IN (
      SELECT drink
      FROM p_drinks
      WHERE patron = patron_1
    ))
)