select order_id
, event_id
, event_name
, order_items
, tickets_purchased
, transaction_id
 from raw.ticket_tailor.orders

--{{ source('stripe', 'payment') }}