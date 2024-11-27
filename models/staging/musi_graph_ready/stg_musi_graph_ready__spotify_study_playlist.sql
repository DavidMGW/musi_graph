with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_study_playlist') }}

),

renamed as (

    select
        column1,
        x_1,
        x,
        playlistid,
        playlistname,
        ntracks,
        type,
        owner,
        description,
        nfoll_x,
        nfoll_y,
        trackname,
        track_id,
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
        clusterid

    from source

)

select * from renamed
