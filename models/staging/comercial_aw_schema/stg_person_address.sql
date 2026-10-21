with source_data as (
    select *
    from {{ source('comercial', 'person_address') }}
),

renomeado as (
    select
        cast(addressid as int) as pk_address
        , addressline1 as endereco
        , addressline2 as endereco_2
        , city as cidade_endereco
        , cast(stateprovinceid as int) as fk_stateprovince
        -- Padronização com regex para limpar espaços extras ou garantir o formato correto de letras e números do código postal
        , trim(regexp_replace(postalcode, '[^a-zA-Z0-9\\s-]', '')) as codigo_postal
        , spatiallocation as localizacao_espacial_endereco
        , rowguid
        , cast(modifieddate as timestamp) as data_modificacao_endereco
    from source_data
)

select *
from renomeado