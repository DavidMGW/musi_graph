with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_million_songs') }}

),

renamed as (

    select
        track_id,
        artists,
        album_name,
        track_name,
        popularity,
        duration_ms,
        explicit,
        danceability,
        energy,
        key,
        loudness,
        mode,
        speechiness,
        acousticness,
        instrumentalness,
        liveness,
        valence,
        tempo,
        time_signature,
        track_genre

    from source

)

select * from renamed
