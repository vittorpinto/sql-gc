WITH tb_lag AS (
    SELECT t1.idLobbyGame,
        t1.idPlayer,
        t1.qtKill,
        lag(t1.qtKill) over (PARTITION BY idPlayer ORDER BY idLobbyGame) AS lagKill
    FROM tb_lobby_stats_player AS t1

    ORDER BY idPlayer, idLobbyGame
    )

SELECT t1.*,
    100.0*t1.qtKill/lagKill AS odds

FROM tb_lag as t1

WHERE t1.lagKill is not null

--resumindo, tudo que usa over partiion by é uma window function