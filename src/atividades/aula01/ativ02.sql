-- selecione todos players brasileiros que naseram em 1992

SELECT 
        idPlayer,
        dtBirth

FROM tb_players

WHERE descCountry = 'br' 
AND strftime('%Y', dtBirth) = '1992'