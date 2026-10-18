with source_data as (
    select *
    from {{ source('comercial', 'sales_creditcard') }}
)

select *
from source_data