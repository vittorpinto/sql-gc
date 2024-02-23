SELECT idPlayer,
    descCountry,
    CASE
        WHEN descCountry = 'br' THEN 'hu3hu3hu3'
        WHEN descCountry IN ('ar','pe','cl') THEN 'manito'
        WHEN descCountry IN ('ca', 'us') THEN 'na'
        ELSE 'FODASE'
    END AS nacionalidade
FROM tb_players