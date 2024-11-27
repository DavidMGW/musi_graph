with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_user_behaviour_full') }}

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
        music_recc_rating,
        pod_lis_frequency,
        fav_pod_genre,
        preffered_pod_format,
        pod_host_preference,
        preffered_pod_duration,
        pod_variety_satisfaction

    from source

)

select * from renamed
