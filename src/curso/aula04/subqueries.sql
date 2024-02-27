SELECT AVG(medalhasDistinta) AS mediaMedalhas,
    MAX(medalhasDistinta) AS maximoMedalhas,
    MIN(medalhasDistinta) AS minimoMedalhas
FROM(
        SELECT idPlayer,
            COUNT(DISTINCT idMedal) AS medalhasDistinta
        FROM tb_players_medalha
        WHERE flActive = 1
        GROUP BY idPlayer
        ORDER BY medalhasDistinta DESC
    )