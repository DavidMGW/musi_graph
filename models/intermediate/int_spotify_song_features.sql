SELECT
    ssf.track_id,
    ssf.artist_names,
    "" AS album_name, --album_id
    ssf.track_name,
    ssf.popularity,
    ssf.duration_ms,
    ssf.explicit,
    ssf.danceability,
    ssf.energy,
    ssf.key,
    ssf.loudness,
    ssf.mode,
    ssf.speechiness,
    ssf.acousticness,
    ssf.instrumentalness,
    ssf.liveness,
    ssf.valence,
    ssf.tempo,
    "" AS time_signature, -- absent
    "" AS track_genre -- absent
FROM {{ ref("stg_musi_graph_ready__spotify_songs_features") }} AS ssf
RIGHT JOIN {{ ref("stg_musi_graph_ready__spotify_million_songs") }} AS m
USING(track_id)
WHERE ssf.artist_names IS NULL