-- New users of Q2
SELECT 
    COUNT(DISTINCT user_id) 
FROM orders 
WHERE days_since_prior_order IS NULL;