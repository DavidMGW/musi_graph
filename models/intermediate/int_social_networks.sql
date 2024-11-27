SELECT *
    ,CONCAT(TRIM(LOWER(track)), "_", TRIM(LOWER(artist))) AS pk 
FROM {{ ref("stg_musi_graph_ready__spotify_most_streamed_2024") }}
LIMIT 50