with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_sleep_playlist') }}

),

renamed as (

    select
        int64_field_0,
        trackname,
        trackid,
        releaseyear,
        genres,
        danceability,
        energy,
        loudness,
        speechiness,
        acousticness,
        instrumentalness,
        liveness,
        valence,
        tempo,
        key,
        mode,
        duration_ms,
        popularity,
        pnum,
        playlistid,
        label,
        usercat,
        democat,
        length,
        playlisttitle,
        nfoll,
        ntracks,
        trackidmatch,
        clusterid

    from source

)

select * from renamed
