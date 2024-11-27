with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_songs_features') }}

),

renamed as (

    select
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
        release_date,
        speechiness,
        tempo

    from source

)

select * from renamed
