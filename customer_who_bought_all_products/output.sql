/* Write your T-SQL query statement below */

with products as (select count(product_key) as product_count from Product), details as 
(select customer_id, count(distinct(product_key)) as counts from Customer group by customer_id)

select customer_id from details where counts = (select product_count from products)
