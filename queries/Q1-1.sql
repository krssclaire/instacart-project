-- Most sold products in Q2 / Q3 (top 10)

WITH most_sold_products_prior AS (
    SELECT
        'Q2' AS dataset,
        products.product_id,
        products.product_name,
        COUNT(prior_order.order_id) AS total_orders
    FROM order_products_prior AS prior_order
    INNER JOIN products 
        ON products.product_id = prior_order.product_id 
    GROUP BY products.product_id
    ORDER BY 4 DESC
), most_sold_products_train AS (
    SELECT
        'Q3' AS dataset,
        products.product_id,
        products.product_name,
        COUNT(train_order.order_id) AS total_orders
    FROM order_products_train AS train_order
    INNER JOIN products 
        ON products.product_id = train_order.product_id 
    GROUP BY products.product_id
    ORDER BY 4 DESC
)

SELECT *
--edit most_sold_products to view prior/train sellings
FROM most_sold_products_prior
LIMIT 10;