with customers as (
    select *
    from {{ ref('stg_sales_customer') }}
),

persons as (
    select *
    from {{ ref('stg_person_person') }}
)

select
    c.CustomerID as cliente_id,
    c.PersonID as BusinessEntityID,
    p.FirstName as nome,
    p.LastName as sobrenome,
    concat(p.FirstName, ' ', p.LastName) as nome_completo,
    p.PersonType
from customers c
left join persons p
    on c.PersonID = p.BusinessEntityID