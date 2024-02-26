-- pais que tem mais jogadores
SELECT descCountry,
        count(DISTINCT idPlayer) AS qtPlayersPerCountry
FROM tb_players
GROUP BY descCountry
ORDER BY count(idPlayer) DESC