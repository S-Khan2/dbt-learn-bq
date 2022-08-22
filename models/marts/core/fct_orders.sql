WITH orders AS (
    SELECT * FROM {{ ref('stg_orders')}}
),

succeeded_payments AS (
    SELECT
        payment_id,
        order_id,
        amount
    FROM {{ ref('stg_payments') }}
    WHERE status = 'success'
),

order_payments AS (
    SELECT 
        order_id,
        COUNT(*) AS number_suborders,
        SUM(amount) AS amount
    FROM succeeded_payments
    GROUP BY 1
),

final AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        COALESCE(order_payments.number_suborders, 0) AS number_suborders,
        COALESCE(order_payments.amount, 0) AS amount
    FROM orders
    LEFT JOIN order_payments USING (order_id)
)

SELECT * FROM final