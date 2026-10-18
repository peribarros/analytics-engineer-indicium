with source_data as (
    select *
    from {{ source('comercial', 'sales_salesorderheadersalesreason') }}
)

select *
from source_data