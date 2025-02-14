-- Integrants: Mariona Arenillas, Alexandra Sofronie i Evelyn Aguayo

-- 1. Quants estadis hi ha?
SELECT COUNT(*) FROM arena;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('1', '29', 'SELECT COUNT(*) FROM arena;')

-- 2. Obté el nom i cognom de l'entrenador principal de cada franquícia. Quin és el cognom de l'entrenador de Utah Jazz?
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

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (10, 5002, 'SELECT h.IDCard, p.Name, p.Surname, 
       (h.VictoryPercentage / 100) * (h.Salary / 1000) AS rendiment,
       FLOOR((h.VictoryPercentage / 100) * (h.Salary / 1000)) AS rendiment_no_Decimals
        FROM headcoach AS h
        JOIN person AS p ON h.IDCard = p.IDCard
        WHERE h.IDCard = 100000004;');

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

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (21,5,'SELECT COUNT(a.especiality), a.FranchiseName FROM assistantcoach a 
	WHERE Especiality ="Doctor"
	AND FranchiseName="Brooklyn Nets"
	GROUP BY FranchiseName ;')	

-- 22. Troba quantes persones han nascut en un any en el qual no hi ha registrat un draft
SELECT COUNT(*) FROM person p
	WHERE NOT EXISTS (
   		SELECT Year 
    	FROM draft d 
    	WHERE YEAR(p.birthDate) = d.Year
	)
	AND YEAR(p.BirthDate) IS NOT NULL
	ORDER BY p.IDCard;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (22,551,'SELECT COUNT(*) FROM person p
	WHERE NOT EXISTS (
   		SELECT Year 
    	FROM draft d 
    	WHERE YEAR(p.birthDate) = d.Year
	)
	AND YEAR(p.BirthDate) IS NOT NULL
	ORDER BY p.IDCard;')	


-- 23. Quants entrenadors cobren més que qualsevol jugador?
SELECT COUNT(*) FROM headcoach h WHERE
	h.Salary > (SELECT MAX(pf.Salary) FROM player_franchise pf);

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (23,82,'SELECT COUNT(*) FROM headcoach h WHERE
	h.Salary > (SELECT MAX(pf.Salary) FROM player_franchise pf);')	

-- 24. Omple la columna NBARings de la taula de Franquícies. Aquest camp es pot calcular mitjançant la taula Franchise_Season contant quantes vegades han guanyat. Utilitza una declaració UPDATE. Un cop ho tingueu, trobeu quantes franquícies tenen 4 o més anells.

--Update
UPDATE franchise f 
SET NBARings=(SELECT COUNT(*) FROM franchise_season fs WHERE fs.IsWinner=1 AND f.Name=fs.FranchiseName GROUP BY fs.FranchiseName);
--Filtrar los que tienen mas de 4 anillos
SELECT COUNT(*) FROM franchise f WHERE NBARings >= 4;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (24,3,'--Update
UPDATE franchise f SET NBARings=(SELECT COUNT(*) FROM franchise_season fs WHERE fs.IsWinner=1 AND f.Name=fs.FranchiseName
	GROUP BY fs.FranchiseName);
--Filtrar los que tienen mas de 4 anillos
SELECT COUNT(*) FROM franchise f WHERE NBARings >= 4;')	

-- 25. Troba el nom de la franquícia amb el valor de budjet més petit.
SELECT f.Name FROM franchise f WHERE f.Budget = (SELECT MIN(f2.Budget) FROM franchise f2);

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (25,'New Orleans Pelicans','SELECT f.Name FROM franchise f WHERE f.Budget = (SELECT MIN(f2.Budget) FROM franchise f2);')	

-- 26. Troba la ciutat de l'arena que tingui més seients sempre i quan siguin més de 18000 (veure taules seat i arena, NO utilitzar Capacity)
SELECT a.City FROM arena a WHERE a.Name=(
	SELECT s.ArenaName 
	FROM seat s 
	GROUP BY s.ArenaName
	HAVING COUNT(*) > 18000
	ORDER BY COUNT(*) DESC
	LIMIT 1);

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (26,'Chicago','SELECT a.City FROM arena a WHERE a.Name=(
	SELECT s.ArenaName 
	FROM seat s 
	GROUP BY s.ArenaName
	HAVING COUNT(*) > 18000
	ORDER BY COUNT(*) DESC
	LIMIT 1);')	

-- 27. Retorna la ID del jugador i el nom de la seva franquicia que han quedat primers al draft i al mateix any d'aquest han gunayat la temporada regular. Retorna la ID de l'únic que te Universitat d'origen.
SELECT p.IDCard FROM player p
	JOIN draft_player_franchise dpf ON p.IDCard =dpf.IDCardPlayer
	JOIN player_franchise pf ON p.IDCard =pf.IDCardPlayer
	JOIN franchise_season fs ON pf.FranchiseName =fs.FranchiseName
	WHERE dpf.DraftYear =fs.RegularSeasonYear 
	AND fs.IsWinner =1
	AND dpf.`Position` =1
	AND p.UniversityOfOrigin IS NOT NULL;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (27,100012078,'SELECT p.IDCard FROM player p
	JOIN draft_player_franchise dpf ON p.IDCard =dpf.IDCardPlayer
	JOIN player_franchise pf ON p.IDCard =pf.IDCardPlayer
	JOIN franchise_season fs ON pf.FranchiseName =fs.FranchiseName
	WHERE dpf.DraftYear =fs.RegularSeasonYear 
	AND fs.IsWinner =1
	AND dpf.`Position` =1
	AND p.UniversityOfOrigin IS NOT NULL;')	

-- 28. Retorna els paisos amb més de 50 jugadors, 3 entrenadors i 10 assistents de paisos que tinguin selecció. Quin país apareix als resultats?
SELECT n.Country FROM nationalteam n 
	WHERE n.Country IN
		(SELECT p.Nationality FROM person p 
			JOIN player p2 ON p.IDCard =p2.IDCard
			GROUP BY p.Nationality
			HAVING COUNT(*) > 50)
	AND n.Country  IN
		(SELECT n2.Country FROM nationalteam n2
			GROUP BY n2.Country
			HAVING COUNT(*) >3)
	AND n.Country  IN
		(SELECT p.Nationality FROM person p 
			JOIN assistantcoach a ON p.IDCard =a.IDCard
			GROUP BY p.Nationality
			HAVING COUNT(*) >10)
	GROUP BY n.Country 

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (28,'united states','SELECT n.Country FROM nationalteam n 
	WHERE n.Country IN
		(SELECT p.Nationality FROM person p 
			JOIN player p2 ON p.IDCard =p2.IDCard
			GROUP BY p.Nationality
			HAVING COUNT(*) > 50)
	AND n.Country  IN
		(SELECT n2.Country FROM nationalteam n2
			GROUP BY n2.Country
			HAVING COUNT(*) >3)
	AND n.Country  IN
		(SELECT p.Nationality FROM person p 
			JOIN assistantcoach a ON p.IDCard =a.IDCard
			GROUP BY p.Nationality
			HAVING COUNT(*) >10)
	GROUP BY n.Country ')	

-- 29. Retorna els headcoach que entrenin equips nacionals amb el salari més gran o el percentantge de victòria més petit, d'entre els que entrenen equips nacionals. Quan sumen els salaris dels entrenadors resultants?
SELECT SUM(h.Salary) FROM headcoach h 
	JOIN nationalteam n ON h.IDCard=n.IDCardHeadCoach
	WHERE h.Salary = (SELECT MAX(h2.Salary) 
					  FROM headcoach h2
					  JOIN nationalteam n2 ON h2.IDCard=n2.IDCardHeadCoach)
	OR h.VictoryPercentage= (SELECT MIN(h3.VictoryPercentage) 
							 FROM headcoach h3
							 JOIN nationalteam n3 ON h3.IDCard =n3.IDCardHeadCoach)

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (29,10899000,'SELECT SUM(h.Salary) FROM headcoach h 
	JOIN nationalteam n ON h.IDCard=n.IDCardHeadCoach
	WHERE h.Salary = (SELECT MAX(h2.Salary) 
					  FROM headcoach h2
					  JOIN nationalteam n2 ON h2.IDCard=n2.IDCardHeadCoach)
	OR h.VictoryPercentage= (SELECT MIN(h3.VictoryPercentage) 
							 FROM headcoach h3
							 JOIN nationalteam n3 ON h3.IDCard =n3.IDCardHeadCoach)')	

-- 30. Retorna els jugadors que han jugat en 2 equips o més i han estat convocats també a la selecció més d'un cop. Qunats jugadors hi ha en aquesta situació?
SELECT COUNT(*) AS num_jugadores 
FROM (
    SELECT p.IDCard
    FROM player p
    JOIN player_franchise pf ON p.IDCard = pf.IDCardPlayer
    JOIN nationalteam_player np ON p.IDCard = np.IDCard
    GROUP BY p.IDCard
    HAVING COUNT(DISTINCT pf.FranchiseName) >= 2 
       AND COUNT(DISTINCT np.Year) >= 2  
) AS jugador;


INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (30,0,'SELECT COUNT(*) AS num_jugadores 
FROM (
    SELECT p.IDCard
    FROM player p
    JOIN player_franchise pf ON p.IDCard = pf.IDCardPlayer
    JOIN nationalteam_player np ON p.IDCard = np.IDCard
    GROUP BY p.IDCard
    HAVING COUNT(DISTINCT pf.FranchiseName) >= 2 
       AND COUNT(DISTINCT np.Year) >= 2  
) AS jugador;
'); 

-- 1301. Quina és la mitja del salary dels jugadors per any? (Agafa l'any que han començat els seus contractes per fer les mitjes i arrodoneix el resultat a 2 decimals). Quin és el valor resultant dels decimals de l'any 2009?
SELECT YEAR(startContract) AS any, ROUND(AVG(salary),2) AS mitjana_salary
FROM player_franchise
GROUP BY YEAR(startContract)
ORDER BY YEAR(startContract);

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (1301,62,'SELECT YEAR(startContract) AS any, ROUND(AVG(salary),2) AS mitjana_salary FROM player_franchise GROUP BY YEAR(startContract) ORDER BY YEAR(startContract);'); 

-- 1401. En quin estadi la capacitat excedeit en mes de 50 el nombre de seients?
SELECT a.Name, (a.Capacity - COUNT(s.Number)) as dif FROM arena a  
	JOIN seat s ON a.Name = s.ArenaName
	GROUP BY a.Name
	HAVING dif > 50

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (1401,'Smoothie King Center','SELECT a.Name, (a.Capacity - COUNT(s.Number)) as dif FROM arena a  
	JOIN seat s ON a.Name = s.ArenaName
	GROUP BY a.Name
	HAVING dif > 50
'); 

-- 1701. Volem saber quants estadis hi ha per conferència. Mostra totes les dades relacionades amb la conferència i un nou camp amb el recompte d'estadis. Quants estadis tenim a la conferència oest?
SELECT f.ConferenceName, c.GeographicZone, COUNT(DISTINCT f.ArenaName) AS recompteEstadis FROM franchise f
	JOIN conference c ON f.ConferenceName =c.Name
	GROUP BY f.ConferenceName  

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (1701,14,'SELECT f.ConferenceName, c.GeographicZone, COUNT(DISTINCT f.ArenaName) AS recompteEstadis FROM franchise f
	JOIN conference c ON f.ConferenceName =c.Name
	GROUP BY f.ConferenceName '); 

-- 2001. Retorna els equips nacionals que han jugat a tots els anys on en tenim de registrats. Quants equips surten?
SELECT n.Country FROM nationalteam n
	GROUP BY n.Country
	HAVING COUNT(DISTINCT n.Year) = (SELECT COUNT(DISTINCT Year) FROM nationalteam)

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (2001,4,'SELECT n.Country FROM nationalteam n
	GROUP BY n.Country
	HAVING COUNT(DISTINCT n.Year) = (SELECT COUNT(DISTINCT Year) FROM nationalteam)'); 
