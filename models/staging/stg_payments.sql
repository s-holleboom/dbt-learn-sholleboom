select 
    ID as payment_id,
    "orderID" as order_id,
    "paymentMethod" as payment_method,
    (AMOUNT / 100) as amount,
    created
from {{ source('stripe', 'payment') }}