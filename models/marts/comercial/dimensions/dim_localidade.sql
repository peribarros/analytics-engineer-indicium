with int_localidade as (
    select *
    from {{ ref('int_localidade') }}
)

select
    id_localidade,
    cidade,
    estado,
    nome_estado,
    pais,
    nome_pais
from int_localidade