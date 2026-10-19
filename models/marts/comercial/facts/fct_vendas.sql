with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
),

int_motivo_dedup as (
    -- Deduplica os motivos por pedido para evitar a duplicação de métricas financeiras
    select
        pedido_id,
        min(motivo_venda_id) as motivo_venda_id
    from {{ ref('int_motivo_venda') }}
    group by pedido_id
)

select
    v.SalesOrderID as pedido_id,
    v.CustomerID as FK_cliente_id,
    v.CreditCardID as FK_cartao,
    v.ShipToAddressID as FK_localidade,
    m.motivo_venda_id as FK_motivo_venda_id,
    date_format(cast(v.OrderDate as date), 'yyyyMMdd') as FK_data,
    v.SubTotal as subtotal,
    v.TaxAmt as impostos,
    v.Freight as frete,
    v.TotalDue as total_geral
from sales_header v
left join int_motivo_dedup m
    on v.SalesOrderID = m.pedido_id