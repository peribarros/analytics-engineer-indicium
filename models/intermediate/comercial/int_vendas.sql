with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)

select
    SalesOrderID as pedido_id,
    CustomerID as cliente_id,
    CreditCardID as cartao_id,
    ShipToAddressID as localidade_id,
    OrderDate as data_pedido,
    Status as status_pedido,
    SubTotal as subtotal,
    TaxAmt as impostos,
    Freight as frete,
    TotalDue as total_geral
from sales_header