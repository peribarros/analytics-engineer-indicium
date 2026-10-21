with source_data as (
    select *
    from {{ source('comercial', 'sales_salesreason') }}
),

renomeado as (
    select
        cast(salesreasonid as int) as pk_salesreason
        , name as nome_motivo
        , reasontype as tipo_motivo
        , cast(modifieddate as timestamp) as data_modificacao_motivo
    from source_data
)

select *
from renomeado