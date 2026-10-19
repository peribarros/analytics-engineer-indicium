with int_cliente as (
    select *
    from {{ ref('int_cliente') }}
)

select
    cliente_id,
    BusinessEntityID,
    nome,
    sobrenome,
    nome_completo,
    PersonType
from int_cliente