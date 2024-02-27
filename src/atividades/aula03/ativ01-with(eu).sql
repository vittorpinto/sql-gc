WITH tb_assinantes_PP AS (
    SELECT idPlayer,
        idMedal,
        max(1) AS flPP
    FROM tb_players_medalha
    WHERE (
            flActive = 1
            AND idMedal = 1
        )
        OR (
            flActive = 1
            AND idMedal = 3
        )
    GROUP BY idPlayer
),
tb_Wr AS (
    SELECT t1.idPlayer,
        t1.flWinner,
        COALESCE(t2.flpp, 0) AS flPP
    FROM tb_lobby_stats_player AS t1
        LEFT JOIN tb_assinantes_PP AS t2 ON t1.idPlayer = t2.idPlayer
)
SELECT flpp,
    COUNT(flWinner),
    SUM(flWinner),
    ROUND(100.0 * SUM(flWinner) / COUNT(flWinner),8) AS wrGeral
FROM tb_Wr
GROUP BY flPP