{{ config(materialized='table')}}


with customer as 
( 
    select * from
    {{source('cust','customer')}}

)

select * from customer
