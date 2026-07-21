{#- Use the custom schema EXACTLY when one is set (STAGING / MARTS), instead of
    dbt's default target_schema + '_' + custom concatenation. The estate grants
    DBT_RUNNER_DEV create rights on exactly these two schemas. -#}
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
