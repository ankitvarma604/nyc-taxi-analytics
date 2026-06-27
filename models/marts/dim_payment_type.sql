select
    payment_type_id,
    payment_type_name,
    is_cashless

from (
    select 1 as payment_type_id, 'Credit Card' as payment_type_name, true  as is_cashless
    union all
    select 2, 'Cash',          false
    union all
    select 3, 'No Charge',     false
    union all
    select 4, 'Dispute',       false
    union all
    select 5, 'Unknown',       false
    union all
    select 6, 'Voided Trip',   false
)