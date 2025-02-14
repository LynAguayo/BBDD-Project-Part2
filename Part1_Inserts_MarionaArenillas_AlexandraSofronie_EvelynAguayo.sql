-- Integrants: Mariona Arenillas, Alexandra Sofronie i Evelyn Aguayo 

USE LSG_NBA;

INSERT INTO persona (DNI, Nom, Cognom1, Cognom2, Nacionalitat, Sexe, DataNaixement) VALUES
('12345678A', 'Juan', 'García', 'López', 'España', 'H', '1990-05-15'),
('23456789B', 'María', 'Martínez', 'Sánchez', 'España', 'D', '1992-08-22'),
('34567890C', 'Carlos', 'Fernández', 'Gómez', 'Argentina', 'H', '1988-03-10'),
('45678901D', 'Ana', 'Pérez', 'Rodríguez', 'México', 'D', '1995-11-30'),
('56789012E', 'Luis', 'González', 'Hernández', 'Colombia', 'H', '1993-07-25'),
('67890123F', 'Sofía', 'Díaz', 'Ruiz', 'España', 'D', '1991-09-12'),
('78901234G', 'Pedro', 'Sánchez', 'Jiménez', 'España', 'H', '1989-04-18'),
('89012345H', 'Lucía', 'Romero', 'Alonso', 'España', 'D', '1994-02-05'),
('90123456I', 'Miguel', 'Torres', 'Vargas', 'Venezuela', 'H', '1996-06-20'),
('01234567J', 'Elena', 'Navarro', 'Molina', 'España', 'D', '1997-12-03'),
('11223344K', 'Javier', 'Morales', 'Ortega', 'España', 'H', '1990-10-08'),
('22334455L', 'Carmen', 'Rubio', 'Serrano', 'España', 'D', '1993-01-14'),
('33445566M', 'Alejandro', 'Delgado', 'Castro', 'España', 'H', '1992-07-19'),
('44556677N', 'Isabel', 'Ramírez', 'Iglesias', 'España', 'D', '1995-05-28'),
('55667788O', 'David', 'Santos', 'Guerrero', 'España', 'H', '1994-09-09'),
('66778899P', 'Paula', 'Cruz', 'Flores', 'España', 'D', '1996-03-17'),
('77889900Q', 'Daniel', 'Lorenzo', 'Méndez', 'España', 'H', '1991-11-23'),
('88990011R', 'Laura', 'Herrera', 'Gutiérrez', 'España', 'D', '1997-08-07'),
('99001122S', 'Sergio', 'Reyes', 'Cabrera', 'España', 'H', '1990-04-12'),
('00112233T', 'Marta', 'Vega', 'León', 'España', 'D', '1993-12-25'),
('00011122', 'Elena', 'Martinez', 'Cayo', 'España', 'D', '1995-01-01'),
('11122233', 'Estela', 'Chavez', 'Cruz', 'Argentina', 'D', '1996-02-02');

INSERT INTO pavello (Nom, Ciutat, Capacitat) VALUES
('Staples Center', 'Los Ángeles', 20000),
('Chase Center', 'San Francisco', 18000),
('United Center', 'Chicago', 21000),
('TD Garden', 'Boston', 19000);

INSERT INTO conferencia (Nom, ZonaGeografica) VALUES
('Este', 'Este de Estados Unidos'),
('Oeste', 'Oeste de Estados Unidos');

INSERT INTO equip_nacional (Any, Pais) VALUES
(2020, 'España'),
(2020, 'Argentina'),
(2020, 'México'),
(2020, 'Colombia'),
(2020, 'Venezuela'),
(2020, 'Estados Unidos'),
(2020, 'Francia'),
(2020, 'Portugal');

INSERT INTO draft (Any) VALUES
(2020),
(2021),
(2022),
(2023);

INSERT INTO temporada_regular (Any, Inici, Fi) VALUES
(2020, '2020-10-20', '2021-04-10'),
(2021, '2021-10-19', '2022-04-09'),
(2022, '2022-10-18', '2023-04-08');

