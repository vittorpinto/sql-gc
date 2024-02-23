--mapa mais jogado

SELECT descMapName,
        count(idLobbyGame)

FROM tb_lobby_stats_player

GROUP BY descMapName

ORDER BY count(idLobbyGame)