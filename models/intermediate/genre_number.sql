SELECT 
    spotify_id, 
   (genre_name) AS genres,
   row_number()over(partition by spotify_id ORDER BY genre_name) as genre_rank
FROM {{ ref('stg_musi_graph_ready__music_genres_songs_clean') }}
ORDER BY spotify_id

