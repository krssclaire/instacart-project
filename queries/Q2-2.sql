-- Best seller departments: demand analysis

WITH dept_products AS (
    SELECT department_id,
           COUNT(*) AS total_products
    FROM products
    GROUP BY department_id
), dept_sales_q2 AS (
    SELECT p.department_id,
           COUNT(*) AS q2_orders
    FROM order_products_prior op
    JOIN products p ON op.product_id = p.product_id
    GROUP BY p.department_id
), dept_sales_q3 AS (
    SELECT p.department_id,
           COUNT(*) AS q3_orders
    FROM order_products_train op
    JOIN products p ON op.product_id = p.product_id
    GROUP BY p.department_id
)

SELECT
    d.department,
    COALESCE(dp.total_products, 0) AS total_products,
    COALESCE(ds2.q2_orders, 0) AS q2_orders,
    COALESCE(ds3.q3_orders, 0) AS q3_orders,
    (COALESCE(ds3.q3_orders,0) - COALESCE(ds2.q2_orders,0)) AS order_diff
FROM departments d
LEFT JOIN dept_products dp ON d.department_id = dp.department_id
LEFT JOIN dept_sales_q2 ds2 ON d.department_id = ds2.department_id
LEFT JOIN dept_sales_q3 ds3 ON d.department_id = ds3.department_id
-- Edit ASC or DESC to see departments with the most increase / decrese of demand
ORDER BY order_diff ASC;