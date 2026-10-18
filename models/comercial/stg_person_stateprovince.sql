with source_data as (
    select *
    from {{ source('comercial', 'person_stateprovince') }}
)

select *
from source_data