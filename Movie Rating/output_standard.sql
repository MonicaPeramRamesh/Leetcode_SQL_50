/* Write your T-SQL query statement below */
with user_max_rated as (select user_id,  count(*) user_highest_rated from MovieRating group by user_id), highest_rating
as 
(select max(user_highest_rated) highest_rating from user_max_rated ), all_rating as ( select  movie_id, avg(rating*1.0) as rating from MovieRating where created_at between '2020-02-01' and '2020-02-29' group by movie_id ),max_rating as (
select max(rating) max_rating from all_rating ), first_data as(
select top 1 u.name as name from Users u inner join user_max_rated umr on umr.user_id = u.user_id where umr.user_highest_rated = (select highest_rating from highest_rating ) order by u.name ), second_data as(
select top 1 m.title as name from Movies m inner join all_rating ar on ar.movie_id = m.movie_id where rating = (select max_rating from max_rating) order by title )

select name as results from first_data union all select name as results from second_data
