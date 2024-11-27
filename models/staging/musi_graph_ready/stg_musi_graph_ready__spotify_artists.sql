with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_artists') }}

),

renamed as (

    select
        artist_id,
        artist_name,
        genres,
        followers,
        popularity

    from source

)

select * from renamed