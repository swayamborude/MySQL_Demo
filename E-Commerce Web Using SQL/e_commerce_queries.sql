USE `e-commerce_db`;

# Perform Some Queries to e-commerce website database

# Q1.Display total number of orders placed by AAKASH
SELECT COUNT(*) AS 'Number of Orders'
FROM Customer
JOIN Orders USING (CUS_ID)
WHERE CUS_NAME Like 'AAKASH';

# Q2.Total count of orders by Akash and Aman Collectively
SELECT COUNT(*) AS 'Number of Orders'
FROM Customer
JOIN Orders USING (CUS_ID)
WHERE CUS_NAME IN ('AAKASH','AMAN');

# Q3.Display names of customers staying in either Delhi or Mumbai
Select CUS_NAME
from Customer
WHERE CUS_CITY
IN ('MUMBAI','DELHI');

# Q4.Name of supplier and total prices of products delivered by that supplier
SELECT SUPP_NAME, SUM(SUPPLIER_PRICE) AS 'Total Supplies'
FROM Supplier
JOIN Supplier_Pricing USING (SUPP_ID)
GROUP BY SUPP_NAME
ORDER BY 'Total Supplies';

# Q5.Display total number of products shipped from each city
SELECT SUPP_CITY, COUNT(*)
FROM Supplier JOIN Supplier_Pricing
USING (SUPP_ID) GROUP BY SUPP_CITY;

# Q6.Display total number of products shipped from Delhi
SELECT Supp_City, COUNT( * )
FROM Supplier
JOIN Supplier_Pricing
USING (Supp_Id)
GROUP BY Supp_City
HAVING Supp_City LIKE 'DELHI';

# Q7.Display name and price of products supplied by 'Rajesh Retails'.
SELECT Pro_Name, Supplier_Price
FROM Supplier
JOIN Supplier_Pricing
USING (Supp_Id)
JOIN Product
USING (Pro_Id)
WHERE Supp_Name LIKE 'Rajesh Retails';

# Q8.Display name of customers who have placed more than 3 orders
SELECT Cus_Name, COUNT( * )
FROM Customer
JOIN Orders
USING (Cus_Id)
GROUP BY Cus_Name
HAVING COUNT( * ) >3;

# Q9.Display name of customers who have not placed any order
SELECT cus_name
FROM customer
LEFT JOIN orders
USING ( cus_id )
WHERE ord_id IS NULL;

# Q10.Display all the orders along with product name ordered by a customer 'AAKASH'
SELECT Cus_Name, Ord_Id, Pro_Name
FROM Customer
JOIN Orders
USING (Cus_Id)
JOIN Supplier_Pricing
USING (Pricing_Id)
JOIN Product
USING (Pro_Id)
WHERE Cus_Name LIKE 'AAKASH';

# Q11.Display the Supplier details of who is supplying more than two product
SELECT Supp_Name
FROM Supplier
JOIN Supplier_Pricing
USING (Supp_Id)
GROUP BY Supp_Name
HAVING COUNT( * ) >2;

# Q12. Display the Id and Name of the Product ordered after “2021-10-05”
SELECT Pro_Id, Pro_Name
FROM Product
JOIN Supplier_Pricing
USING (Pro_Id)
JOIN Orders
USING (Pricing_Id)
WHERE Ord_Date > '2021-10-05';

# Q13.Display avg rating of each supplier
SELECT Supp_Name, AVG( RATING_Stars )
FROM Rating
JOIN Orders
USING (Ord_Id)
JOIN Supplier_Pricing
USING (Pricing_Id)
JOIN Supplier
USING (Supp_Id)
GROUP BY Supp_Name;

# Q14.Based on the avg rating of the supplier display his category(i.e excellent, v good, good..)
# >4.5  Excellent
# >3.5 Good
# >2.5 Average
# Less the 2.5 Poor
SELECT supp_name, AVG(RATING_STARS) ,
CASE
WHEN AVG(RATING_STARS) > 4.5
THEN 'Excellent'
WHEN AVG (RATING_STARS) > 3.5
THEN 'Good'
WHEN AVG (RATING_STARS) > 2.5
THEN 'Average'
ELSE 'Poor'
END AS 'Supplier Category'
FROM Rating
JOIN Orders
USING (Ord_Id)
JOIN Supplier_Pricing
USING (Pricing_Id)
JOIN Supplier
USING (Supp_Id)
GROUP BY Supp_Name
ORDER BY AVG (RATING_STARS) DESC;
