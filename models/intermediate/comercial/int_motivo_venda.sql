with header_reasons as (
    select *
    from {{ ref('stg_sales_salesorderheadersalesreason') }}
),

reasons as (
    select *
    from {{ ref('stg_sales_salesreason') }}
)

select
    hr.SalesOrderID as pedido_id,
    r.SalesReasonID as motivo_venda_id,
    r.Name as nome_motivo,
    r.ReasonType as tipo_motivo
from header_reasons hr
left join reasons r
    on hr.SalesReasonID = r.SalesReasonID