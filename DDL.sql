-- Crear tipo de datos para categorias
CREATE TYPE categorias AS ENUM (
    'Accion',
    'Comedia',
    'Drama',
    'Romance',
    'Ficcion',
    'Infantil'
);

-- Crear tabla sucursales
CREATE TABLE sucursales (
    id Serial primary key,
    ubicacion character varying(40) NOT NULL
);

-- Crear tabla peliculas
CREATE TABLE peliculas (
    id Serial primary key,
    titulo character varying(50) NOT NULL,
    genero categorias NOT NULL,
    director character varying(20) NOT NULL,
    aniolanzamiento integer NOT NULL,
    disponibilidad boolean NOT NULL,
    precioalquiler numeric(10,2) NOT NULL
);

-- Crear tabla sucursalpelicula
CREATE TABLE sucursalpelicula (
    idpelicula integer references peliculas(id),
    idsucursal integer references sucursales(id),
    primary key(idpelicula, idsucursal)
);

-- Crear tabla cliente
CREATE TABLE cliente (
    id Serial primary key,
    nombre character varying(50) NOT NULL,
    contacto character varying(30) NOT NULL,
    direccion character varying(50) NOT NULL
);

-- Crear tabla alquiler
CREATE TABLE alquiler (
    id Serial primary key,
    fechainicio date NOT NULL,
    fechadevolucion date NOT NULL,
    costototal numeric(10,2) NOT NULL,
    idcliente integer references cliente(id)
);

-- Crear tabla alquilerpeliculas
CREATE TABLE alquilerpeliculas (
    idalquiler integer references alquiler(id),
    idpelicula integer references peliculas(id),
    primary key(idalquiler, idpelicula)
);

-- Crear tabla pago
CREATE TABLE pago (
    id Serial primary key,
    fecha date NOT NULL,
    monto numeric(10,2),
    idcliente integer references cliente(id),
    idsucursal integer references sucursales(id)
);