USE ventas;
DELIMITER $$
CREATE PROCEDURE vender(
	IN nombreProducto VARCHAR(50),
    IN cantidadVender INT) 
BEGIN
-- Declaración de variables
DECLARE idProducto INTEGER DEFAULT -1;
DECLARE stock INTEGER DEFAULT -1;
-- Inicio de la transacción
START TRANSACTION;
-- Verificar que el stock del producto sea suficiente para la cantidad a vender.
-- Se almacena el resultado en una variable
SET @stock = (SELECT P.stock
			FROM Productos P
			WHERE P.nombre LIKE nombreProducto);
-- Actualizar el stock restando la cantidad vendida.
UPDATE Productos
SET stock = stock - cantidadVender
WHERE nombre LIKE nombreProducto;
-- Insertar un registro en la tabla Ventas con los datos de la venta.
-- Obtener idProducto por su nombre
SET @idProducto = (SELECT idProducto
					FROM Productos
					WHERE nombre LIKE nombreProducto);
-- Insertar la venta
INSERT INTO Ventas(idProducto, cantidad)
VALUES (@idProducto, cantidadVender);
-- Si el stock es insuficiente, se debe ejecutar un ROLLBACK 
-- y devolver un mensaje de error (“Stock insuficiente para la venta”). Si todas las operaciones se realizan correctamente, se ejecutará un COMMIT.
IF (@stock < cantidadVender) THEN
	-- Deshacer los cambios realizados
	ROLLBACK;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Stock insuficiente para la venta";
ELSE
	-- Confirmar los cambios
	COMMIT;
END IF;
END$$
DELIMITER ;
-- No olvide demostrar el uso del procedimiento
-- realizando alguna llamada (CALL vender(x,y))
-- que permita comprobar su funcionamiento
-- en caso correcto y en caso de error.