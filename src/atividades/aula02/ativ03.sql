<<<<<<< HEAD
--mapa mais jogado

=======
>>>>>>> bc6cae3ab0c227939f7d06062e6c1ae051fbbb4e
SELECT descMapName,
        count(idLobbyGame)

FROM tb_lobby_stats_player

GROUP BY descMapName

<<<<<<< HEAD
ORDER BY count(idLobbyGame)
=======
ORDER BY count(idLobbyGame) DESC
>>>>>>> bc6cae3ab0c227939f7d06062e6c1ae051fbbb4e
