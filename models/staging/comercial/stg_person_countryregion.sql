with source_data as (
    select *
    from {{ source('comercial', 'person_countryregion') }}
)

select *
from source_data