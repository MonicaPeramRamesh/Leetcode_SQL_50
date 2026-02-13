with grouped_date as (select visited_on, sum(amount) as amount from Customer group by visited_on),

running_sum as (select visited_on, sum(amount) over(order by visited_on rows between 6 preceding and current row) as rolling_amount, row_number() over(order by visited_on) row_num from grouped_date
)

select visited_on, rolling_amount as amount, round(rolling_amount*1.0/7,2) as average_amount from running_sum
where row_num >=7
