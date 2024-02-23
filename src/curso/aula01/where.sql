-- puxando só id e data de nascimento de argentino

SELECT idPlayer,
       dtBirth

FROM tb_players

WHERE descCountry = 'ar'
AND dtBirth IS NOT NULL