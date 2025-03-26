CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

CREATE TABLE Productos (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Ventas (
    idVenta INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    fechaVenta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);

INSERT INTO Productos (nombre, stock) VALUES 
('Tablet', 20),
('Monitor', 15),
('Impresora', 5);
