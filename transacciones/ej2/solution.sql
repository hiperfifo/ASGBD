/*
 * Desarrollar un procedimiento almacenado que permita 
 * realizar la transferencia de un monto de una cuenta
 * origen a una cuenta destino.
 */

DELIMITER $$
CREATE PROCEDURE transferir(
	IN p_monto INTEGER,
    IN p_origen INTEGER,
    IN p_destino INTEGER
)
BEGIN
	-- declarar variables, importa mucho el tipo de dato
    DECLARE v_saldoOrigen DECIMAL(10,2);
	/* 
     * Iniciar la transacción descontando el monto de 
     * la cuenta origen y acreditándolo en la cuenta destino.
     */
     -- iniciar transaccion
     START TRANSACTION;
     -- descontar monto en origen: saldo - monto
     UPDATE Cuentas
     SET saldo = saldo - p_monto
     WHERE idCuenta = p_origen;
     -- acreditarlo en la cuenta destino
     UPDATE Cuentas
     SET saldo = saldo + p_monto
     WHERE idCuenta = p_destino;
     /*
      * Si el saldo de la cuenta origen es insuficiente para 
      * cubrir el monto a transferir, se debe realizar un 
      * ROLLBACK y devolver un mensaje de error 
      * (“Saldo insuficiente para la transferencia”).
      */
      -- obetener saldo cuenta origen
      SET @v_saldoOrigen = (SELECT saldo
							FROM Cuentas
							WHERE idCuenta = p_origen);
	  -- si el saldo < monto
      IF (@v_saldoOrigen < p_monto) THEN
		ROLLBACK;
        -- informar del error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Saldo insuficiente para la transferencia";
      ELSE
		COMMIT;
      END IF;
END$$
DELIMITER ; 