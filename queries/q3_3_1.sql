-- Amount of churned users from Q2 to Q3

WITH q2_users AS (
    SELECT DISTINCT(user_id)
    FROM orders
    WHERE eval_set = 'prior'
), q3_users AS (
    SELECT DISTINCT(user_id)
    FROM orders
    WHERE eval_set = 'train'
)

SELECT COUNT(*) AS churned_users_count
FROM q2_users
WHERE user_id NOT IN(SELECT user_id FROM q3_users);

/*
-- comment previous SELECT query and uncomment this one to verify if in Q3 there are new users
SELECT COUNT(*) AS new_users
FROM q3_users
WHERE user_id NOT IN(SELECT user_id FROM q2_users);
*/