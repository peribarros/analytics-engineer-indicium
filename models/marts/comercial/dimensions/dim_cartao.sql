with stg_creditcard as (
    select *
    from {{ ref('stg_sales_creditcard') }}
)

select
    CreditCardID as cartao_id,
    CardType as tipo_cartao
from stg_creditcard