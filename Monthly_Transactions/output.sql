/* Write your T-SQL query statement below */

with transaction_year as (select *,convert(varchar(7),trans_date,120) as year_month from Transactions)

select 
  month, 
  country, 
  sum(trans_count) as trans_count, 
  sum(approved_count) as approved_count, 
  sum(trans_total_amount) as trans_total_amount , 
  sum(approved_total_amount) approved_total_amount 
from (
  select year_month as month, 
  country, 
  count(*) as trans_count, 
  case when state='approved' then count(*) else 0 end approved_count, 
  sum(amount) as trans_total_amount , 
  case when state='approved' then sum(amount) else 0 end approved_total_amount 
from transaction_year 
group by year_month,country, state
) transaction_details 
group by month, country
