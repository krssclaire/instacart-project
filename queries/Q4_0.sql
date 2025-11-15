-- Test: trending active user time

WITH q2_trending_hrs AS (
    SELECT 
        order_dow,
        order_hour_of_day,
        COUNT(DISTINCT(user_id)) AS q2_users_count, 
        COUNT(DISTINCT(order_number)) AS q2_orders_count
    FROM orders
    WHERE eval_set = 'prior'
    GROUP BY 1, 2
), q3_trending_hrs AS (
    SELECT 
        order_dow,
        order_hour_of_day,
        COUNT(DISTINCT(user_id)) AS q3_users_count,
        COUNT(DISTINCT(order_number)) AS q3_orders_count
    FROM orders
    WHERE eval_set = 'train'
    GROUP BY 1, 2
)

SELECT *
FROM q2_trending_hrs q2
JOIN q3_trending_hrs q3
    ON q2.order_hour_of_day = q3.order_hour_of_day
ORDER BY 1, 2;