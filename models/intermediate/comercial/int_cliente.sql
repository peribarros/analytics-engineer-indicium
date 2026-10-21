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
    customers.fk_person as business_entity_id,
    persons.nome_completo_pessoa,
    persons.tipo_pessoa
from customers
inner join persons
    on customers.fk_person = persons.pk_businessentity