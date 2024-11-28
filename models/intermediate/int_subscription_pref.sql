WITH genre_classification AS (
    SELECT 
        spotify_subscription_plan as type_abonnement,
        CASE 
            WHEN LOWER(fav_music_genre) LIKE '%classical%' THEN 'Musique Classique'
            ELSE 'Autres Genres'
        END as categorie_genre,
        COUNT(*) as nombre_auditeurs
    FROM {{ ref('stg_musi_graph_ready__spotify_user_behaviour_full') }}
    GROUP BY 
        spotify_subscription_plan,
        CASE 
            WHEN LOWER(fav_music_genre) LIKE '%classical%' THEN 'Musique Classique'
            ELSE 'Autres Genres'
        END
)
SELECT 
    type_abonnement,
    categorie_genre,
    nombre_auditeurs,
    -- Pourcentage par rapport au total des auditeurs de ce type d'abonnement
    ROUND(nombre_auditeurs * 100.0 / SUM(nombre_auditeurs) OVER (PARTITION BY type_abonnement), 2) 
        as pourcentage_dans_abonnement,
    -- Pourcentage par rapport au total des auditeurs de ce genre
    ROUND(nombre_auditeurs * 100.0 / SUM(nombre_auditeurs) OVER (PARTITION BY categorie_genre), 2) 
        as pourcentage_dans_genre
FROM genre_classification
ORDER BY 
    type_abonnement,
    categorie_genre