/* 1. Actualiza el Salari dels entrenadors principals i el Pressupost de la franquícia;
incrementeu aquests valors en un +3% i un +5% respectivament. */
UPDATE entrenador_principal SET Salari = Salari * 1.03;
UPDATE franquicia SET Pressupost = Pressupost * 1.05; 

/* 2. Actualiza els DNIs de totes les persones a les quals els hi falta la lletra al final; afegint-los
el caràcter '%' al final. */
UPDATE persona SET DNI = CONCAT(DNI, '%') WHERE LENGTH(DNI)=8;

-- 3. Elimina els jugadors que tinguin el dorsal NULL.
DELETE FROM jugador WHERE dorsal IS NULL;

/* 4. Esborra tots aquells entrenadors principals que estiguin associalts a una franquícia amb un
pressupost inferior a 2 milions */
UPDATE franquicia SET DNIEntrenadorPrincipal = NULL WHERE Pressupost < 2000000;
DELETE FROM entrenador_principal WHERE DNI IN (SELECT DNIEntrenadorPrincipal FROM franquicia WHERE Pressupost < 2000000);

/* 5. Com que tenim espectadors molt supersticiosos, no volen asseure's a la grada número 13. 
Esborra les grades número 13 de tots els pavellons i també els seients associats. */
DELETE FROM seient WHERE Codi IN (SELECT Codi FROM grada WHERE Codi = 13);
DELETE FROM grada WHERE Codi = 13;