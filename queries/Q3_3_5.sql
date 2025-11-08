-- Distribution of number of orders per user (Q2/Q3)

WITH user_orders AS (
    SELECT 
        user_id,
        eval_set,
        COUNT(order_id) AS total_orders
    FROM orders
    WHERE eval_set IN ('prior', 'train')
    GROUP BY user_id, eval_set
),
buckets AS (
    SELECT
        user_id,
        eval_set,
        CASE 
            WHEN total_orders = 1 THEN '1 ordine'
            WHEN total_orders BETWEEN 2 AND 5 THEN '2-5 ordini'
            WHEN total_orders BETWEEN 6 AND 10 THEN '6-10 ordini'
            WHEN total_orders BETWEEN 11 AND 20 THEN '11-20 ordini'
            ELSE '20+ ordini'
        END AS order_bucket
    FROM user_orders
)
SELECT
    eval_set AS quarter,
    order_bucket,
    COUNT(user_id) AS users_in_bucket,
    ROUND(100.0 * COUNT(user_id) / SUM(COUNT(user_id)) OVER (PARTITION BY eval_set), 2) AS percent_of_users
FROM buckets
GROUP BY eval_set, order_bucket
ORDER BY eval_set, users_in_bucket DESC;