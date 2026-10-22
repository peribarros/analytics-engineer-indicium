{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        comercial_aw_schema
    {%- else -%}
        comercial_aw_schema_{{ custom_schema_name }}
    {%- endif -%}
{%- endmacro %}