CREATE TABLE product_revenue (product_name VARCHAR(255), year INTEGER, revenue DECIMAL(10, 2));
  INSERT INTO product_revenue (product_name, year, revenue) VALUES
  ('Product A', 2022, 10000.00),
  ('Product A', 2023, 9500.00),
  ('Product B', 2022, 15000.00),
  ('Product B', 2023, 14500.00),
  ('Product C', 2022, 8000.00),
  ('Product C', 2023, 8500.00),
  ('Product D', 2022, 12000.00),
  ('Product D', 2023, 12500.00),
  ('Product E', 2022, 20000.00),
  ('Product E', 2023, 19000.00),
  ('Product F', 2022, 7000.00),
  ('Product F', 2023, 7200.00),
  ('Product G', 2022, 18000.00),
  ('Product G', 2023, 17000.00),
  ('Product H', 2022, 3000.00),
  ('Product H', 2023, 3200.00),
  ('Product I', 2022, 9000.00),
  ('Product I', 2023, 9200.00),
  ('Product J', 2022, 6000.00),
  ('Product J', 2023, 5900.00);

SELECT * FROM PRODUCT_REVENUE


/*
Find the top 5 products whose revenue has decreased in comparison to the previous year (both 2022 and 2023). 
Return the product name, revenue for the previous year, revenue for the current year, revenue decreased, and the decreased ratio (percentage).
*/

SELECT 
    product_name,
    revenue_for_previous_year,
    revenue_for_current_year,
    (revenue_for_previous_year - revenue_for_current_year) AS revenue_decreased,
    ((revenue_for_previous_year - revenue_for_current_year) / revenue_for_previous_year * 100) AS decreased_ratio
FROM
(
    SELECT 
        product_name,
        year,
        revenue AS revenue_for_current_year,
        LAG(revenue, 1) OVER (PARTITION BY product_name ORDER BY year) AS revenue_for_previous_year
    FROM 
        product_revenue
) AS a
WHERE 
    year = 2023
    AND revenue_for_current_year < revenue_for_previous_year
ORDER BY 
    revenue_decreased DESC
LIMIT 5;





