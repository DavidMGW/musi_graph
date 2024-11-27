SELECT *
FROM {{ ref("stg_musi_graph_ready__fma_echonest") }}
LEFT JOIN {{ ref("stg_musi_graph_ready__genres") }}
