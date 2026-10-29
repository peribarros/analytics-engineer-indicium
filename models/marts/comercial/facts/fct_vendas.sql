with sales_details as (
    select * from {{ ref('stg_sales_salesorderdetail') }}
),

int_vendas as (
    select * from {{ ref('int_vendas') }}
),

int_motivo_venda as (
    select * from {{ ref('int_motivo_venda') }}
),

int_motivo_dedup as (
    select
        pedido_id,
        min(motivo_venda_id) as motivo_venda_id
    from int_motivo_venda
    group by pedido_id
)

select
    sales_details.salesorderid as pedido_id,
    sales_details.productid as fk_produto,    
    int_vendas.fk_cliente_id,
    int_vendas.fk_cartao,
    int_vendas.fk_localidade,
    
    -- Mantém o valor original da fonte (NULL para pedidos sem motivo mapeado)
    int_motivo_dedup.motivo_venda_id as fk_motivo_venda_id,
    
    int_vendas.fk_data,
    int_vendas.status,
    
    -- Métricas ao nível do item
    sales_details.quantidade as quantidade_comprada,
    sales_details.unitprice as preco_unitario,
    sales_details.linetotal as valor_total_negociado_produto,
    
    -- Métricas de contexto do cabeçalho
    int_vendas.subtotal,
    int_vendas.impostos,
    int_vendas.frete,
    int_vendas.total_geral
from sales_details
inner join int_vendas
    on sales_details.salesorderid = int_vendas.pedido_id
left join int_motivo_dedup
    on sales_details.salesorderid = int_motivo_dedup.pedido_id