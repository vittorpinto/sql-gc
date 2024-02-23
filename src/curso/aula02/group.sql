SELECT descCountry, 
    count(distinct idPlayer) AS qtPlayers,
    count(distinct descCountry) AS qtCountry,
    ROUND(avg(date('now') - date(dtBirth)), 2) AS idade,
    SUM(flTwitter) AS twitter,
    SUM(flFacebook) AS facebook,
    SUM(flTwitch) AS twitch
FROM tb_players

GROUP BY descCountry
ORDER BY idade