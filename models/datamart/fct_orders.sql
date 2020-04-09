select  orders.order_id
,       customer.customer_id
,       payment.amount
,       orders.order_date
,       orders.status
from {{ ref('stg_orders') }} orders
left outer join {{ ref('stg_customers') }} customer on customer.customer_id = orders.customer_id
left outer join {{ ref('stg_payments') }} payment on payment.order_id = orders.order_id