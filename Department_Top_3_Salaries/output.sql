/* Write your T-SQL query statement below */

with employee_rank as (select d.name as Department, e.name as Employee,e.salary as Salary, dense_rank() over(partition by e.departmentId order by e.salary desc) rank from Employee e inner join Department d on e.departmentId = d.id)

select Department, Employee, Salary from employee_rank where rank in (1,2,3)
