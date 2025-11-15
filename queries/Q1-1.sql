-- Most sold products (top 10) in Q2 and Q3 by absolute frequency

WITH most_sold_products_prior AS (
    SELECT
        'Q2' AS dataset,
        products.product_name,
        COUNT(prior_order.product_id) AS total_orders
    FROM order_products_prior AS prior_order
    INNER JOIN products 
        ON products.product_id = prior_order.product_id 
    GROUP BY products.product_id
    ORDER BY 3 DESC
    LIMIT 10
), most_sold_products_train AS (
    SELECT
        'Q3' AS dataset,
        products.product_name,
        COUNT(train_order.product_id) AS total_orders
    FROM order_products_train AS train_order
    INNER JOIN products 
        ON products.product_id = train_order.product_id 
    GROUP BY products.product_id
    ORDER BY 3 DESC
    LIMIT 10
)

SELECT *
FROM most_sold_products_prior 

UNION ALL 

SELECT *
FROM most_sold_products_train;