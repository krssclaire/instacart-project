-- Churned users by department and percentage on total users

WITH q2_users AS ( 
    SELECT 
        DISTINCT(user_id) 
    FROM orders 
    WHERE eval_set = 'prior' 
), q3_users AS ( 
    SELECT 
        DISTINCT(user_id) 
    FROM orders 
    WHERE eval_set = 'train' 
), churned_users AS ( 
    SELECT user_id 
    FROM q2_users 
    WHERE user_id NOT IN(SELECT user_id FROM q3_users) 
), product_department AS ( 
    SELECT 
        p.product_id, 
        p.product_name, 
        d.department 
    FROM products p 
    INNER JOIN departments d 
        ON p.department_id = d.department_id 
), churned_dept AS (
    SELECT
        pd.department, 
        COUNT(DISTINCT(cu.user_id)) AS churned_user_count
    FROM churned_users cu
    JOIN orders o 
        ON cu.user_id = o.user_id
    JOIN order_products_prior op 
        ON o.order_id = op.order_id
    JOIN product_department pd 
        ON pd.product_id = op.product_id
    GROUP BY pd.department
)

SELECT
    department, 
    churned_user_count,
    ROUND((churned_user_count * 100 / SUM(churned_user_count) OVER()), 2) percent_on_total
FROM churned_dept    
GROUP BY 1, 2
ORDER BY churned_user_count DESC;