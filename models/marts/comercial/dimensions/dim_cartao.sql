with cartao as (
    select * from {{ ref('stg_sales_creditcard') }}
)
select
    pk_creditcard,
    tipo_cartao,
    numero_cartao,
    mes_expiracao_cartao,
    ano_expiracao_cartao
from cartao