INSERT INTO entrenador_principal (DNI, PercentatgeVictories, Salari, AnyEquipNacional, PaisEquipNacional) VALUES
('12345678A', 65.50, 50000.00, 2020, 'Francia'),
('23456789B', 70.25, 60000.00, 2020, 'Colombia'),
('34567890C', 60.75, 45000.00, 2020, 'Argentina'),
('45678901D', 55.00, 40000.00, 2020, 'Venezuela'),
('56789012E', 80.00, 70000.00, 2020, 'Estados Unidos'),
('67890123F', 50.50, 35000.00, 2020, 'España'),
('78901234G', 75.25, 55000.00, 2020, 'Portugal'),
('89012345H', 65.00, 48000.00, 2020, 'México');

INSERT INTO franquicia (Nom, Ciutat, Pressupost, AnellsNBA, DNIEntrenadorPrincipal, NomPavello, DNIPropietari, NomConferencia) VALUES
('Lakers', 'Los Ángeles', 3000000.00, 17, '12345678A', 'Staples Center', '12345678A', 'Oeste'),
('Warriors', 'San Francisco', 1800000.00, 7, '23456789B', 'Chase Center', '23456789B', 'Oeste'),
('Bulls', 'Chicago', 1500000.00, 6, '34567890C', 'United Center', '34567890C', 'Este'),
('Celtics', 'Boston', 1700000.00, 17, '45678901D', 'TD Garden', '45678901D', 'Este');

INSERT INTO jugador (DNI, AnysPRO, UniversitatOrigen, NombreAnellsNBA, Dorsal, NomFranquicia) VALUES
('11223344K', 5, 'Universidad de Madrid', 0, 11, 'Lakers'),
('22334455L', 3, 'Universidad de Valencia', 0, 14, 'Warriors'),
('33445566M', 6, 'Universidad de Sevilla', 2, 33, 'Celtics'),
('44556677N', 4, 'Universidad de Zaragoza', 0, 20, 'Warriors'),
('55667788O', 7, 'Universidad de Barcelona', 1, 6, 'Bulls'),
('66778899P', 2, 'Universidad de México', 0, 4, 'Celtics'),
('77889900Q', 5, 'Universidad de Madrid', 0, 8, 'Warriors'),
('88990011R', 3, 'Universidad de Valencia', 0, 12, 'Celtics'),
('99001122S', 6, 'Universidad de Sevilla', 2, 24, 'Lakers'),
('00112233T', 4, 'Universidad de Zaragoza', 0, 9, 'Bulls'),
('12345678A', 5, 'Universidad de Barcelona', 1, 23, 'Lakers'),
('23456789B', 3, 'Universidad de Madrid', 0, 7, 'Warriors'),
('34567890C', 8, 'Universidad de Buenos Aires', 2, 10, 'Bulls'),
('45678901D', 2, 'Universidad de México', 0, 5, 'Celtics'),
('56789012E', 6, 'Universidad de Bogotá', 1, 30, 'Lakers'),
('67890123F', 4, 'Universidad de Valencia', 0, 8, 'Warriors'),
('00011122', 3, 'Universidad de Barcelona', 0, NULL, 'Lakers'),
('11122233', 4, 'Universidad de Madrid', 1, NULL, 'Warriors');

INSERT INTO preparador_fisic (DNI, Especialitat, Cap, NomFranquicia) VALUES
('77889900Q', 'Fuerza', NULL, 'Lakers'),
('88990011R', 'Resistencia', '77889900Q', 'Warriors'),
('99001122S', 'Flexibilidad', '77889900Q', 'Bulls'),
('00112233T', 'Recuperación', '99001122S', 'Celtics'),
('11223344K', 'Cardio', '88990011R', 'Bulls');

INSERT INTO franquicia_temporada (NomFranquicia, AnyTemporada, EsGuanyador) VALUES
('Lakers', 2020, 1),
('Warriors', 2021, 1),
('Bulls', 2022, 0),
('Celtics', 2020, 0),
('Lakers', 2021, 0),
('Warriors', 2022, 1),
('Bulls', 2020, 0),
('Celtics', 2021, 0),
('Lakers', 2022, 1),
('Warriors', 2020, 0),
('Bulls', 2021, 0),
('Celtics', 2022, 1);

