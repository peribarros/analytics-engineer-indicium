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
    a.AddressID as id_localidade,
    a.City as cidade,
    sp.StateProvinceCode as estado,
    sp.Name as nome_estado,
    cr.CountryRegionCode as pais,
    cr.Name as nome_pais
from addresses a
left join state_provinces sp
    on a.StateProvinceID = sp.StateProvinceID
left join country_regions cr
    on sp.CountryRegionCode = cr.CountryRegionCode