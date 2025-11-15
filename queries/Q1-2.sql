-- Delta products bought from Q2 to Q3
-- Products with an increase/decrease of demand

WITH prior AS (
    SELECT 
        product_id, 
        COUNT(*) AS total_orders_q2
    FROM order_products_prior
    GROUP BY product_id
), train AS (
    SELECT 
        product_id, 
        COUNT(*) AS total_orders_q3
    FROM order_products_train
    GROUP BY product_id
)
SELECT
    p.product_name,
    COALESCE(prior.total_orders_q2, 0) AS q2_orders,
    COALESCE(train.total_orders_q3, 0) AS q3_orders,
    COALESCE(train.total_orders_q3, 0) - COALESCE(prior.total_orders_q2, 0) AS order_diff
FROM products p
LEFT JOIN prior ON p.product_id = prior.product_id
LEFT JOIN train ON p.product_id = train.product_id
-- Edit ASC or DESC to see products with the most increase / decrese of demand
ORDER BY order_diff DESC
LIMIT 15;