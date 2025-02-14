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
('00112233T', 'Marta', 'Vega', 'León', 'España', 'D', '1993-12-25');

INSERT INTO pavello (Nom, Ciutat, Capacitat) VALUES
('Staples Center', 'Los Ángeles', '20000'),
('Chase Center', 'San Francisco', '18000'),
('United Center', 'Chicago', '21000'),
('TD Garden', 'Boston', '19000');

INSERT INTO conferencia (Nom, ZonaGeografica) VALUES
('Este', 'Este de Estados Unidos'),
('Oeste', 'Oeste de Estados Unidos');

INSERT INTO equip_nacional (Any, Pais) VALUES
(2020, 'España'),
(2021, 'Argentina'),
(2022, 'México'),
(2020, 'Colombia'),
(2021, 'Venezuela'),
(2022, 'España'),
(2020, 'Estados Unidos'),
(2021, 'Francia');

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
('12345678A', 65.50, 500000.00, 2020, 'España'),
('23456789B', 70.25, 600000.00, 2021, 'Argentina'),
('34567890C', 60.75, 450000.00, 2020, 'México'),
('45678901D', 55.00, 400000.00, 2022, 'Colombia'),
('56789012E', 80.00, 700000.00, 2021, 'Venezuela'),
('67890123F', 50.50, 350000.00, 2020, 'España'),
('78901234G', 75.25, 550000.00, 2022, 'España'),
('89012345H', 65.00, 480000.00, 2021, 'España');

INSERT INTO franquicia (Nom, Ciutat, Pressupost, AnillsNBA, DNIEntrenadorPrincipal, NomPavello, DNIPropietari, NomConferencia) VALUES
('Lakers', 'Los Ángeles', 200000000.00, 17, '12345678A', 'Staples Center', '12345678A', 'Oeste'),
('Warriors', 'San Francisco', 180000000.00, 7, '23456789B', 'Chase Center', '23456789B', 'Oeste'),
('Bulls', 'Chicago', 150000000.00, 6, '34567890C', 'United Center', '34567890C', 'Este'),
('Celtics', 'Boston', 170000000.00, 17, '45678901D', 'TD Garden', '45678901D', 'Este');

INSERT INTO jugador (DNI, AnysPRO, UniversitatOrigen, NombreAnellsNBA, Dorsal, NomFranquicia) VALUES
('12345678A', 5, 'Universidad de Barcelona', 1, 23, 'Lakers'),
('23456789B', 3, 'Universidad de Madrid', 0, 7, 'Warriors'),
('34567890C', 8, 'Universidad de Buenos Aires', 2, 10, 'Bulls'),
('45678901D', 2, 'Universidad de México', 0, 5, 'Celtics'),
('56789012E', 6, 'Universidad de Bogotá', 1, 30, 'Heat'),
('67890123F', 4, 'Universidad de Valencia', 0, 8, 'Spurs'),
('78901234G', 7, 'Universidad de Sevilla', 3, 24, 'Lakers'),
('89012345H', 1, 'Universidad de Zaragoza', 0, 12, 'Knicks'),
('90123456I', 9, 'Universidad de Caracas', 1, 15, 'Bucks'),
('01234567J', 2, 'Universidad de Barcelona', 0, 9, 'Nets'),
('11223344K', 5, 'Universidad de Madrid', 0, 11, 'Rockets'),
('22334455L', 3, 'Universidad de Valencia', 0, 14, 'Clippers'),
('33445566M', 6, 'Universidad de Sevilla', 2, 33, 'Bulls'),
('44556677N', 4, 'Universidad de Zaragoza', 0, 20, 'Warriors'),
('55667788O', 7, 'Universidad de Barcelona', 1, 6, 'Heat'),
('66778899P', 2, 'Universidad de México', 0, 4, 'Celtics');

INSERT INTO preparador_fisic (DNI, Especialitat, Cap, NomFranquicia) VALUES
('77889900Q', 'Fuerza', NULL, 'Lakers'),
('88990011R', 'Resistencia', '77889900Q', 'Warriors'),
('99001122S', 'Flexibilidad', '77889900Q', 'Bulls'),
('00112233T', 'Recuperación', '99001122S', 'Celtics'),
('11223344K', 'Cardio', '88990011R', 'Heat');

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
(2020, 'España', '12345678A'),
(2021, 'Argentina', '23456789B'),
(2022, 'México', '34567890C'),
(2020, 'Colombia', '45678901D'),
(2021, 'Venezuela', '56789012E'),
(2022, 'España', '67890123F'),
(2020, 'Estados Unidos', '78901234G'),
(2021, 'Francia', '89012345H');

INSERT INTO grada (NomPavello, EsCoberta) VALUES
('Staples Center', 1),
('Staples Center', 0),
('Chase Center', 1),
('Chase Center', 0),
('United Center', 1),
('United Center', 0),
('TD Garden', 1),
('TD Garden', 0),
('Staples Center', 1),
('Chase Center', 1),
('United Center', 0),
('TD Garden', 1),
('Staples Center', 0),
('Chase Center', 0);

INSERT INTO seient (Codi, NomPavello, Numero, Color) VALUES
(1, 'Staples Center', 1, 'Rojo'),
(2, 'Staples Center', 2, 'Azul'),
(3, 'Chase Center', 1, 'Verde'),
(4, 'Chase Center', 2, 'Amarillo'),
(5, 'United Center', 1, 'Negro'),
(6, 'United Center', 2, 'Blanco'),
(7, 'TD Garden', 1, 'Rojo'),
(8, 'TD Garden', 2, 'Azul'),
(9, 'Staples Center', 3, 'Verde'),
(10, 'Chase Center', 3, 'Amarillo'),
(11, 'United Center', 3, 'Negro'),
(12, 'TD Garden', 3, 'Blanco'),
(13, 'Staples Center', 4, 'Rojo'),
(14, 'Chase Center', 4, 'Azul'),
(15, 'United Center', 4, 'Verde'),
(16, 'TD Garden', 4, 'Amarillo'),
(17, 'Staples Center', 5, 'Negro'),
(18, 'Chase Center', 5, 'Blanco'),
(19, 'United Center', 5, 'Rojo'),
(20, 'TD Garden', 5, 'Azul'),
(21, 'Staples Center', 6, 'Verde'),
(22, 'Chase Center', 6, 'Amarillo'),
(23, 'United Center', 6, 'Negro'),
(24, 'TD Garden', 6, 'Blanco'),
(25, 'Staples Center', 7, 'Rojo'),
(26, 'Chase Center', 7, 'Azul'),
(27, 'United Center', 7, 'Verde'),
(28, 'TD Garden', 7, 'Amarillo'),
(29, 'Staples Center', 8, 'Negro'),
(30, 'Chase Center', 8, 'Blanco');

INSERT INTO draft_jugador_franquicia (AnyDRAFT, DNIJugador, NomFranquicia, Posicio) VALUES
(2020, '12345678A', 'Lakers', 1),
(2021, '23456789B', 'Warriors', 2),
(2022, '34567890C', 'Bulls', 3),
(2020, '45678901D', 'Celtics', 4),
(2021, '56789012E', 'Heat', 5),
(2022, '67890123F', 'Spurs', 6),
(2020, '78901234G', 'Lakers', 7),
(2021, '89012345H', 'Knicks', 8),
(2022, '90123456I', 'Bucks', 9),
(2020, '01234567J', 'Nets', 10),
(2021, '11223344K', 'Rockets', 11),
(2022, '22334455L', 'Clippers', 12),
(2020, '33445566M', 'Bulls', 13);

