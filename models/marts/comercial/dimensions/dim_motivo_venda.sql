with reasons as (
    select * from {{ ref('stg_sales_salesreason') }}
),

cleaned_reasons as (
    select
        pk_salesreason as motivo_venda_id,
        nome_motivo,
        tipo_motivo
    from reasons
    where nome_motivo is not null 
      and trim(nome_motivo) != ''
),

default_reason as (
    select
        0 as motivo_venda_id,
        'Não informado' as nome_motivo,
        'N/A' as tipo_motivo
)

select * from cleaned_reasons
union all
select * from default_reason