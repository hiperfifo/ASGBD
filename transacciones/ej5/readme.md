Ejercicio 5: Proceso de pedido con verificación y actualización en dos tablas

Base de datos:
Tabla Pedidos
idPedido (INT, PK)
idCliente (INT)
estado (VARCHAR)

Tabla DetallePedido
idDetalle (INT, PK)
idPedido (INT, FK)
idProducto (INT)
cantidad (INT)

Enunciado:
Elaborar un procedimiento almacenado que gestione el procesamiento de un pedido. La transacción debe incluir varias sentencias:
Actualizar el estado del pedido a “Procesado”.
Para cada producto incluido en el pedido, verificar que la cantidad solicitada esté disponible en una tabla de inventario (se asume que la verificación se realiza internamente mediante una subconsulta o función).
En caso de que algún producto no cumpla la condición, se debe ejecutar un ROLLBACK y devolver un mensaje (“Error: producto sin stock suficiente”).
Si todas las verificaciones son correctas, se confirmarán las actualizaciones y se ejecutará un COMMIT.
