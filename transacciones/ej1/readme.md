Ejercicio 1: Actualización de stock en inventario

Base de datos:
Tabla Productos
idProducto (INT, PK)
nombre (VARCHAR)
stock (INT)

Enunciado:
Se debe crear un procedimiento almacenado que reciba como parámetros el identificador de un producto y la cantidad a restar del stock. La tarea es iniciar una transacción que actualice el stock.
Si la cantidad a restar es mayor que el stock disponible, se debe ejecutar un ROLLBACK y devolver un mensaje de error indicando “Stock insuficiente”.
Si la cantidad es válida, se debe efectuar el COMMIT y actualizar el registro.

Aspectos a considerar:
- Verificar el stock antes de la actualización.
- Usar estructura condicional para decidir entre commit y rollback.
- Retornar el mensaje de error en caso de rollback.
