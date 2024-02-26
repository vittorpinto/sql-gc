SELECT t1.descCountry,
    t2.descMapName,
    COUNT(DISTINCT t2.idLobbyGame) AS qtJogadores

FROM tb_players AS t1

INNER JOIN tb_lobby_stats_player AS t2
ON t1.idPlayer = t2.idPlayer

GROUP BY t1.descCountry, t2.descMapName

ORDER BY qtJogadores DESC