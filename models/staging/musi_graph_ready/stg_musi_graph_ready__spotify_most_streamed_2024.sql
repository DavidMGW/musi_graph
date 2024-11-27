with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_most_streamed_2024') }}

),

renamed as (

    select
        track,
        album name,
        artist,
        release date,
        all time rank,
        track score,
        spotify streams,
        spotify playlist count,
        spotify playlist reach,
        spotify popularity,
        youtube views,
        youtube likes,
        tiktok likes,
        tiktok views,
        youtube playlist reach

    from source

)

select * from renamed
