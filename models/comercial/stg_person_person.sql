with source_data as (
    select *
    from {{ source('comercial', 'person_person') }}
)

select *
from source_data