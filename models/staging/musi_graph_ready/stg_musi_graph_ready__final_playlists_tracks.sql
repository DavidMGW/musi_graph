with 

source as (

    select * from {{ source('musi_graph_ready', 'final_playlists_tracks') }}

),

renamed as (

    select
        name,
        artists_names,
        track_uri,
        popularity,
        album_type,
        is_playable,
        release_date,
        artists_uris,
        playlist_uris

    from source

)

select * from renamed
