with source as (
    select * from {{ source('comercial', 'sales_salesorderdetail') }}
),

renamed as (
    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty as quantidade,
        productid,
        specialofferid,
        unitprice,
        unitpricediscount,
        -- Calcula o total da linha multiplicando a quantidade pelo preço unitário (com desconto, se aplicável)
        (orderqty * unitprice) as linetotal,
        rowguid,
        modifieddate
    from source
)

select * from renamed