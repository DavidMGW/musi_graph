WITH sub AS (
    SELECT
        artist,
        genre_name,
        spotify_id
    FROM {{ ref("stg_musi_graph_ready__music_genres_songs_clean") }}
)
SELECT
    track_id,
    track_name,
    album_id,
    artist_ids,
    artist_names,
    valence,
    year,
    acousticness,
    danceability,
    duration_ms,
    energy,
    explicit,
    instrumentalness,
    key,
    liveness,
    loudness,
    mode,
    popularity,
    speechiness,
    tempo,
    spotify_streams,
    spotify_playlist_count,
    spotify_playlist_reach,
    spotify_popularity,
    youtube_views,
    youtube_likes,
    tiktok_likes,
    tiktok_views,
    youtube_playlist_reach,
    mg.artist,
    mg.genre_name,
    mg.spotify_id
FROM {{ ref("int_social_networks") }} AS cfs
LEFT JOIN sub AS mg
ON cfs.artist = mg.artist
WHERE genre_name IS NOT NULL AND genre_name != ""