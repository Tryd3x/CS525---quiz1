--write the SQL code for the answer to Question 1.1.3 here. We are using postgres.

WITH 
patron_list AS (SELECT * FROM Receipt r JOIN Item i ON r.id = i.receiptid ORDER BY bname),

menu_list AS (SELECT patron, patron_list.bname as bname, patron_list.bcity as bcity, patron_list.drink as drink, quantity, price FROM patron_list JOIN Menu ON patron_list.drink = Menu.drink AND patron_list.bname = Menu.bname),

cost_per_patron AS (SELECT DISTINCT patron,bname,bcity, SUM(quantity * price) as total_cost FROM menu_list GROUP BY patron,bname,bcity),

max_cost_per_bar AS (SELECT bname,MAX(total_cost) as max_cost FROM cost_per_patron GROUP BY bname)

SELECT cpp1.bname, cpp1.bcity, cpp1.patron FROM cost_per_patron cpp1 JOIN max_cost_per_bar mcpb ON cpp1.bname = mcpb.bname AND cpp1.total_cost = mcpb.max_cost;
