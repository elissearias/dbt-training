/*{{
    config
    (
        materialized='table'
    )
}}


with customer as
(
    select * from {{ source('cust', 'customers') }}
)
select * from 
*/