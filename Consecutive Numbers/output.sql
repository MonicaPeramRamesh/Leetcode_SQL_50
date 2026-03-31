# Write your MySQL query statement below
with concesutive_integer as (SELECT 
    l1.id,
    l1.num,
    l2.num AS prev,
    l3.num AS next
FROM Logs l1
LEFT JOIN Logs l2 
    ON l1.id = l2.id + 1   -- lag 2
LEFT JOIN Logs l3 
    ON l1.id = l3.id - 1 -- lead 2 
)
select distinct num as ConsecutiveNums   from concesutive_integer where num = prev and num = next
