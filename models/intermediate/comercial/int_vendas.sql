with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)

select
    sales_header.pk_salesorder as pedido_id,
    sales_header.fk_customer as cliente_id,
    sales_header.fk_creditcard as cartao_id,
    sales_header.fk_shiptoaddress as localidade_id,
    sales_header.data_pedido,
    sales_header.status_pedido,
    sales_header.subtotal,
    sales_header.valor_imposto as impostos,
    sales_header.frete,
    sales_header.total_geral
from sales_header