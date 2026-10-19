with date_spine as (
    select distinct cast(OrderDate as date) as data
    from {{ ref('stg_sales_salesorderheader') }}
)

select
    date_format(data, 'yyyyMMdd') as data_id,
    data as full_date,
    day(data) as dia,
    month(data) as mes,
    year(data) as ano,
    date_format(data, 'yyyy-MM') as ano_mes
from date_spine