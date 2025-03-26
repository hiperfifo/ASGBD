Ejercicio 3: Actualización de salario con bonificación

Base de datos:
Tabla Empleados
idEmpleado (INT, PK)
nombre (VARCHAR)
salario (DECIMAL)

Enunciado:
Elaborar un procedimiento almacenado que aplique una bonificación al salario de un empleado.
El procedimiento debe recibir el identificador del empleado y el porcentaje de bonificación.
Si el porcentaje supera un límite predefinido (por ejemplo, 20%), se debe ejecutar un ROLLBACK y devolver un mensaje de error (“Bonificación excesiva”).
Si el porcentaje es aceptable, se debe aplicar la bonificación, realizar el COMMIT y actualizar el salario.

Consideraciones importantes:
- Recibir los parámetros necesarios (id y porcentaje).
- Comparar el porcentaje de bonificación con el límite establecido.
- Decidir mediante estructura condicional si se realiza commit o rollback.
- Devolver un mensaje informativo en caso de error.
