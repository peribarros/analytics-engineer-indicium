with sales_header as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)

select
    sales_header.pk_salesorder as pedido_id,
    sales_header.fk_customer as fk_cliente_id,
    
    -- Tratamento para enviar 0 em vez de NULL quando o pedido não tem cartão
    coalesce(sales_header.fk_creditcard, 0) as fk_cartao,
    
    sales_header.fk_shiptoaddress as fk_localidade,
    date_format(cast(sales_header.data_pedido as date), 'yyyyMMdd') as fk_data,
    
    -- Traduzindo os códigos numéricos para texto de status
    case 
        when sales_header.status_pedido = 1 then 'Em processamento'
        when sales_header.status_pedido = 2 then 'Aprovado'
        when sales_header.status_pedido = 3 then 'Em atraso'
        when sales_header.status_pedido = 4 then 'Rejeitado'
        when sales_header.status_pedido = 5 then 'Enviado'
        else 'Outro'
    end as status,
    
    sales_header.subtotal,
    sales_header.valor_imposto as impostos,
    sales_header.frete,
    sales_header.total_geral
from sales_header