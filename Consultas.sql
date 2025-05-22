-- Consulta #1

select p.genero, sum(a.costoTotal) as ganancias
from peliculas p
join alquilerpeliculas ap on p.id = ap.idpelicula
join alquiler a on ap.idalquiler = a.id
where a.fechainicio >= current_date - interval '3 month'
group by p.genero
order by ganancias desc;

-- Consulta #2

select c.nombre, count(distinct ap.idPelicula)
from cliente c
join alquiler a on c.id = a.idcliente 
join alquilerpeliculas ap on a.id = ap.idalquiler 
group by c.nombre 
limit 5;

-- Consulta #3

select p.titulo
from peliculas p
left join alquilerpeliculas ap on p.id = ap.idpelicula
where ap.idpelicula is null;

-- Consulta #4

select p.titulo, avg(a.fechaDevolucion - a.fechaInicio)
from peliculas p
join alquilerpeliculas ap on p.id = ap.idpelicula 
join alquiler a on ap.idalquiler = a.id 
group by p.titulo;

-- Consulta #5

select s.ubicacion, count(sp.idPelicula) as cantidad
from sucursales s
join sucursalpelicula sp on s.id = sp.idsucursal
join peliculas p on sp.idpelicula = p.id
where p.genero = 'Accion'
group by s.ubicacion
order by cantidad
limit 1;

-- Consulta #6

select c.nombre
from cliente c
full outer join alquiler a on c.id = a.idcliente 
where a.fechainicio >= current_date - interval '6 month' and a.idcliente is null;

-- Consulta #7

select p.titulo
from peliculas p
join alquilerpeliculas ap on p.id = ap.idpelicula 
join alquiler a on ap.idalquiler = a.id
where date_trunc( 'year', a.fechainicio) >= '2025-01-01'
group by p.titulo
having count(distinct ap.idpelicula) > 10;

-- Consulta #8

select s.ubicacion, count(sp.idPelicula)
from sucursales s
join sucursalpelicula sp on s.id = sp.idsucursal 
group by s.ubicacion;






















































