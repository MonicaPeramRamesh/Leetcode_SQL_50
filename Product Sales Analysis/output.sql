/* Write your T-SQL query statement below */

with sales_details as (select product_id,year as first_year, quantity,price, dense_rank() over (partition by product_id order by year ) ranks from Sales 
)

select product_id,first_year, quantity,price from sales_details where ranks = 1
