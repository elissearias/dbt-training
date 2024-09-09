
{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

with orders as (
 select * from {{ source('cust', 'orders') }}
) select * from orders

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where _ETL_LOADED_AT >= (select coalesce (max(_ETL_LOADED_AT),'1900-01-01') from {{ this }}) 
{% endif %}
