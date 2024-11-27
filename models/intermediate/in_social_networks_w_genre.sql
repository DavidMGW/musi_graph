SELECT
    *
FROM {{ ref("int_social_networks") }}` AS cfs
LEFT JOIN {{ ref("stg_musi_graph_ready__music_genres_songs_clean") }} AS mg
ON cfs.artist = mg.artist
WHERE genre_name IS NOT NULL AND genre_name <> ""