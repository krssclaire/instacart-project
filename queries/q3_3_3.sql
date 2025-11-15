-- Users with most order lag days
SELECT
    eval_set AS quarter,
    days_since_prior_order,
    COUNT(user_id) AS orders_count,
    ROUND(100.0 * COUNT(user_id) / SUM(COUNT(user_id)) OVER (PARTITION BY eval_set), 2) AS percent_of_orders
FROM orders
WHERE days_since_prior_order IS NOT NULL
    AND eval_set IN('prior', 'train')
GROUP BY eval_set, days_since_prior_order
ORDER BY eval_set, days_since_prior_order DESC;