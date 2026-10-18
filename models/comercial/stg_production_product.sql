with source_data as (
    select *
    from {{ source('comercial', 'production_product') }}
)

select *
from source_data