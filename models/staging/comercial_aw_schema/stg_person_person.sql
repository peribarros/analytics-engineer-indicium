with source_data as (
    select *
    from {{ source('comercial', 'person_person') }}
),

renomeado as (
    select
        cast(businessentityid as int) as pk_businessentity
        , persontype as tipo_pessoa
        , namestyle as estilo_nome_pessoa
        , title as titulo_pessoa
        -- Juntando o primeiro, meio e último nome de forma limpa (ignora nulos e evita espaços duplos)
        , trim(concat_ws(' ', firstname, middlename, lastname)) as nome_completo_pessoa
        , emailpromotion as promocao_email_pessoa
        , additionalcontactinfo as informacao_contato_adicional_pessoa
        , demographics as dados_demograficos_pessoa
        , rowguid
        , cast(modifieddate as timestamp) as data_modificacao_pessoa
    from source_data
)

select *
from renomeado