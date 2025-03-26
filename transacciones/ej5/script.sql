CREATE DATABASE IF NOT EXISTS pedidos;
USE pedidos;

CREATE TABLE Pedidos (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'Pendiente'
);

CREATE TABLE DetallePedido (
    idDetalle INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido)
);

INSERT INTO Pedidos (idCliente, estado) VALUES 
(1, 'Pendiente'),
(2, 'Pendiente'),
(3, 'Pendiente');

INSERT INTO DetallePedido (idPedido, idProducto, cantidad) VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 3, 5),
(3, 1, 10);
