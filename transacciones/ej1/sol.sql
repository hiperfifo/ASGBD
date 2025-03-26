DELIMITER $$
CREATE PROCEDURE actualizarInventario(
	IN p_idProd INTEGER,
    IN p_cantidadStock INTEGER
)
BEGIN
	-- 1. declaración de variables
    DECLARE stockDisponible INTEGER;
    -- 2. inicialización de variables
    SET @stockDisponible = (
		SELECT stock
        FROM Productos
        WHERE idProducto = p_idProd
    );
    --  3. iniciar una transacción
    START transaction;
    --  3a. que actualice el stock DE PRODUCTOS 
    UPDATE Productos
    SET stock = stock - p_cantidadStock
    WHERE idProducto = p_idProd;
    -- 4. Si la cantidad a restar es mayor 
    -- que el stock disponible, se debe ejecutar 
    -- un ROLLBACK y devolver un mensaje de error
    IF (p_cantidadStock > @stockDisponible) THEN
		rollback;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Stock insuficiente";
    ELSE
		COMMIT;
    END IF;
END$$
DELIMITER ;