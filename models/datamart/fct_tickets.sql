with facts as(
select  eve.event_id
,       eve.event_name
,       sum(chg.charges_count) as sold
,       sum(res.refund_count) as refunded
from {{ ref('stg_event_info') }} eve
left outer join {{ ref ('stg_charges') }} chg
    on eve.transaction_id = chg.id
left outer join {{ ref ('stg_refunds') }} res
    on chg.id = res.charge_id
group by 1, 2
)
select  event_id
,       event_name
,       case 
            when sold is null 
                then 0 
            else sold 
        end as sold
,       case 
            when refunded is null 
                then 0 
            else refunded 
        end as refunded
from facts