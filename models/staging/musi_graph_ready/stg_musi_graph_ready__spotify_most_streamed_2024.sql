with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_most_streamed_2024') }}

),

renamed as (

    select
        track,
        "album name" AS album_name,
        artist,
        "release date" as release_date,
        "all time rank" AS all_time_rank,
        "track score" AS track_score,
        "spotify streams" AS spotify_streams,
        "spotify playlist count" AS spotify_playlist_count,
        "spotify playlist reach" AS spotify_playlist_reach,
        "spotify popularity" AS spotify_popularity,
        "youtube views" AS youtube_views,
        "youtube likes" AS youtube_likes,
        "tiktok likes" AS tiktok_likes,
        "tiktok views" AS tiktok_views,
        "youtube playlist reach" AS youtube_playlist_reach

    from source

)

select * from renamed
