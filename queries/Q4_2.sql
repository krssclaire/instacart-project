-- Most active days of week

WITH q2_trending_dow AS (
    SELECT 
        order_dow,
        COUNT(DISTINCT(user_id)) AS q2_users_count,
        COUNT(DISTINCT(order_number)) AS q2_orders_count
    FROM orders
    WHERE eval_set = 'prior'
    GROUP BY 1
), q3_trending_dow AS (
    SELECT 
        order_dow,
        COUNT(DISTINCT(user_id)) AS q3_users_count,
        COUNT(DISTINCT(order_number)) AS q3_orders_count
    FROM orders
    WHERE eval_set = 'train'
    GROUP BY 1
)

SELECT *
FROM q2_trending_dow q2
JOIN q3_trending_dow q3
    ON q2.order_dow = q3.order_dow
ORDER BY 1;