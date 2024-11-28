WITH RECURSIVE split_methods AS (
  SELECT 
    TRIM(SPLIT(music_expl_method, ',')[OFFSET(0)]) AS method,
    SUBSTR(music_expl_method, LENGTH(SPLIT(music_expl_method, ',')[OFFSET(0)]) + 2) AS remaining_string
  FROM 
    {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
  WHERE 
    LOWER(fav_music_genre) LIKE '%class%'
  UNION ALL
  SELECT 
    TRIM(SPLIT(remaining_string, ',')[OFFSET(0)]),
    SUBSTR(remaining_string, LENGTH(SPLIT(remaining_string, ',')[OFFSET(0)]) + 2)
  FROM 
    split_methods
  WHERE 
    remaining_string != ''
)
SELECT 
  method,
  COUNT(*) as count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM split_methods), 2) as percentage
FROM 
  split_methods
GROUP BY 
  method
ORDER BY 
  count DESC