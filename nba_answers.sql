-- Formato respuesta
INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('ID DE LA PREGUNTA', 'VALOR SOLUCIO', 'SQL QUERY')

-- 1. Quants estadis hi ha?
SELECT COUNT(*) FROM arena;INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('1', '29', 'SELECT COUNT(*) FROM arena;')

-- 11. Per cada equip ret-- 2. Obté el nom i cognom de l'entrenador principal de cada franquícia. Quin és el cognom de l'entrenador de Utah Jazz?
SELECT p.name, p.INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('1', '29', 'SELECT COUNT(*) FROM arena;')
SELECT p.name, p.surname FROM person AS p 
JOIN headcoach AS h ON p.IDCard = h.IDCard
JOIN franchise AS f ON f.IDCardCoach = h.IDCard
WHERE f.Name = 'Utah Jazz';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (2, 'Brooks', 'SELECT p.name, p.surname FROM person AS p 
JOIN headcoach AS h ON p.IDCard = h.IDCard
JOIN franchise AS f ON f.IDCardCoach = h.IDCard
WHERE f.Name = "Utah Jazz";');

-- 3. Troba el nom de la franquícia amb el pressupost més gran.
SELECT f.name FROM franchise AS f
ORDER BY f.budget DESC
LIMIT 1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (3, 'Chicago Bulls', 'SELECT f.name FROM franchise AS f
ORDER BY f.budget DESC
LIMIT 1;'); 

-- 4. Llista les arenes (noms i ciutats) de les franquícies de la conferència oest. Quin és el nom de la 5a ciutat?
SELECT a.name, a.city FROM arena AS a
JOIN franchise AS f ON f.ArenaName = a.Name
WHERE f.ConferenceName = 'Western Conference'
ORDER BY a.City ASC;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (4, 'Los Angeles', 'SELECT a.name, a.city FROM arena AS a
JOIN franchise AS f ON f.ArenaName = a.Name
WHERE f.ConferenceName = "Western Conference"
ORDER BY a.City ASC;');

-- 5. Llista els noms dels jugadors que han estat seleccionats en el draft en primera, segona o tercera posició al draft del 2020. 
-- Ordena pel cognom i nom del jugador (Z-A). Quin és el nom del jugador mostrat en la primera fila 
SELECT p.name FROM person AS p 
JOIN player AS pl ON pl.IDCard = p.IDCard
JOIN draft_player_franchise AS dpf ON dpf.IDCardPlayer = pl.IDCard
WHERE draftYear = 2020 AND dpf.position IN (1, 2, 3)
ORDER BY p.surname DESC, p.name DESC;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (5, 'Evan', 'SELECT p.name FROM person AS p 
JOIN player AS pl ON pl.IDCard = p.IDCard
JOIN draft_player_franchise AS dpf ON dpf.IDCardPlayer = pl.IDCard
WHERE draftYear = 2020 AND dpf.position IN (1, 2, 3)
ORDER BY p.surname DESC, p.name DESC;');


-- 6. Recupera els noms dels jugadors que tenen una data de naixement anterior al març de 1980. Quin és el nom del jugador de cognom Lue que apareix als primers resultats?
SELECT p.name FROM person AS p 
JOIN player AS pl ON pl.IDCard = p.IDCard
WHERE p.BirthDate < "1980-03-01"
AND p.surname = "Lue";

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (6, 'Tyronn', 'SELECT p.name FROM person AS p 
JOIN player AS pl ON pl.IDCard = p.IDCard
WHERE p.BirthDate < "1980-03-01"
AND p.surname = "Lue";'); 

-- 7. Per cada arena, digues el nombre de seients VIP que hi ha. Quants en te el Madison Square Garden?
SELECT COUNT(*)
FROM zone AS z
JOIN seat AS s ON z.ArenaName = s.ArenaName AND z.Code = s.ZoneCode
WHERE z.IsVip = TRUE AND z.ArenaName = 'Madison Square Garden';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (7, 1620, 'SELECT COUNT(*)
FROM zone AS z
JOIN seat AS s ON z.ArenaName = s.ArenaName AND z.Code = s.ZoneCode
WHERE z.IsVip = TRUE AND z.ArenaName = "Madison Square Garden";'); 

-- 8. Tenim guardat els colors dels seients de tots els estadis. Retorna quants seients blaus hi ha en total.
SELECT COUNT(*) FROM seat
WHERE color = "blue";

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (8, 36402, 'SELECT COUNT(*) FROM seat WHERE color = "blue";');

-- 9. Retorna la mitjana de seients (arrodonint sense decimals) per color d’entre tots els estadis. Quina es la mitjana dels platejats?
SELECT ROUND(AVG(COUNT_SEATS.NumSeats))
FROM (
    SELECT s.Color, COUNT(*) AS NumSeats
    FROM seat AS s
    GROUP BY s.ArenaName, s.Color
) AS COUNT_SEATS
WHERE COUNT_SEATS.Color = "Silver";

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (9, 1256, 'SELECT ROUND(AVG(COUNT_SEATS.NumSeats))
FROM (
    SELECT s.Color, COUNT(*) AS NumSeats
    FROM seat AS s
    GROUP BY s.ArenaName, s.Color
) AS COUNT_SEATS
WHERE COUNT_SEATS.Color = "Silver";');

-- 10. Retorna els entrenadors principals amb el seu rendiment segons el salari (rendiment = (VictoryPercentage / 100) * (Salary / 1000)), tallant els decimals que resultin. Quin és el rendiment de l'entrenador 100000004?
SELECT h.IDCard, p.Name, p.Surname, 
       (h.VictoryPercentage / 100) * (h.Salary / 1000) AS rendiment,
       FLOOR((h.VictoryPercentage / 100) * (h.Salary / 1000)) AS rendiment_no_Decimals
FROM headcoach AS h
JOIN person AS p ON h.IDCard = p.IDCard
WHERE h.IDCard = 100000004;

-- 11. Per cada equip retorna quantes vegades ha guanyat. Sempre que siguin 3 vegades o més. Quantes files retorna el select?
SELECT  f.name, COUNT(f.name) AS contador FROM franchise AS f, franchise_season AS frans 
WHERE f.name = frans.franchiseName AND frans.isWinner IS TRUE
GROUP BY f.name
HAVING COUNT(f.name) >= 3;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (11,4,'SELECT f.name, COUNT(f.name) AS contador FROM franchise AS f, franchise_season AS frans WHERE f.name = frans.franchiseName AND frans.isWinner IS TRUE GROUP BY f.name HAVING COUNT(f.name) >= 3;');

-- 12. Retorna amb el país i any els equips nacionals amb el nom i cognom del seu entrenador. Fes-ho pels anys del 2010 al 2015 i pels països que comencin per A. Quants entrenadors retorna la consulta?
SELECT nt.Country, nt.year, p.name, p.surname FROM nationalteam AS nt, headcoach AS h, person AS p 
WHERE nt.IDCardHeadCoach  = h.IDCard AND h.IDCard = p.IDCard
AND nt.year BETWEEN 2010 AND 2015 
AND nt.country LIKE 'A%';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (12,6,'SELECT nt.Country, nt.year, p.name, p.surname FROM nationalteam AS nt, headcoach AS h, person AS p WHERE nt.IDCardHeadCoach  = h.IDCard AND h.IDCard = p.IDCard AND nt.year BETWEEN 2010 AND 2015 AND nt.country LIKE "A%";');

-- 13. Per un any específic retorna per cada equip la suma dels salaris dels seus jugadors. Asumeix que tots els jugadors que tenen un contracte en qualsevol data de l'any 2007 s'ha de contabilitzar. Quin és el presupost dels Houston Rockets?
SELECT f.name,  SUM(pf.salary) FROM franchise AS f, player_franchise AS pf
WHERE f.name = pf.franchiseName 
AND YEAR(pf.startContract) = 2007
GROUP BY f.name
HAVING f.name = 'Houston Rockets';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (13,25654886,'SELECT f.name,  SUM(pf.salary) FROM franchise AS f, player_franchise AS pf
WHERE f.name = pf.franchiseName 
AND YEAR(pf.startContract) = 2007
GROUP BY f.name
HAVING f.name = "Houston Rockets";');

-- 14. Retorna cada arena amb la seva capacitat, juntament amb el nombre de seients que tenen. Quants seients té el Footprint Center?
SELECT ar.name, ar.capacity, COUNT(*) FROM arena AS ar, zone AS z, seat AS s 
WHERE ar.name = z.ArenaName AND z.Code = s.ZoneCode AND z.arenaName = s.ArenaName AND ar.name = 'Footprint Center'
GROUP BY ar.name;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (14,17064,'SELECT ar.name, ar.capacity, COUNT(*) FROM arena AS ar, zone AS z, seat AS s WHERE ar.name = z.ArenaName AND z.Code = s.ZoneCode AND z.arenaName = s.ArenaName AND ar.name = "Footprint Center" GROUP BY ar.name;'); 

-- 15. Crea un informe amb tots els jugadors que no son dels Estats Units ni d'Espanya. Inclou-ne tota la seva informació personal completa. Ordena els resultats per nacionalitat i data de naixement ascendent. Quina és la ID del terncer juador retornat?
SELECT p.*
FROM person AS p
JOIN player AS pl ON p.IDCard = pl.IDCard
WHERE p.nationality NOT IN ('Spain', 'United States')
ORDER BY p.nationality ASC, p.BirthDate ASC
LIMIT 2, 1; -- Valido tambien 1 OFFSET 2

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (15,100050477,'SELECT p.* FROM person AS p JOIN player AS pl ON p.IDCard = pl.IDCard WHERE p.nationality NOT IN ("Spain", "United States") ORDER BY p.nationality ASC, p.BirthDate ASC LIMIT 2, 1;'); 

-- 16. Mostra un informe amb el nom, cognom i data de naixement de tots els caps d'entrenadors assistents de l'especialitat de psicologia sense repetits i que tenen una data de naixement registrada. Ordena per cognom i nom. Quin és l'any de naixement del tercer resultat?

SELECT DISTINCT p.IDCard, p.name, p.surname, p.birthDate  
FROM person AS p  
JOIN assistantcoach As a ON p.IDCard = a.IDCard  
WHERE a.IDCard IN (SELECT DISTINCT IDCardBoss FROM assistantcoach WHERE IDCardBoss IS NOT NULL)  
AND a.especiality = "Psychologist"
AND p.birthDate IS NOT NULL  
ORDER BY p.surname, p.name
LIMIT 2,1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (16,1976,'SELECT DISTINCT p.IDCard, p.name, p.surname, p.birthDate FROM person AS p JOIN assistantcoach As a ON p.IDCard = a.IDCard WHERE a.IDCard IN (SELECT DISTINCT IDCardBoss FROM assistantcoach WHERE IDCardBoss IS NOT NULL) AND a.especiality = "Psychologist" AND p.birthDate IS NOT NULL ORDER BY p.surname, p.name LIMIT 2,1;'); 


-- 17. Volem saber quantes franquícies hi ha per a cada conferència. Mostra totes les dades relacionades amb la conferència i un nou camp amb el recompte. Quantes franquícies hi ha acada conferència?
SELECT c.name, c.GeographicZone, COUNT(f.ConferenceName) AS contador
FROM franchise AS f, conference AS c 
WHERE f.ConferenceName = c.name 
GROUP BY c.name, c.GeographicZone;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (17,15,'SELECT c.name, c.GeographicZone, COUNT(f.ConferenceName) AS contador FROM franchise AS f, conference AS c WHERE f.ConferenceName = c.name GROUP BY c.name, c.GeographicZone;'); 

-- 18. Sabent que molts jugadors han estat seleccionats en algun moment per les seves seleccions, retorna tots els jugadors que han estat seleccionats en l'any 2010. Inclou IDCard, Nom, Cognom, Nacionalitat, Any de selecció, en aquell mateix any i el número de samarreta en la selecció. Ordena el resultat pel numero de samarreta. Quina es al nacionalitat del primer resultat que apareix?
SELECT p.IDCard, p.name, p.surname, p.nationality, ntp.year, ntp.shirtNumber
FROM nationalteam_player AS ntp, player AS pl, person AS p
WHERE ntp.IDCard = pl.IDCard AND pl.IDCard = p.IDCard
AND ntp.year = 2010
ORDER BY ntp.shirtNumber
LIMIT 1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (18,'canada','SELECT p.IDCard, p.name, p.surname, p.nationality, ntp.year, ntp.shirtNumber FROM nationalteam_player AS ntp, player AS pl, person AS p WHERE ntp.IDCard = pl.IDCard AND pl.IDCard = p.IDCard AND ntp.year = 2010 ORDER BY ntp.shirtNumber LIMIT 1;'); 

-- 19. Retorna el ID, nom i cognom dels jugadors i les dades del seu draft si es que en tenen. Ordena per cognom i any de draft. Quina es la ID del primer resultat?
SELECT p.IDCard, p.name, p.surname, dpf.* 
FROM person AS p JOIN player AS pl ON p.IDCard = pl.IDCard
LEFT JOIN draft_player_franchise AS dpf ON pl.IDCard = dpf.IDCardPlayer
ORDER BY p.surname, dpf.draftYear
LIMIT 1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (19,100050166,'SELECT p.IDCard, p.name, p.surname, dpf.* FROM person AS p JOIN player AS pl ON p.IDCard = pl.IDCard LEFT JOIN draft_player_franchise AS dpf ON pl.IDCard = dpf.IDCardPlayer ORDER BY p.surname, dpf.draftYear LIMIT 1;'); 

-- 20. Retorna les franquícies que han jugat a totes les temporades regulars registrades. Ordena alfabèticament de la Z a la A. I tornaúnicament el 3 resultat.Quin és el nom del equip?
SELECT f.name
FROM franchise AS f
JOIN franchise_season AS fs ON f.name = fs.franchiseName
GROUP BY f.name
HAVING COUNT(DISTINCT fs.regularSeasonYear) = (SELECT COUNT(DISTINCT year) FROM regularseason)
ORDER BY f.name DESC
LIMIT 2,1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (20,'Toronto Raptors','SELECT f.name FROM franchise AS f JOIN franchise_season AS fs ON f.name = fs.franchiseName GROUP BY f.name HAVING COUNT(DISTINCT fs.regularSeasonYear) = (SELECT COUNT(DISTINCT year) FROM regularseason) ORDER BY f.name DESC LIMIT 2,1;'); 


-- 21. Per cada especialitat d'entrenadors assistents, retorna quants n'ha tingut cada franquícia. Qunatsmetges tenen els Brooklin Nets?
SELECT COUNT(a.especiality), a.FranchiseName FROM assistantcoach a 
	WHERE Especiality ="Doctor"
	AND FranchiseName="Brooklyn Nets"
	GROUP BY FranchiseName ;
	
