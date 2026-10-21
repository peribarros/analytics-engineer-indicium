with address as (
    select * from {{ ref('stg_person_address') }}
),
stateprovince as (
    select * from {{ ref('stg_person_stateprovince') }}
),
countryregion as (
    select * from {{ ref('stg_person_countryregion') }}
)
select
    address.pk_address,
    address.cidade_endereco,
    stateprovince.nome_estado_provincia,
    countryregion.pais_nome
from address
left join stateprovince on address.fk_stateprovince = stateprovince.pk_stateprovince
left join countryregion on stateprovince.fk_countryregioncode = countryregion.pk_countryregioncode