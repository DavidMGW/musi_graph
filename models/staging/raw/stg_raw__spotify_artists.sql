with 

source as (

    select * from {{ source('raw', 'spotify_artists') }}

),

renamed as (

    select

    from source

)

select * from renamed
