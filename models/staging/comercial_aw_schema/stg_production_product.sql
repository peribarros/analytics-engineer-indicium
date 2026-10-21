with source_data as (
    select *
    from {{ source('comercial', 'production_product') }}
),

renomeado as (
    select
        cast(productid as int) as pk_product,
        name as nome_produto,
        productnumber as numero_produto,
        makeflag as flag_fabricacao_produto,
        finishedgoodsflag as flag_produto_acabado,
        color as cor_produto,
        cast(safetystocklevel as int) as nivel_estoque_seguranca_produto,
        cast(reorderpoint as int) as ponto_reposicao_produto,
        cast(standardcost as decimal(18,2)) as custo_padrao_produto,
        cast(listprice as decimal(18,2)) as preco_lista_produto,
        size as tamanho_produto,
        sizeunitmeasurecode as codigo_unidade_medida_tamanho_produto,
        weightunitmeasurecode as codigo_unidade_medida_peso_produto,
        cast(weight as decimal(18,2)) as peso_produto,
        cast(daystomanufacture as int) as dias_para_fabricar_produto,
        productline as linha_produto,
        class as classe_produto,
        style as estilo_produto,
        cast(productsubcategoryid as int) as fk_productsubcategory,
        cast(productmodelid as int) as fk_productmodel,
        cast(sellstartdate as timestamp) as data_inicio_venda_produto,
        cast(sellenddate as timestamp) as data_fim_venda_produto,
        cast(discontinueddate as timestamp) as data_descontinuacao_produto,
        rowguid,
        cast(modifieddate as timestamp) as data_modificacao_produto
    from source_data
)

select *
from renomeado