with source_data as (
    select *
    from {{ source('comercial', 'person_countryregion') }}
),

renomeado as (
    select
        cast(countryregioncode as string) as pk_countryregioncode
        , name as pais_nome
        , cast(modifieddate as timestamp) as data_modificacao_pais
    from source_data
)

select *
from renomeado