with products as (
    select * from {{ ref('stg_production_product') }}
)

select 
    products.pk_product as productid,
    products.nome_produto,
    products.numero_produto,
    products.cor_produto,
    products.preco_lista_produto,
    products.custo_padrao_produto
from products