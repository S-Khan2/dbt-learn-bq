/*
    Refunds have a negative amount, so the total amount of successful payments should always be >= 0.
    Return all records where this isn't true, to make the test fail.
*/

SELECT
    order_id,
    SUM(amount) as total_amount
FROM {{ ref('stg_payments') }}
WHERE status = 'success'
GROUP BY 1
HAVING total_amount < 0