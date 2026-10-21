with source_data as (
    select *
    from {{ source('comercial', 'sales_salesorderheader') }}
),

renomeado as (
    select
        cast(salesorderid as int) as pk_salesorder
        , cast(revisionnumber as int) as numero_revisao
        , cast(orderdate as timestamp) as data_pedido
        , cast(duedate as timestamp) as data_vencimento
        , cast(shipdate as timestamp) as data_envio
        , cast(status as int) as status_pedido
        , onlineorderflag as flag_pedido_online
        , purchaseordernumber as numero_pedido_compra
        , accountnumber as numero_conta
        , cast(customerid as int) as fk_customer
        , cast(salespersonid as int) as fk_salesperson
        , cast(territoryid as int) as fk_territory
        , cast(billtoaddressid as int) as fk_billtoaddress
        , cast(shiptoaddressid as int) as fk_shiptoaddress
        , cast(shipmethodid as int) as fk_shipmethod
        , cast(creditcardid as int) as fk_creditcard
        , creditcardapprovalcode as codigo_aprovacao_cartao
        , cast(currencyrateid as int) as fk_currencyrate
        , cast(subtotal as decimal(18,2)) as subtotal
        , cast(taxamt as decimal(18,2)) as valor_imposto
        , cast(freight as decimal(18,2)) as frete
        , cast(totaldue as decimal(18,2)) as total_geral
        , comment as comentario
        , rowguid
        , cast(modifieddate as timestamp) as data_modificacao
    from source_data
)

select *
from renomeado