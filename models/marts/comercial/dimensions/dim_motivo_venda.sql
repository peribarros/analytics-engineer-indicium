with header_reasons as (
    select * from {{ ref('stg_sales_salesorderheadersalesreason') }}
),
reasons as (
    select * from {{ ref('stg_sales_salesreason') }}
)
select
    header_reasons.fk_salesorder as pedido_id,
    reasons.pk_salesreason as motivo_venda_id,
    reasons.nome_motivo,
    reasons.tipo_motivo
from header_reasons
left join reasons
    on header_reasons.fk_salesreason = reasons.pk_salesreason