--=============================================================--
--  Answers
--=============================================================--

-----------------------------------------------------------------
--  PROBLEM 1
-----------------------------------------------------------------
--  The Wasatch Cupcake Shop is getting ready to send 
--    a marketing email announcing a new promotion on 
--    Funfetti cupcakes. We need to get all of our 
--    customers’ email addresses to Marketing.

--  Select all of the email addresses from the customers 
--    table in alphabetical order.
SELECT email 
FROM customers 
ORDER BY email ASC;

-----------------------------------------------------------------
--  PROBLEM 2
-----------------------------------------------------------------
--  Elizabeth Crocker has requested receipts for all of her past 
--    cupcake orders. To look up the receipts, we need to know 
--    which orders Elizabeth placed.

--  Write a query that lists the order ids for all orders placed 
--    by customers with the first name Elizabeth and last name 
--    Crocker. Use a SUBQUERY to do this, not a join.
SELECT id 
FROM orders 
  WHERE customer_id = 
    (SELECT id 
    FROM customers 
		WHERE fname='Elizabeth' AND lname='Crocker');

-----------------------------------------------------------------
--  PROBLEM 3
-----------------------------------------------------------------
--  Employees need to be scheduled for next week based on how 
--    many cupcakes have been ordered and not yet processed.

--  Write a query that gets the total number of cupcakes from 
--    unprocessed orders.
SELECT SUM(num_cupcakes) 
FROM orders
WHERE processed=false;

-----------------------------------------------------------------
--  PROBLEM 4
-----------------------------------------------------------------
--  Management needs an inventory report. They want to know how 
--    many cupcakes have been ordered of each type.

--  Write a query that shows the name of each cupcake and the sum 
--    of cupcakes ordered for that cupcake type (for both 
--    processed and unprocessed orders), sorted in ascending 
--    alphabetical order of cupcake name.

--  The report should show all cupcake types, even if they have 
--    not been ordered at all.
SELECT name, SUM(o.num_cupcakes)
FROM cupcakes AS c
	LEFT JOIN orders AS o
		ON c.id = o.cupcake_id
GROUP BY c.name
ORDER BY name ASC;