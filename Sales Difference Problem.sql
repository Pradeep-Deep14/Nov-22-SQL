CREATE TABLE sales (
         sale_id INT, 
         product_id INT, 
         sale_date DATE, 
         sales_amount DECIMAL(10, 2)
     );
     INSERT INTO sales VALUES 
         (1, 1, '2024-01-10', 50000.00), 
         (2, 1, '2024-02-20', 70000.00), 
         (3, 2, '2024-01-15', 30000.00), 
         (4, 1, '2024-03-10', 60000.00);


SELECT * FROM SALES

/*
Find the difference in sales between the current month and the previous month for each product.
*/


SELECT 	product_id, 
        sales_month, 
        sales_amount, 
        sales_amount - LAG(sales_amount) OVER (PARTITION BY product_id ORDER BY sales_month) AS sales_difference 
FROM (
      SELECT product_id, 
             DATE_TRUNC('month', sale_date) AS sales_month, 
             SUM(sales_amount) AS sales_amount 
      FROM sales 
      GROUP BY product_id, DATE_TRUNC('month', sale_date)
     ) AS monthly_sales;

