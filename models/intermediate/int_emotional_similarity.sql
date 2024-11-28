SELECT 
    fav_music_genre,
    music_Influencial_mood,
    COUNT(*) as count
FROM {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
WHERE music_Influencial_mood IN (
    SELECT DISTINCT music_Influencial_mood
    FROM {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
    WHERE LOWER(fav_music_genre) LIKE '%class%'
)
GROUP BY fav_music_genre, music_Influencial_mood
HAVING count > 1
ORDER BY count DESC