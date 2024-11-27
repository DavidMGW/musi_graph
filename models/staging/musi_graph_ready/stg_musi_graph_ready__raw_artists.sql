with 

source as (

    select * from {{ source('musi_graph_ready', 'raw_artists') }}

),

renamed as (

    select
        artist_id,
        artist_comments,
        artist_date_created,
        artist_favorites,
        artist_handle,
        artist_name

    from source

)

select * from renamed
