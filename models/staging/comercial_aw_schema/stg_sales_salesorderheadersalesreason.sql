with source_data as (
    select *
    from {{ source('comercial', 'sales_salesorderheadersalesreason') }}
),

renomeado as (
    select
        cast(salesorderid as int) as fk_salesorder
        , cast(salesreasonid as int) as fk_salesreason
        , cast(modifieddate as timestamp) as data_modificacao
    from source_data
)

select *
from renomeado