WITH tb_lobbys AS (

    SELECT idLobbyGame,
        idPlayer,
        row_number() over (partition by idPlayer order by idLobbyGame) AS numeroLinha
        --existe muito mais do que apenas o row number
    FROM tb_lobby_stats_player

    ORDER BY idPlayer
) 
SELECT * FROM tb_lobbys WHERE numeroLinha <= 3

--evitar cchamadas de procedure