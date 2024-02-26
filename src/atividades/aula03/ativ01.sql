--precisando de subquerry

SELECT t1.idMedal,
    t3.descMedal,
    SUM(t2.flWinner) AS quantidadeVitorias,
    COUNT(t2.idLobbyGame) AS quantidadeTotalPartidas,
    ROUND(100.0 * SUM(t2.flWinner) / COUNT(t2.idLobbyGame),2) AS porcentagemVitoria

FROM tb_players_medalha AS t1
    
INNER JOIN tb_lobby_stats_player AS t2 
ON t1.idPlayer = t2.idPlayer
    
INNER JOIN tb_medalha AS t3
ON t1.idMedal = t3.idMedal

GROUP BY t3.idMedal