{{
    config(
        materialized='table'
    )
}}

with orders as (
    select * from {{ source('cust', 'orders') }}
)

select * from orders