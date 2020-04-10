select id
, 1 as charges_count
 from raw.learn_stripe.charges
 where status = 'paid'

 --{{ source('stripe', 'payment') }}