/*
 * Elaborar un procedimiento almacenado 
 * que aplique una bonificación al salario de un empleado.
 * El procedimiento debe recibir el identificador del empleado
 * y el porcentaje de bonificación.
 */

DELIMITER $$
CREATE PROCEDURE bonificar(
	IN p_idEmpleado INTEGER,
    IN p_bono DECIMAL(10,2)
)
BEGIN
	-- declarar variables, importa mucho el tipo de dato
    DECLARE v_saldoOrigen DECIMAL(10,2);
	
     -- iniciar transaccion
     START TRANSACTION;
     -- aplicar bonificacion al empleado
     UPDATE Empleados
     SET salario = salario * (1 + p_bono)
     WHERE idEmpleado = p_idEmpleado;
     /*
      * Si el porcentaje supera un límite predefinido 
      * (por ejemplo, 20%), se debe ejecutar un ROLLBACK 
      * y devolver un mensaje de error (“Bonificación excesiva”).
      */
	  -- si el bono > 20
      IF (p_bono > 0.20) THEN
		ROLLBACK;
        -- informar del error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Bonificación excesiva";
      ELSE
		COMMIT;
      END IF;
END$$
DELIMITER ; 