SELECT flTribo,
    avg(txHs) AS mediaHs
FROM(
        SELECT t1.idPlayer,
            t1.qtKill,
            t1.qtHs,
            100.0 * t1.qtHs / t1.qtKill as txHs,
            COALESCE(t2.flTribo, 0) AS flTribo --onde é null, coloca alguma coisa( no caso 0)
        FROM tb_lobby_stats_player AS t1
            LEFT JOIN(
                SELECT t1.idPlayer,
                    max(1) AS flTribo --flag tribo
                FROM tb_players_medalha AS t1
                WHERE t1.idMedal IN (8, 37)
                    AND t1.flActive = 1
                GROUP BY idPlayer
            ) AS t2 ON t1.idPlayer = t2.idPlayer
    )
GROUP BY flTribo