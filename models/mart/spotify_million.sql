SELECT 
  ms.*,
  CAST(COALESCE(cg.is_classical, FALSE) AS INT64) AS is_classical
FROM {{ ref('stg_musi_graph_ready__spotify_million_songs') }} AS ms
LEFT JOIN {{ ref('stg_musi_graph_ready__all_classical_genres') }} AS cg
  ON ms.track_genre = cg.genre_name