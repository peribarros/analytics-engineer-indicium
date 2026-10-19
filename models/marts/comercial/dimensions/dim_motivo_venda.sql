with int_motivo as (
    select *
    from {{ ref('int_motivo_venda') }}
)

select
    pedido_id,
    motivo_venda_id,
    nome_motivo,
    tipo_motivo
from int_motivo