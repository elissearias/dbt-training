{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

with paids as (
    select * from {{ source('payments', 'payment') }}
) select * from paids


{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where _BATCHED_AT >= (select coalesce (max(_BATCHED_AT),'1900-01-01') from {{ this }}) 
{% endif %}
