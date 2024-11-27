select
    a.playlistid
    ,a.playlistname
    ,a.ntracks
    ,a.type
    ,a.description
    ,a.nfoll_x
    ,a.nfoll_y
    ,a.trackname
    ,a.track_id
    ,a.releaseyear
    ,a.genres
    ,a.danceability
    ,a.energy
    ,a.loudness
    ,a.speechiness
    ,a.acousticness
    ,a.instrumentalness
    ,a.liveness
    ,a.valence
    ,a.tempo
    ,a.key
    ,a.mode
    ,a.duration_ms
    ,a.popularity
    ,a.clusterid
    ,b.pnum
    ,b.label
    ,b.usercat
    ,b.democat
    ,b.length
    ,b.playlisttitle
    ,b.trackidmatch
FROM {{ ref("stg_musi_graph_ready__spotify_study_playlist")}} AS a
LEFT OUTER JOIN {{ ref("stg_musi_graph_ready__spotify_sleep_playlist")}} AS b
ON a.track_id = b.trackid