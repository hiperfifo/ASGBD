-- Código para la creación de la base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE Productos (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO Productos (nombre, stock) VALUES 
('Laptop', 10),
('Teclado', 50),
('Mouse', 30);
