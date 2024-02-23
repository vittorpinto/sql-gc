<<<<<<< HEAD
-- pais que tem mais jogadores

=======
>>>>>>> bc6cae3ab0c227939f7d06062e6c1ae051fbbb4e
SELECT descCountry,
        count(idPlayer) AS qtPlayersPerCountry

FROM tb_players

GROUP BY descCountry

ORDER BY count(idPlayer) DESC