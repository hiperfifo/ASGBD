Ejercicio 2: Transferencia bancaria

Base de datos:
Tabla Cuentas
idCuenta (INT, PK)
titular (VARCHAR)
saldo (DECIMAL)

Enunciado:
Desarrollar un procedimiento almacenado que permita realizar la transferencia de un monto de una cuenta origen a una cuenta destino.
Iniciar la transacción descontando el monto de la cuenta origen y acreditándolo en la cuenta destino.
Si el saldo de la cuenta origen es insuficiente para cubrir el monto a transferir, se debe realizar un ROLLBACK y devolver un mensaje de error (“Saldo insuficiente para la transferencia”).
En caso contrario, se debe ejecutar el COMMIT y finalizar la operación.

Puntos clave:
Comprobar el saldo disponible en la cuenta origen.
Emplear estructura condicional para controlar la operación.
Informar mediante un mensaje en caso de error.
