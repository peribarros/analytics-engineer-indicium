with source_data as (
    select *
    from {{ source('comercial', 'sales_customer') }}
),

renomeado as (
    select
        cast(customerid as int) as pk_customer
        , cast(personid as int) as fk_person
        , cast(storeid as int) as fk_store
        , cast(territoryid as int) as fk_territory
        , rowguid
        , cast(modifieddate as timestamp) as data_modificacao_consumidor
    from source_data
)

select *
from renomeado