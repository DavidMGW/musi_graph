with 

source as (

    select * from {{ source('musi_graph_ready', 'fma_echonest') }}

),

renamed as (

    select
        track_id,
        acousticness,
        danceability,
        energy,
        instrumentalness,
        liveness,
        speechiness,
        tempo,
        valence,
        album_date,
        album_name,
        artist_latitude,
        artist_location,
        artist_longitude,
        artist_name,
        release,
        artist_discovery_rank,
        artist_familiarity_rank,
        artist_hotttnesss_rank,
        song_currency_rank,
        song_hotttnesss_rank,
        artist_discovery,
        artist_familiarity,
        artist_hotttnesss,
        song_currency,
        song_hotttnesss

    from source

)

select * from renamed
