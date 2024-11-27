with 

source as (

    select * from {{ source('musi_graph_ready', 'music_genres_songs_clean') }}

),

renamed as (

    select
        spotify_id,
        name,
        artist,
        "position" AS pos,
        genre_name

    from source

)

select * from renamed
