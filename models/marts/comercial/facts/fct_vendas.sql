with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
),

int_motivo as (
    select *
    from {{ ref('int_motivo_venda') }}
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
left join int_motivo m
    on v.SalesOrderID = m.pedido_id