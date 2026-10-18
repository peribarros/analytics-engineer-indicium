with source_data as (
    select *
    from {{ source('comercial', 'sales_salesreason') }}
)

select *
from source_data