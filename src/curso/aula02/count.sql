SELECT count(*),
    count(distinct idPlayer),
    count(distinct descCountry) AS qtCountry
FROM tb_players