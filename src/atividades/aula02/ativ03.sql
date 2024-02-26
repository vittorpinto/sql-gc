--mapa mais jogado

SELECT descMapName,
        count(DISTINCT idLobbyGame) AS qtPartidas,
        count(*) AS qtPartidasTotal

FROM tb_lobby_stats_player      

GROUP BY descMapName

ORDER BY qtPartidas DESC