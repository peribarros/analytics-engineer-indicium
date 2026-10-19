with vendas_2011 as (
    select
        round(sum(subtotal), 2) as total_calculado
    from {{ ref('fct_vendas') }} f
    inner join {{ ref('dim_data') }} d
        on f.FK_data = d.data_id
    where d.ano = 2011
)

select
    total_calculado
from vendas_2011
-- O teste só falha se a diferença for maior que 1.00 (ou ajuste conforme necessário)
where abs(total_calculado - 12646112.16) > 1.00