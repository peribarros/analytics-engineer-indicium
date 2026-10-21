with cliente as (
    select * from {{ ref('stg_sales_customer') }}
),
person as (
    select * from {{ ref('stg_person_person') }}
)
select 
    cliente.pk_customer as customerid,
    cliente.fk_person,
    person.pk_businessentity,
    person.nome_completo_pessoa,
    person.tipo_pessoa
from cliente
left join person on cliente.fk_person = person.pk_businessentity