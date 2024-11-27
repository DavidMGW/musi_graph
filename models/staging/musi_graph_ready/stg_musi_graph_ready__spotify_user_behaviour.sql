with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_user_behaviour') }}

),

renamed as (

    select
        age,
        gender,
        spotify_usage_period,
        spotify_listening_device,
        spotify_subscription_plan,
        premium_sub_willingness,
        preffered_premium_plan,
        preferred_listening_content,
        fav_music_genre,
        music_time_slot,
        music_influencial_mood,
        music_lis_frequency,
        music_expl_method,
        music_recc_rating

    from source

)

select * from renamed
