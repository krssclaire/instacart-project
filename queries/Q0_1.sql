-- Totals or tables

SELECT 
    'products' AS table_name,
    COUNT(*) AS total_count
FROM products

UNION ALL

SELECT 
    'departments' AS table_name,
    COUNT(*) AS total_count
FROM departments

UNION ALL

SELECT 
    'aisles' AS table_name,
    COUNT(*) AS total_count
FROM aisles

UNION ALL

SELECT 
    'orders' AS table_name,
    COUNT(*) AS total_count
FROM orders