WITH tb_subs AS (
    SELECT idPlayer,
        CASE
            WHEN idMedal = 1 THEN "Premium"
            ELSE "Plus"
        END SubType
    FROM tb_players_medalha
    WHERE idMedal IN (1, 3)
        AND flActive = 1
    GROUP BY 1,
        2
),
tb_winrate AS (
    SELECT idPlayer,
        AVG(flWinner) AS winRate
    FROM tb_lobby_stats_player
    GROUP BY idPlayer
),
tb_subs_stats AS (
    SELECT t1.*,
        COALESCE(t2.SubType, "Nao sub") AS SubType
    FROM tb_winrate AS t1
        LEFT JOIN tb_subs AS t2 ON t1.idPlayer = t2.idPlayer
)
SELECT SubType,
    AVG(winRate) AS mediaWinRate
FROM tb_subs_stats
GROUP BY SubType