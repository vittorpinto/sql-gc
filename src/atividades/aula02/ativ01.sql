-- SELECT *
-- FROM(
--     SELECT idPlayer,
--             avg(flWinner) as partidasGanhas,
--             count(distinct idLobbyGame) as partidas

--     FROM tb_lobby_stats_player

--     GROUP BY idPlayer
-- )
-- WHERE partidas > 10

-- OR

SELECT idPlayer, --primeiro seleciono
        avg(flWinner) as partidasGanhas,
        count(distinct idLobbyGame) as partidas

FROM tb_lobby_stats_player --depois da onde tenho que selecionar

--where aqui se precisar, como um filtro

GROUP BY idPlayer --agrupar

HAVING partidas >= 10 --outro filtro, só que para o agrupamento

ORDER BY partidasGanhas DESC --desc = maior para menor --agora eu ordeno