with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)

select
    sales_header.pk_salesorder as pedido_id,
    sales_header.fk_customer as fk_cliente_id,
    sales_header.fk_creditcard as fk_cartao,
    sales_header.fk_shiptoaddress as fk_localidade,
    date_format(cast(sales_header.data_pedido as date), 'yyyyMMdd') as fk_data,
    sales_header.status_pedido,
    sales_header.subtotal,
    sales_header.valor_imposto as impostos,
    sales_header.frete,
    sales_header.total_geral
from sales_header