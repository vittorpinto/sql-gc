SELECT t1.idPlayer,
    t1.descCountry,
    t2.qtKill,
    t2.qtHs,
    AVG( ROUND(100.0*t2.qtHs/t2.qtKill)) AS mediaHs,
    COUNT(DISTINCT t2.idLobbyGame) AS qtPartidasJogadas

FROM tb_players AS t1

INNER JOIN tb_lobby_stats_player AS t2
ON t1.idPlayer = t2.idPlayer

GROUP BY t1.idPlayer

HAVING qtPartidasJogadas > 5

ORDER BY mediaHs DESC

--analogia do mm para WHERE e HAVING: quero pegar mms no chao WHERE
--sao azuis ou verdes. depois que peguei, HAVING eles, quero apenas
--continuar com as cores que tem mais 5.