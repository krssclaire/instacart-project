-- Best producer departments: supply analysis

WITH product_source AS (
    SELECT 
        p.product_id,
        p.product_name,
        d.department,
        a.aisle
    FROM products p
    INNER JOIN aisles a
        ON p.aisle_id = a.aisle_id
    INNER JOIN departments d
        ON p.department_id = d.department_id
)

SELECT 
    department,
    COUNT(product_id) AS products
FROM product_source
GROUP BY department
ORDER BY 2 DESC;