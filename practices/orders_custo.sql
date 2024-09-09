
with orders_custo as (
select
   ord.user_id as user_id,
   custo.first_name as name,
   custo.last_name as last_name,
   ord.order_date as order_date,
   ord.status as status
from {{ ref('customers') }} as custo
inner join {{ ref('orders') }} as ord
on custo.id = ord.user_id
) select * from orders_custo