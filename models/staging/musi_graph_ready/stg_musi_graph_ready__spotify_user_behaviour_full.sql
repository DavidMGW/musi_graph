with 

source as (

    select * from {{ source('musi_graph_ready', 'spotify_user_behaviour_full') }}

),

renamed as (

    select
        replace (age,"6-12","06-12") as age, 
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

select *,
CASE 
WHEN age LIKE '6-12' THEN 1 
WHEN age LIKE '12-20' THEN 2
WHEN age LIKE '20-35' THEN 3
WHEN age LIKE '35-60' THEN 4
END AS age_group
from renamed