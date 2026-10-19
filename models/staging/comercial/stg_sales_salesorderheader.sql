with source_data as (
    select *
    from {{ source('comercial', 'sales_salesorderheader') }}
)

select *
from source_data