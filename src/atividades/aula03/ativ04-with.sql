--o create table e drop sao muitos custosos por causa de I/O. o with é muito melhor

WITH tb_tribo AS (
    SELECT idPlayer,
        max(1) AS flTribo --flag tribo
    FROM tb_players_medalha
    WHERE idMedal IN (8, 37)
        AND flActive = 1
    GROUP BY idPlayer
), --criando uma tabela temporaria, uma view

tb_hs AS (
    SELECT idPlayer,
        AVG(100.0*qtHs/qtKill) AS txHs
    FROM tb_lobby_stats_player
    GROUP BY idPlayer
),

tb_hs_tribo AS (

SELECT t2.*

FROM tb_tribo AS t1

LEFT JOIN tb_hs AS t2
ON t1.idPlayer = t2.idPlayer
)

SELECT AVG(txHs) AS taxaGeral

FROM tb_hs_tribo