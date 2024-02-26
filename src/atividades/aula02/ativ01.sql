-- colocar em ordem a pessoa com maior media de headshot
SELECT idLobbyGame,
    idPlayer,
    qtKill,
    qtHs,
    avg(100.0*qtHs / qtKill) AS mediaGeral,
    SUM(qtHs) AS headshotsTotal,
    COUNT(distinct idLobbyGame) AS partidasJogadas
FROM tb_lobby_stats_player
GROUP BY idPlayer
HAVING partidasJogadas>=20 AND qtKill>=1
ORDER BY mediaGeral DESC