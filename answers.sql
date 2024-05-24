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
FROM public.orders 
  WHERE customer_id = 
    (SELECT id 
    FROM customers 
		WHERE fname='Elizabeth' AND lname='Crocker');

