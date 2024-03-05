/*SELECT descCountry,
    AVG(txHs) AS countryAvgTxHs,
    COUNT(DISTINCT idPlayer) AS qtPlayer

FROM tb_stats_player

GROUP BY descCountry

ORDER BY 2 DESC */

SELECT ROUND(avgVlLevel,0) AS lvl,
    AVG(txHs) AS levelAvgTxHs,
    COUNT(DISTINCT idPlayer)

FROM tb_stats_player

GROUP BY ROUND(avgVlLevel,0) -- or 1

ORDER BY 1