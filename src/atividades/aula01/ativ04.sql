-- estatisticas de um player que tiveram mais de 50% de headshot numa partida

SELECT idPlayer,
        qtKill,
        qtHs,
        ROUND(100.0 * qtHs/qtKill,2) AS porcentagemHs

FROM tb_lobby_stats_player 

WHERE ROUND(100.0 * qtHs/qtKill,2) > 50.0
