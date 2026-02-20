/* Write your T-SQL query statement below */

with all_details as (select *, sum(weight) over (order by turn) as last_person from Queue),last_persons as(select top 1 turn as Turn, person_id as ID, person_name , weight as Weight from all_details where last_person <= 1000 order by last_person desc)

select person_name from last_persons
