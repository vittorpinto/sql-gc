/* SELECT idPlayer,
 
 AVG(qtKill),
 
 AVG(qtAssist)
 
 FROM tb_lobby_stats_player
 
 GROUP BY idPlayer */
--ctrl d para seleicionar todas letras iguais
--shift+alt+i coloca cursor em tudo -> depois só manipular (tudo com shift para selecionar)
--CUIDADO PORRA
--DELETE apaga as linhas
DROP TABLE IF EXISTS tb_stats_player;
CREATE TABLE tb_stats_player AS
WITH tb_stats AS (
    SELECT idPlayer,
        COUNT(DISTINCT idLobbyGame) AS qtLobby,
        AVG(qtKill) AS avgQtKill,
        MIN(qtKill) AS minQtKill,
        MAX(qtKill) AS maxQtKill,
        AVG(qtAssist) AS avgQtAssist,
        MIN(qtAssist) AS minQtAssist,
        MAX(qtAssist) AS maxQtAssist,
        AVG(qtDeath) AS avgQtDeath,
        MIN(qtDeath) AS minQtDeath,
        MAX(qtDeath) AS maxQtDeath,
        AVG(qtHs) AS avgQtHs,
        MIN(qtHs) AS minQtHs,
        MAX(qtHs) AS maxQtHs,
        100.0 * SUM(qtHs) / SUM(qtKill) AS txHs,
        AVG(qtBombeDefuse) AS avgQtBombeDefuse,
        MIN(qtBombeDefuse) AS minQtBombeDefuse,
        MAX(qtBombeDefuse) AS maxQtBombeDefuse,
        AVG(qtBombePlant) AS avgQtBombePlant,
        MIN(qtBombePlant) AS minQtBombePlant,
        MAX(qtBombePlant) AS maxQtBombePlant,
        AVG(qtTk) AS avgQtTk,
        MIN(qtTk) AS minQtTk,
        MAX(qtTk) AS maxQtTk,
        AVG(qtTkAssist) AS avgQtTkAssist,
        MIN(qtTkAssist) AS minQtTkAssist,
        MAX(qtTkAssist) AS maxQtTkAssist,
        AVG(qt1Kill) AS avgQt1Kill,
        MIN(qt1Kill) AS minQt1Kill,
        MAX(qt1Kill) AS maxQt1Kill,
        AVG(qt2Kill) AS avgQt2Kill,
        MIN(qt2Kill) AS minQt2Kill,
        MAX(qt2Kill) AS maxQt2Kill,
        AVG(qt3Kill) AS avgQt3Kill,
        MIN(qt3Kill) AS minQt3Kill,
        MAX(qt3Kill) AS maxQt3Kill,
        AVG(qt4Kill) AS avgQt4Kill,
        MIN(qt4Kill) AS minQt4Kill,
        MAX(qt4Kill) AS maxQt4Kill,
        AVG(qt5Kill) AS avgQt5Kill,
        MIN(qt5Kill) AS minQt5Kill,
        MAX(qt5Kill) AS maxQt5Kill,
        AVG(qtPlusKill) AS avgQtPlusKill,
        MIN(qtPlusKill) AS minQtPlusKill,
        MAX(qtPlusKill) AS maxQtPlusKill,
        AVG(qtFirstKill) AS avgQtFirstKill,
        MIN(qtFirstKill) AS minQtFirstKill,
        MAX(qtFirstKill) AS maxQtFirstKill,
        AVG(vlDamage) AS avgVlDamage,
        MIN(vlDamage) AS minVlDamage,
        MAX(vlDamage) AS maxVlDamage,
        AVG(qtHits) AS avgQtHits,
        MIN(qtHits) AS minQtHits,
        MAX(qtHits) AS maxQtHits,
        AVG(qtShots) AS avgQtShots,
        MIN(qtShots) AS minQtShots,
        MAX(qtShots) AS maxQtShots,
        AVG(qtLastAlive) AS avgQtLastAlive,
        MIN(qtLastAlive) AS minQtLastAlive,
        MAX(qtLastAlive) AS maxQtLastAlive,
        AVG(qtClutchWon) AS avgQtClutchWon,
        MIN(qtClutchWon) AS minQtClutchWon,
        MAX(qtClutchWon) AS maxQtClutchWon,
        AVG(qtRoundsPlayed) AS avgQtRoundsPlayed,
        MIN(qtRoundsPlayed) AS minQtRoundsPlayed,
        MAX(qtRoundsPlayed) AS maxQtRoundsPlayed,
        COUNT(
            CASE
                WHEN descMapName = 'de_mirage' THEN idLobbyGame
            END
        ) AS qtMirage,
        COUNT(
            CASE
                WHEN descMapName = 'de_nuke' THEN idLobbyGame
            END
        ) AS qtNuke,
        COUNT(
            CASE
                WHEN descMapName = 'de_inferno' THEN idLobbyGame
            END
        ) AS qtInferno,
        COUNT(
            CASE
                WHEN descMapName = 'de_vertigo' THEN idLobbyGame
            END
        ) AS qtVertigo,
        COUNT(
            CASE
                WHEN descMapName = 'de_ancient' THEN idLobbyGame
            END
        ) AS qtAncient,
        COUNT(
            CASE
                WHEN descMapName = 'de_dust2' THEN idLobbyGame
            END
        ) AS qtDust2,
        COUNT(
            CASE
                WHEN descMapName = 'de_train' THEN idLobbyGame
            END
        ) AS qtTrain,
        COUNT(
            CASE
                WHEN descMapName = 'de_overpass' THEN idLobbyGame
            END
        ) AS qtOverpass,
        AVG(vlLevel) AS avgVlLevel,
        MIN(vlLevel) AS minVlLevel,
        MAX(vlLevel) AS maxVlLevel,
        AVG(qtSurvived) AS avgQtSurvived,
        MIN(qtSurvived) AS minQtSurvived,
        MAX(qtSurvived) AS maxQtSurvived,
        AVG(qtTrade) AS avgQtTrade,
        MIN(qtTrade) AS minQtTrade,
        MAX(qtTrade) AS maxQtTrade,
        AVG(qtFlashAssist) AS avgQtFlashAssist,
        MIN(qtFlashAssist) AS minQtFlashAssist,
        MAX(qtFlashAssist) AS maxQtFlashAssist,
        AVG(qtHitHeadshot) AS avgQtHitHeadshot,
        MIN(qtHitHeadshot) AS minQtHitHeadshot,
        MAX(qtHitHeadshot) AS maxQtHitHeadshot,
        AVG(qtHitChest) AS avgQtHitChest,
        MIN(qtHitChest) AS minQtHitChest,
        MAX(qtHitChest) AS maxQtHitChest,
        AVG(qtHitStomach) AS avgQtHitStomach,
        MIN(qtHitStomach) AS minQtHitStomach,
        MAX(qtHitStomach) AS maxQtHitStomach,
        AVG(qtHitLeftAtm) AS avgQtHitLeftAtm,
        MIN(qtHitLeftAtm) AS minQtHitLeftAtm,
        MAX(qtHitLeftAtm) AS maxQtHitLeftAtm,
        AVG(qtHitRightArm) AS avgQtHitRightArm,
        MIN(qtHitRightArm) AS minQtHitRightArm,
        MAX(qtHitRightArm) AS maxQtHitRightArm,
        AVG(qtHitLeftLeg) AS avgQtHitLeftLeg,
        MIN(qtHitLeftLeg) AS minQtHitLeftLeg,
        MAX(qtHitLeftLeg) AS maxQtHitLeftLeg,
        AVG(qtHitRightLeg) AS avgQtHitRightLeg,
        MIN(qtHitRightLeg) AS minQtHitRightLeg,
        MAX(qtHitRightLeg) AS maxQtHitRightLeg,
        AVG(flWinner) AS txFlWinner
    FROM tb_lobby_stats_player
    GROUP BY idPlayer
    ORDER BY idPlayer
)

SELECT t1.*,
    t2.descCountry

FROM tb_stats AS t1

LEFT JOIN tb_players AS t2
ON t1.idPlayer = t2.idPlayer;