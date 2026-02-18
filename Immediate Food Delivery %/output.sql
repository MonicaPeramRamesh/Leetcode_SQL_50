/* Write your T-SQL query statement below */

with latest_orders as (select customer_id, case when order_date =  customer_pref_delivery_date then 'immediate' else 'scheduled' end order_type, row_number() over(partition by customer_id order by order_date) as order_details from Delivery ),  total_immediate as (select count(*) as immediate_orders from latest_orders where order_details = 1), only_immediate as (select count(*) immediate_orders from latest_orders where order_details = 1 and order_type = 'immediate' ) 

select round(only_immediate.immediate_orders *100.0 / total_immediate.immediate_orders,2) as immediate_percentage   from only_immediate inner join total_immediate on 1 = 1
