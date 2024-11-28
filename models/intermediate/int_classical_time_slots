SELECT 
    music_time_slot,
    COUNT(*) as listeners_count
FROM {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
WHERE LOWER(fav_music_genre) LIKE '%class%'
GROUP BY music_time_slot