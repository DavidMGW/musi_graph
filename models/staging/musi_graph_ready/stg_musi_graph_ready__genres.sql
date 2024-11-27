with 

source as (

    select * from {{ source('musi_graph_ready', 'genres') }}

),

renamed as (

    select
        genre_id,
        _tracks,
        parent,
        title,
        top_level

    from source

)

select * from renamed
