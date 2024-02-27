 --tambem precisa de subquerry

-- SELECT 
--     COUNT(DISTINCT t2.idLobbyGame) AS qtPartidas,
--     SUM(t2.flWinner) AS ptdGanhas,
--     ROUND(100.0*SUM(flWinner)/COUNT(DISTINCT t2.idLobbyGame),2) AS porcentagemVitoria
    
-- FROM tb_players_medalha AS t1

-- INNER JOIN tb_lobby_stats_player AS t2
-- ON t1.idPlayer = t2.idPlayer

-- WHERE t1.idMedal = '8'

SELECT t1.descMedal,
    SUM(t2.qtHs) AS somaTotalHs,
    SUM(t2.qtKill) AS somaTotalKill,
    ROUND(100.0*SUM(t2.qtHs)/ SUM(t2.qtKill),2) AS mediaGeralHs

FROM (
    SELECT t1.idPlayer,
        t2.idMedal,
        t2.descMedal

    FROM tb_players_medalha AS t1

    LEFT JOIN tb_medalha AS t2
    ON t1.idMedal = t2.idMedal

    WHERE t2.descMedal = 'Tribo Gaules' 
    OR t2.descMedal = 'Missão da Tribo'
    ) AS t1

    LEFT JOIN tb_lobby_stats_player AS t2
    ON t1.idPlayer = t2.idPlayer

    GROUP BY t1.idMedal