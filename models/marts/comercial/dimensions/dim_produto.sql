with stg_product as (
    select *
    from {{ ref('stg_production_product') }}
)

select
    ProductID as produto_id,
    Name as nome_produto,
    ProductNumber,
    Color,
    ListPrice
from stg_product