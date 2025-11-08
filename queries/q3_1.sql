-- Total users per quarter 
-- Test: is the decrease of sales due to a decrease of products 
--       sales or decrease of active users?

SELECT 
    'Q2' AS quarter, COUNT(DISTINCT user_id) AS total_users
FROM orders
WHERE eval_set = 'prior'

UNION ALL

SELECT 
    'Q3' AS quarter, COUNT(DISTINCT user_id) AS total_users
FROM orders
WHERE eval_set = 'train'