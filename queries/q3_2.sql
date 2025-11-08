-- Average purchase frequency per user

SELECT
    eval_set, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user
FROM orders
WHERE eval_set IN('prior', 'train')
GROUP BY 1;
