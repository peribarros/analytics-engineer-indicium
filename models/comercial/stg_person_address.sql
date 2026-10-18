with source_data as (
    select *
    from {{ source('comercial', 'person_address') }}
)

select *
from source_data