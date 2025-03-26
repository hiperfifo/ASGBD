CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE Empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO Empleados (nombre, salario) VALUES 
('Ana Rodríguez', 2500.00),
('Luis Fernández', 1800.00),
('Elena Gómez', 3200.00);
