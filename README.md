# ASGBD
Ejercicios sobre transacciones en MySQL. Incluye: 
- uso de procedimientos almacenados,
- estructura condicional,
- commit,
- rollback y
- mensaje de error

Explicación general
- Cada procedimiento inicia con START TRANSACTION.
- Se utilizan variables almacenar valores de la base de datos y utilizarlos.
- Se emplean estructuras IF ... THEN para verificar condiciones.
- Si ocurre un problema, se ejecuta ROLLBACK y se lanza un mensaje de error con SIGNAL SQLSTATE '45000'.
- Si todo está correcto se confirma con COMMIT.
