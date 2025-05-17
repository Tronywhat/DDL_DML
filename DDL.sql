DROP DATABASE IF EXISTS consultas;
CREATE DATABASE IF NOT EXISTS consultas;
USE consultas;

CREATE TABLE Fabricantes(
codigo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)
);

CREATE TABLE Productos(
codigo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
precio DECIMAL(10,2),
codigoFabricante INT,
FOREIGN KEY (codigoFabricante) REFERENCES Fabricantes(codigo)
);
