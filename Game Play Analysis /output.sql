/* Write your T-SQL query statement below */

with player_rank as (select player_id, dense_rank() over (partition by player_id order by event_date) as rank, event_date  from Activity), total_player as (select distinct player_id from Activity), first_second as (select p1.player_id, p1.event_date , p2.event_date  as prev, p1.rank from player_rank p1 left join player_rank p2 on p1.player_id = p2.player_id where p1.rank =2 ), final_dataset as (

select round(sum(case when datediff(day,prev, event_date) =1 then 1 else 0 end ) * 1.0/ (select count(player_id) from total_player),2) as fraction from first_second  )

select case when fraction is null then 0 else fraction end fraction from final_dataset
