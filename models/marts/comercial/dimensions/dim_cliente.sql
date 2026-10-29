with cliente as (
    select * from {{ ref('stg_sales_customer') }}
),
person as (
    select * from {{ ref('stg_person_person') }}
)
select 
    cliente.pk_customer as cliente_id,
    cliente.fk_person,
    person.pk_businessentity,
    -- Substitui NULLs e textos vazios por "Não informado / Pessoa Jurídica"
    coalesce(
        nullif(trim(person.nome_completo_pessoa), ''), 
        'Cliente Não Identificado'
    ) as nome_completo_pessoa,
    person.tipo_pessoa
from cliente
left join person on cliente.fk_person = person.pk_businessentity