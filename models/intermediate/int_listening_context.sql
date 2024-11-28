WITH RECURSIVE split_contexts AS (
  -- Initial split
  SELECT 
    TRIM(SPLIT(music_lis_frequency, ',')[OFFSET(0)]) AS context,
    SUBSTR(music_lis_frequency, LENGTH(SPLIT(music_lis_frequency, ',')[OFFSET(0)]) + 2) AS remaining_string,
    fav_music_genre as original_genre,
    CASE 
      WHEN LOWER(fav_music_genre) LIKE '%classical%' THEN 'Classical'
      ELSE fav_music_genre
    END AS genre_category
  FROM 
    {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
  
  UNION ALL
  
  -- Recursive splits
  SELECT 
    TRIM(SPLIT(remaining_string, ',')[OFFSET(0)]),
    SUBSTR(remaining_string, LENGTH(SPLIT(remaining_string, ',')[OFFSET(0)]) + 2),
    original_genre,
    genre_category
  FROM 
    split_contexts
  WHERE 
    remaining_string != ''
),

context_totals AS (
  SELECT 
    genre_category,
    COUNT(*) as total_contexts
  FROM 
    split_contexts
  WHERE 
    context != ''
  GROUP BY 
    genre_category
)

SELECT 
  s.genre_category,
  s.context,
  COUNT(*) as nombre_occurrences,
  ROUND(COUNT(*) * 100.0 / ct.total_contexts, 2) as pourcentage_dans_genre,
  ct.total_contexts as total_contextes_genre
FROM 
  split_contexts s
  JOIN context_totals ct ON s.genre_category = ct.genre_category
WHERE 
  s.context != ''
GROUP BY 
  s.genre_category, s.context, ct.total_contexts
ORDER BY 
  s.genre_category, nombre_occurrences DESC