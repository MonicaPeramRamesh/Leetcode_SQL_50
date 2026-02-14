select top 1 id, count(*) as num from 
(select requester_id as id from RequestAccepted 
union all 
select accepter_id as id from RequestAccepted ) as combined_result
group by id order by count(*) desc
