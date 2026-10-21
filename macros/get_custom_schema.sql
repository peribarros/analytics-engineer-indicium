{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_target_schema = target.schema -%}
    
    {%- if custom_schema_name is none -%}
        {{ default_target_schema }}
    {%- else -%}
        {# Cria o esquema com o prefixo comercial_ seguido do nome customizado (staging, marts, etc.) #}
        comercial_{{ default_target_schema }}_{{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}