/* Write your T-SQL query statement below */

with employee_rank as (select *, dense_rank() over (order by salary desc) as rank_no from Employee ), second_highest as (select *  from employee_rank where rank_no = 2 )

select max(salary) SecondHighestSalary from second_highest
