with source_data as (
    select *
    from {{ source('comercial', 'sales_customer') }}
)

select *
from source_data