INSERT INTO equip_nacional_jugador (Any, Pais, DNI) VALUES
(2020, 'España', '11223344K'),
(2020, 'Argentina', '22334455L'),
(2020, 'México', '33445566M'),
(2020, 'Colombia', '44556677N'),
(2020, 'Venezuela', '55667788O'),
(2020, 'Estados Unidos', '66778899P'),
(2020, 'Francia', '77889900Q'),
(2020, 'Portugal', '88990011R'),
(2020, 'España', '99001122S'),
(2020, 'Argentina', '00112233T'),
(2020, 'España', '12345678A'),
(2020, 'Argentina', '23456789B'),
(2020, 'México', '34567890C'),
(2020, 'Colombia', '45678901D'),
(2020, 'Venezuela', '56789012E'),
(2020, 'Estados Unidos', '67890123F'),
(2020, 'España', '00011122'),
(2020, 'Argentina', '11122233');

INSERT INTO grada (Codi, NomPavello, EsCoberta) VALUES
(1, 'Staples Center', 1),
(2, 'Staples Center', 0),
(13, 'Staples Center', 1),
(4, 'Staples Center', 0),
(1, 'Chase Center', 1),
(2, 'Chase Center', 0),
(13, 'Chase Center', 1),
(4, 'Chase Center', 0),
(1, 'United Center', 1),
(2, 'United Center', 0),
(13, 'United Center', 0),
(1, 'TD Garden', 1),
(2, 'TD Garden', 0),
(13, 'TD Garden', 1);

INSERT INTO seient (Codi, NomPavello, Numero, Color) VALUES
-- Staples Center
(1, 'Staples Center', 1, 'Rojo'),
(1, 'Staples Center', 2, 'Azul'),
(1, 'Staples Center', 3, 'Azul'),
(1, 'Staples Center', 4, 'Verde'),
(2, 'Staples Center', 1, 'Verde'),
(2, 'Staples Center', 2, 'Rojo'),
(2, 'Staples Center', 3, 'Negro'),
(2, 'Staples Center', 4, 'Rojo'),
(13, 'Staples Center', 1, 'Negro'),
(13, 'Staples Center', 2, 'Verde'),
(4, 'Staples Center', 1, 'Rojo'),
(4, 'Staples Center', 2, 'Negro'),

-- Chase Center
(1, 'Chase Center', 1, 'Verde'),
(1, 'Chase Center', 2, 'Amarillo'),
(1, 'Chase Center', 3, 'Blanco'),
(1, 'Chase Center', 4, 'Amarillo'),
(2, 'Chase Center', 1, 'Azul'),
(2, 'Chase Center', 2, 'Blanco'),
(2, 'Chase Center', 3, 'Azul'),
(2, 'Chase Center', 4, 'Verde'),
(13, 'Chase Center', 1, 'Amarillo'),
(13, 'Chase Center', 2, 'Azul'),
(4, 'Chase Center', 1, 'Blanco'),
(4, 'Chase Center', 2, 'Amarillo'),

-- United Center
(1, 'United Center', 1, 'Negro'),
(1, 'United Center', 2, 'Blanco'),
(1, 'United Center', 3, 'Negro'),
(2, 'United Center', 1, 'Verde'),
(2, 'United Center', 2, 'Rojo'),
(13, 'United Center', 1, 'Negro'),
(13, 'United Center', 2, 'Verde'),

-- TD Garden
(1, 'TD Garden', 1, 'Rojo'),
(1, 'TD Garden', 2, 'Azul'),
(1, 'TD Garden', 3, 'Blanco'),
(2, 'TD Garden', 1, 'Amarillo'),
(2, 'TD Garden', 2, 'Azul'),
(13, 'TD Garden', 1, 'Blanco'),
(13, 'TD Garden', 2, 'Amarillo');

INSERT INTO draft_jugador_franquicia (AnyDRAFT, DNIJugador, NomFranquicia, Posicio) VALUES
(2020, '11223344K', 'Lakers', 1),
(2021, '22334455L', 'Warriors', 2),
(2020, '33445566M', 'Celtics', 1),
(2022, '44556677N', 'Warriors', 1),
(2021, '55667788O', 'Bulls', 2),
(2021, '66778899P', 'Celtics', 3),
(2020, '77889900Q', 'Lakers', 3),
(2022, '88990011R', 'Bulls', 1),
(2020, '99001122S', 'Lakers', 4),
(2022, '00112233T', 'Bulls', 2),
(2020, '12345678A', 'Lakers', 5),
(2021, '23456789B', 'Warriors', 4),
(2022, '34567890C', 'Bulls', 3);
