WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        CAST(COUNT(a2.player_id) AS FLOAT) / COUNT(a1.player_id), 2
    ) AS fraction
FROM first_login a1
LEFT JOIN Activity a2
    ON a1.player_id = a2.player_id
   AND a2.event_date = DATEADD(day, 1, a1.first_date);
