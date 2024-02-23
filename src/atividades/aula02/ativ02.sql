SELECT descCountry,
        count(idPlayer) AS qtPlayersPerCountry

FROM tb_players

GROUP BY descCountry

ORDER BY count(idPlayer) DESC