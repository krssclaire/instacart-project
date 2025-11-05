-- Test: Instacart has generally lost or gained engagement?
SELECT 
    'Q2' AS quarter, COUNT(DISTINCT order_id) AS total_orders
FROM order_products_prior
UNION ALL
SELECT 
    'Q3' AS quarter, COUNT(DISTINCT order_id) AS total_orders
FROM order_products_train;