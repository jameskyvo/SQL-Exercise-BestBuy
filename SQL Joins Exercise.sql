/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT * FROM products
 LEFT JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE products.CategoryID AND categories.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT * FROM products
 LEFT JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
 select * from categories;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) AS Total FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name FROM departments
INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' or categories.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, Sum(sales.Quantity) AS 'Total Sold', sum(sales.Quantity * sales.PricePerUnit) AS 'Total Price' from products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California'; 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV' AND reviews.Rating = 1
LIMIT 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.FirstName, employees.LastName, products.Name, Sum(sales.Quantity) as 'Total Sold' FROM Sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products on products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.FirstName;



