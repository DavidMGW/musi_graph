WITH sub AS (
    SELECT
        *,
        REPLACE(REPLACE(REPLACE(CONCAT(TRIM(LOWER(artist_names)), '_', TRIM(LOWER(track_name))), '[', ''), ']', ''), "'", '') AS PK
    FROM {{ref("stg_musi_graph_ready__spotify_songs_features")}}
),
sub2 AS (
    SELECT
        *,
        CONCAT(LOWER(Artist), '_', (LOWER(Track))) AS PK
    FROM {{ref("stg_musi_graph_ready__spotify_most_streamed_2024") }}
)
SELECT
    *,
FROM sub
RIGHT JOIN sub2 USING (PK)
WHERE track_id IS NOT NULL