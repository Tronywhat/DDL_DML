USE `consultas`;
DROP procedure IF EXISTS `Producto`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE `Producto` (
	IN nombre VARCHAR(100),
    IN precio DECIMAL(10,2),
    IN codigoFabricante INT(10)
)
BEGIN
	INSERT INTO productos (nombre,precio,codigoFabricante) VALUES (nombre,precio,codigoFabricante);
END$$

DELIMITER ;

USE `consultas`;
DROP procedure IF EXISTS `fabricante`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE `fabricante` (
	IN nombre VARCHAR(100)
)
BEGIN
	INSERT INTO fabricantes (nombre) values (nombre);
END$$

DELIMITER ;