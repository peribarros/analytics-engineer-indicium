with source_data as (
    select *
    from {{ source('comercial', 'person_stateprovince') }}
),

renomeado as (
    select
        cast(stateprovinceid as int) as pk_stateprovince
        , stateprovincecode as codigo_estado_provincia
        , countryregioncode as fk_countryregioncode
        , isonlystateprovinceflag as flag_unico_estado_provincia
        , name as nome_estado_provincia
        , cast(territoryid as int) as fk_territory
        , rowguid
        , cast(modifieddate as timestamp) as data_modificacao_provincia
    from source_data
)

select *
from renomeado