/*
    Modularising dim_customers model: 
    Convert customers CTE to an intermediate stg_customers model
*/

WITH customers AS (
    SELECT
        id AS customer_id,
        first_name,
        last_name
    FROM jaffle_shop.customers
)

SELECT * FROM customers