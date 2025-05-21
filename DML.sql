-- Inserción para la tabla sucursales
INSERT INTO sucursales ( ubicacion) VALUES 
    ('Manizales'),
    ( 'Risaralda'),
    ( 'Santander'),
    ( 'Bogota'),
    ( 'Medellin');

-- Inserción para la tabla peliculas
INSERT INTO peliculas (titulo, genero, director, aniolanzamiento, disponibilidad, precioalquiler) VALUES 
    ( 'Cars', 'Infantil', 'Jeff Leston', 2003, true, 10000.00),
    ( 'Cars2', 'Infantil', 'Jeff Leston', 2005, true, 12000.00),
    ( 'Cars3', 'Infantil', 'Jeff Leston', 2007, true, 15000.00),
    ( 'Avengers', 'Accion', 'Stan lee', 2010, true, 10000.00),
    ( 'Avengers2', 'Accion', 'Stan lee', 2015, true, 15000.00),
    ( 'Avengers3', 'Accion', 'Stan lee', 2018, true, 17000.00),
    ( 'StarWars', 'Ficcion', 'DarkLord', 2009, true, 13000.00),
    ( 'StarWars2', 'Ficcion', 'DarkLord', 2011, true, 15000.00),
    ( 'StarWars3', 'Ficcion', 'DarkLord', 2015, true, 19000.00),
    ( 'SonComoNiños', 'Comedia', 'Timbre', 2013, true, 10000.00),
    ( 'SonComoNiños2', 'Comedia', 'Timbre', 2017, true, 11000.00),
    ( 'Kiss', 'Romance', 'Loured', 2020, true, 9000.00),
    ( 'Kiss2', 'Romance', 'Loured', 2022, true, 10000.00),
    ( 'PasionGavilanes', 'Drama', 'Caracol', 1999, true, 1000.00),
    ( 'PasionGavilanes2', 'Drama', 'Caracol', 2001, true, 5000.00);

-- Inserción para la tabla sucursalpelicula
INSERT INTO sucursalpelicula (idpelicula, idsucursal) VALUES 
    (1, 1),
    (4, 1),
    (7, 1),
    (2, 2),
    (3, 2),
    (5, 2),
    (6, 3),
    (9, 3),
    (11, 3),
    (15, 4),
    (8, 4),
    (12, 4),
    (10, 5),
    (13, 5),
    (14, 5);

-- Inserción para la tabla cliente
INSERT INTO cliente (nombre, contacto, direccion) VALUES 
    ( 'Marlon', '3012787447', 'Cra12A #22-37'),
    ( 'Yolanda', '3208346845', 'Cl14B #14-67'),
    ( 'Fabian', '3105569976', 'Av5A #62-12'),
    ( 'Eduard', '3223367524', 'Cra22 #45-31'),
    ( 'Diego', '3145569976', 'Av51B #33-09'),
    ( 'Gisela', '3202684173', 'cl24A #15-17'),
    ( 'Juandi', '3133042661', 'Cra17A #28-39'),
    ( 'Santiago', '3123133361', 'Cra19B #72-97'),
    ( 'Sara', '3156549888', 'Cra78B #12-97'),
    ( 'Isabella', '3036569912', 'Cl40 #22-90');

-- Inserción para la tabla alquiler
INSERT INTO alquiler ( fechainicio, fechadevolucion, costototal, idcliente) VALUES 
    ( '2025-01-10', '2025-01-12', 20000.00, 1),
    ( '2025-01-13', '2025-01-15', 23000.00, 2),
    ( '2025-02-10', '2025-02-12', 27000.00, 3),
    ( '2025-02-23', '2025-02-25', 30000.00, 4),
    ( '2025-03-10', '2025-03-12', 36000.00, 5),
    ( '2025-03-28', '2025-03-30', 30000.00, 6),
    ( '2025-04-01', '2025-04-10', 20000.00, 7),
    ( '2025-04-15', '2025-04-20', 24000.00, 8),
    ( '2025-05-11', '2025-05-15', 20000.00, 9),
    ( '2025-06-09', '2025-06-29', 11000.00, 10);

-- Inserción para la tabla alquilerpeliculas
INSERT INTO alquilerpeliculas (idalquiler, idpelicula) VALUES 
    (1, 1),
    (1, 4),
    (2, 7),
    (2, 1),
    (3, 2),
    (3, 3),
    (4, 3),
    (4, 5),
    (5, 6),
    (5, 9),
    (6, 9),
    (6, 11),
    (7, 15),
    (7, 8),
    (8, 8),
    (8, 12),
    (9, 10),
    (9, 13),
    (10, 13),
    (10, 14);

-- Inserción para la tabla pago
INSERT INTO pago ( fecha, monto, idcliente, idsucursal) VALUES 
    ( '2025-01-12', 20000.00, 1, 1),
    ( '2025-01-15', 23000.00, 2, 1),
    ( '2025-02-12', 27000.00, 3, 2),
    ( '2025-02-25', 30000.00, 4, 2),
    ( '2025-03-12', 36000.00, 5, 3),
    ( '2025-03-30', 30000.00, 6, 3),
    ( '2025-04-10', 20000.00, 7, 4),
    ( '2025-04-20', 24000.00, 8, 4),
    ( '2025-05-15', 20000.00, 9, 5),
    ( '2025-06-29', 11000.00, 10, 5);