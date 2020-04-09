select 
    ID as payment_id,
    "orderID" as order_id,
    (AMOUNT / 100) as amount
from {{ source('stripe', 'payment') }}