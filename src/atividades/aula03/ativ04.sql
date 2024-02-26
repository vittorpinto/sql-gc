--tambem precisa de subquerry

SELECT 
    COUNT(DISTINCT t2.idLobbyGame) AS qtPartidas,
    SUM(t2.flWinner) AS ptdGanhas,
    ROUND(100.0*SUM(flWinner)/COUNT(DISTINCT t2.idLobbyGame),2) AS porcentagemVitoria
    
FROM tb_players_medalha AS t1

INNER JOIN tb_lobby_stats_player AS t2
ON t1.idPlayer = t2.idPlayer

WHERE t1.idMedal = '8'