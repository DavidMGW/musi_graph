with 

source as (

    select * from {{ source('musi_graph_ready', 'all_classical_genres') }}

),

renamed as (

    select
        genre_id,
        genre_name,
        genre_category,
        is_classical

    from source

)

select * from renamed
