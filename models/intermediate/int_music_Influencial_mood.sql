SELECT
    music_Influencial_mood,
    COUNT(*) as count
FROM
   {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
WHERE
    LOWER(fav_music_genre) LIKE '%clas%'
GROUP BY
    music_Influencial_mood
ORDER BY
    count DESC