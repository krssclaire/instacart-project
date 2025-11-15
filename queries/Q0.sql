-- General total dataset recap
SELECT 
    'Q2' AS dataset,
    COUNT(DISTINCT user_id) AS total_users, 
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(*) AS total_lines, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user,
    ROUND((COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id)), 2) AS orders_per_user
FROM orders
WHERE eval_set IN('prior')
GROUP BY 1

UNION ALL

SELECT 
    'Q3' AS dataset,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(*) AS total_lines, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user,
    ROUND((COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id)), 2) AS orders_per_user
FROM orders
WHERE eval_set IN('train')
GROUP BY 1

UNION ALL

SELECT 
    'Test' AS dataset,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(*) AS total_lines, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user,
    ROUND((COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id)), 2) AS orders_per_user
FROM orders
WHERE eval_set IN('test')
GROUP BY 1

UNION ALL

SELECT 
    'Q2 + Q3' AS dataset,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(*) AS total_lines, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user,
    ROUND((COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id)), 2) AS orders_per_user
FROM orders
WHERE eval_set IN('prior', 'train')
GROUP BY 1

UNION ALL

SELECT 
    'orders' AS dataset,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(*) AS total_lines, 
    ROUND(AVG(order_number), 2) AS avg_orders_per_user,
    ROUND((COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id)), 2) AS orders_per_user
FROM orders
WHERE eval_set IN('prior', 'train', 'test')
GROUP BY 1;