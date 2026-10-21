with addresses as (
    select *
    from {{ ref('stg_person_address') }}
),

state_provinces as (
    select *
    from {{ ref('stg_person_stateprovince') }}
),

country_regions as (
    select *
    from {{ ref('stg_person_countryregion') }}
)

select
    addresses.pk_address as id_localidade,
    addresses.cidade_endereco as cidade,
    state_provinces.codigo_estado_provincia as estado,
    state_provinces.nome_estado_provincia as nome_estado,
    country_regions.pk_countryregioncode as pais,
    country_regions.pais_nome as nome_pais
from addresses
left join state_provinces
    on addresses.fk_stateprovince = state_provinces.pk_stateprovince
left join country_regions
    on state_provinces.fk_countryregioncode = country_regions.pk_countryregioncode