-- Integrants: Mariona Arenillas, Alexandra Sofronie i Evelyn Aguayo 

USE LSG_NBA;

-- 1. Actualitza el Salari dels entrenadors principals i el Pressupost de la franquícia. Incrementeu aquests valors en un +3% i un +5% respectivament. (Pista: calen 2 updates)
UPDATE entrenador_principal
SET Salari = Salari * 1.03;

UPDATE franquicia
SET Pressupost = Pressupost * 1.05;

-- 2. Actualitza els DNIs de totes les persones a les quals els hi falta la lletra al final; afegintlos el caràcter ‘%’ al final. (Suposarem que els hi falta la lletra a tots els que tinguin una longitud de 8 caràcters).
UPDATE persona
SET DNI = CONCAT(DNI, '%')
WHERE LENGTH(DNI) = 8;

-- 3. Elimina els jugadors que tinguin el dorsal NULL.
DELETE FROM jugador
WHERE Dorsal IS NULL;

-- 4. Esborra tots aquells entrenadors principals que estiguin associats a una franquícia amb un pressupost inferior a 2 milions
UPDATE franquicia
SET DNIEntrenadorPrincipal = NULL
WHERE Pressupost < 2000000 AND DNIEntrenadorPrincipal IS NOT NULL;

DELETE FROM draft_jugador_franquicia
WHERE NomFranquicia IN (
    SELECT Nom
    FROM franquicia
    WHERE Pressupost < 2000000
);

DELETE FROM entrenador_principal
WHERE DNI IN (
    SELECT DNIEntrenadorPrincipal
    FROM franquicia
    WHERE Pressupost < 2000000 AND DNIEntrenadorPrincipal IS NOT NULL
);

-- 5. Com que tenim espectadors molt supersticiosos, no volen asseure’s a la grada número 13. Esborra les grades número 13 de tots els pavellons i també els seients associats. 
DELETE FROM grada
WHERE Codi = 13;

DELETE FROM seient
WHERE Codi = 13;

