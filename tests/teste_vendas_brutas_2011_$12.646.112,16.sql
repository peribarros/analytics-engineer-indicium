/*
    Esse teste certifica que as vendas brutas do ano de 2011 batem com o valor calculado de 12.641.672,52
*/

with
    vendas_por_ano as (
        select
            floor(d.fk_data / 10000) as ano,
            sum(f.subtotal) as total_vendas
        from {{ ref('fct_vendas') }} f
        inner join {{ ref('dim_data') }} d 
            on f.FK_data = d.fk_data
        group by 1
    )

select *
from vendas_por_ano
where
    ano = 2011
    and total_vendas not between 12641672.47 and 12641672.57