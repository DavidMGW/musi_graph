SELECT
    ssd.track_id,
    ssd.artist_names,
    "" AS album_name, --album_id
    ssd.track_name,
    ssd.popularity,
    ssd.duration_ms,
    ssd.explicit,
    ssd.danceability,
    ssd.energy,
    ssd.key,
    ssd.loudness,
    ssd.mode,
    ssd.speechiness,
    ssd.acousticness,
    ssd.instrumentalness,
    ssd.liveness,
    ssd.valence,
    ssd.tempo,
    "" AS time_signature, -- absent
    "" AS track_genre -- absent
FROM {{ ref("stg_musi_graph_ready__ssd_songs") }} AS ssd
LEFT JOIN {{ ref("stg_musi_graph_ready__spotify_million_songs") }} AS m
USING(track_id)
WHERE artist_names IS NULL