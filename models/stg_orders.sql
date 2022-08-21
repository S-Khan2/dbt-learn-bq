/*
    Modularising dim_customers model: 
    Convert orders CTE to an intermediate stg_orders model
*/

WITH orders AS (
    SELECT
        id AS order_id,
        user_id AS customer_id,
        order_date,
        status
    FROM jaffle_shop.orders
)

SELECT * FROM orders