/* Write your T-SQL query statement below */

with student_row as(select *, row_number() over (order by (select null)) as tile from Seat), 
student_details as(select id, case when tile%2 = 0 then lag(student) over(order by (select null)) else lead(student) over(order by (select null)) end student from student_row )

select student_details.id, case when student_details.student is null then student_row.student else student_details.student end student from student_details inner join student_row on student_details.id =  student_row.id
