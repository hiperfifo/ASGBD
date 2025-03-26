-- Se debe crear previamente la base de datos
USE empresadb;
DELIMITER $$
CREATE PROCEDURE transferir(
	IN origen INT,
	IN cantidad INT,
	IN destino INT
) 
BEGIN

START TRANSACTION;
-- actualizar el saldo restando la cantidad
UPDATE saldos2
SET saldo = saldo - cantidad
WHERE id_cuenta = origen;
-- actualizar el saldo aumentando la cantidad
UPDATE saldos2
SET saldo = saldo + cantidad
WHERE id_cuenta = destino;
-- Comprobar que la cuenta origen tiene saldo positivo
SET @tieneSaldo = (SELECT IF(saldo > 0, TRUE, FALSE) AS "Saldo suficiente"
				FROM saldos2
				WHERE id_cuenta = origen);
IF (@tieneSaldo) THEN
	COMMIT;
ELSE
	ROLLBACK;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Saldo insuficiente.";
END IF;
END$$
DELIMITER ;
