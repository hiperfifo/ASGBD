Ejercicio 4: Proceso de venta con actualización de inventario y registro de ventas

Base de datos:
#Tabla Productos
idProducto (INT, PK)
nombre (VARCHAR)
stock (INT)

#Tabla Ventas
idVenta (INT, PK)
idProducto (INT, FK)
cantidad (INT)
fechaVenta (DATETIME)

Enunciado:
Se debe crear un procedimiento almacenado que realice una venta de un producto. La transacción incluirá varias sentencias:
Verificar que el stock del producto sea suficiente para la cantidad a vender.
Actualizar el stock restando la cantidad vendida.
Insertar un registro en la tabla Ventas con los datos de la venta.
Si el stock es insuficiente, se debe ejecutar un ROLLBACK y devolver un mensaje de error (“Stock insuficiente para la venta”). Si todas las operaciones se realizan correctamente, se ejecutará un COMMIT.
