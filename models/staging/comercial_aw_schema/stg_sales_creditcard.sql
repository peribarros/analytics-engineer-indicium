with source_data as (
    select *
    from {{ source('comercial', 'sales_creditcard') }}
),

renomeado as (
    select
        cast(creditcardid as int) as pk_creditcard
        , cardtype as tipo_cartao
        , cardnumber as numero_cartao
        , cast(expmonth as int) as mes_expiracao_cartao
        , cast(expyear as int) as ano_expiracao_cartao
        , cast(modifieddate as timestamp) as data_modificacao_cartao
    from source_data
)

select *
from renomeado