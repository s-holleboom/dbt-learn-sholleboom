select id
,   charge_id
,   1 as refund_count
 from raw.learn_stripe.refunds
 where status = 'succeeded'

 --{{ source('stripe', 'payment') }}