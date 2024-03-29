--dap = daily active player
SELECT DATE(dtCreatedAt),
    strftime('%Y-%m-%d', dtCreatedAt) AS dataRepresentada,
    dtCreatedAt,
    COUNT(DISTINCT idPlayer) AS dap
FROM tb_lobby_stats_player
GROUP BY DATE(dtCreatedAt)
ORDER BY DATE(dtCreatedAt) -- or group by 1 order by 1
LIMIT 100