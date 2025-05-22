
CREATE OR REPLACE FUNCTION procesar_compra(ClienteID INT, FechaDevolucionN date, idPelicula int) RETURNS TEXT AS $$
BEGIN
-- Verificar si el cliente tiene saldo suficiente
IF (SELECT id FROM cliente) <> ClienteID THEN
RAISE EXCEPTION 'Ese id no existe';
END IF;

-- Verificar si la fecha de devolucion no es antes de la fecha de inicio
IF (SELECT fechaInicio FROM alquiler  WHERE idCliente = ClienteID)
< FechaDevolucionN THEN
RAISE EXCEPTION 'No puedes devolver esta pelicula antes de tu fecha de inicio';
END IF;
-- Actualizar FechaDevolucion
UPDATE alquiler 
SET fechadevolucion = fechadevolucionN
WHERE idcliente = clienteID;
-- Actualizar inventario
UPDATE peliculas 
SET disponibilidad  = 'True'
WHERE id = idPelicula;
-- Confirmar la transacción
COMMIT;
-- retorno
RETURN 'Entrega realizada con exito’;
EXCEPTION
WHEN OTHERS THEN
ROLLBACK;
RETURN 'Error al procesar la compra';
END
$$ LANGUAGE plpgsql;