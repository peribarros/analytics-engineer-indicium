with customers as (
    select *
    from {{ ref('stg_sales_customer') }}
),

persons as (
    select *
    from {{ ref('stg_person_person') }}
)

select
    customers.pk_customer as cliente_id,
    customers.fk_person,
    persons.nome_completo_pessoa as nome,
    null as sobrenome,
    persons.nome_completo_pessoa as nome_completo,
    persons.tipo_pessoa
from customers
left join persons
    on customers.fk_person = persons.pk_businessentity