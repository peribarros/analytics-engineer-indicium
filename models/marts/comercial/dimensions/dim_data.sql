with sales as (
    select * from {{ ref('stg_sales_salesorderheader') }}
)
select distinct
    date_format(cast(data_pedido as date), 'yyyyMMdd') as fk_data,
    cast(data_pedido as date) as data,
    year(data_pedido) as ano,
    month(data_pedido) as mes,
    day(data_pedido) as dia
from sales
where data_pedido is not null