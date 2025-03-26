CREATE DATABASE IF NOT EXISTS banco;
USE banco;

CREATE TABLE Cuentas (
    idCuenta INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100) NOT NULL,
    saldo DECIMAL(10,2) NOT NULL
);

INSERT INTO Cuentas (titular, saldo) VALUES 
('Juan Pérez', 1500.00),
('María García', 2500.50),
('Carlos López', 300.75);
