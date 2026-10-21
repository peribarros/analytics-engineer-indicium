with header_reasons as (
    select * from {{ ref('stg_sales_salesorderheadersalesreason') }}
),
reasons as (
    select * from {{ ref('stg_sales_salesreason') }}
),
int_motivo_venda as (
    select
        header_reasons.fk_salesorder as pedido_id,
        reasons.pk_salesreason as motivo_venda_id,
        reasons.nome_motivo,
        reasons.tipo_motivo
    from header_reasons
    left join reasons
        on header_reasons.fk_salesreason = reasons.pk_salesreason
),
sales_header as (
    select * from {{ ref('stg_sales_salesorderheader') }}
),
int_motivo_dedup as (
    select
        pedido_id,
        min(motivo_venda_id) as motivo_venda_id
    from int_motivo_venda
    group by pedido_id
)
select
    sales_header.pk_salesorder as pedido_id,
    sales_header.fk_customer as FK_cliente_id,
    sales_header.fk_creditcard as FK_cartao,
    sales_header.fk_shiptoaddress as FK_localidade,
    int_motivo_dedup.motivo_venda_id as FK_motivo_venda_id,
    date_format(cast(sales_header.data_pedido as date), 'yyyyMMdd') as FK_data,
    sales_header.subtotal,
    sales_header.valor_imposto as impostos,
    sales_header.frete as frete,
    sales_header.total_geral
from sales_header
left join int_motivo_dedup
    on sales_header.pk_salesorder = int_motivo_dedup.pedido_id