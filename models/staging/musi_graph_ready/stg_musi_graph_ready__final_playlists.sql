with 

source as (

    select * from {{ source('musi_graph_ready', 'final_playlists') }}

),

renamed as (

    select
        uri,
        name,
        query,
        author,
        n_tracks,
        playlist_followers

    from source

)

select * from renamed
