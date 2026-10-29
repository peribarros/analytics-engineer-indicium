with cartao as (
    select * from {{ ref('stg_sales_creditcard') }}
),

cartao_tratado as (
    select
        pk_creditcard,
        -- Trata nulos, strings vazias e espaços, substituindo por 'Não informado'
        coalesce(nullif(trim(tipo_cartao), ''), 'Não informado') as tipo_cartao,
        numero_cartao,
        mes_expiracao_cartao,
        ano_expiracao_cartao
    from cartao
),

-- Inserir explicitamente a linha 0 para corresponder ao COALESCE da tabela de fato
cartao_com_padrao as (
    select 
        0 as pk_creditcard,
        'Não informado' as tipo_cartao,
        null as numero_cartao,
        null as mes_expiracao_cartao,
        null as ano_expiracao_cartao
    
    union all
    
    select * from cartao_tratado
)

select * from cartao_com_padrao