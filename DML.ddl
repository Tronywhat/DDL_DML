CALL fabricante ("Asus");
CALL fabricante ("Lenovo");
CALL fabricante ("Hewlett-Packard");
CALL fabricante ("Samsung");
CALL fabricante ("Seagate");
CALL fabricante ("Crucial");
CALL fabricante ("Gigabyte");
CALL fabricante ("Huawei");
CALL fabricante ("Xiaomi");

CALL producto ("Disco duro SATA3 1TB", 86.99, 5);
CALL producto ("Memoria RAM DDR4 8GB", 120, 6);
CALL producto ("Disco SSD 1 TB", 150.99, 4);
CALL producto ("GeForce GTX 1050Ti", 185, 7);
CALL producto ("GeForce GTX 1080 Xtreme", 755, 6);
CALL producto ("Monitor 24 LED Full HD", 202, 1);
CALL producto ("Monitor 27 LED Full HD", 245.99, 1);
CALL producto ("Portátil Yoga 520", 559, 2);
CALL producto ("Portátil Ideapd 320", 444, 2);
CALL producto ("Impresora HP Deskjet 3720", 59.99, 3);
CALL producto ("Impresora HP Laserjet Pro M26nw", 180, 3);

SELECT nombre FROM productos; /*1*/
SELECT nombre, precio FROM productos; /*2*/
SELECT codigo, nombre, precio, codigoFabricante FROM productos; /*3*/
SELECT nombre, precio, precio*0.90 FROM productos;/*4*/
SELECT nombre AS "nombre de producto", precio AS "dolares", precio*0.90 AS "euros" FROM productos; /*5*/
SELECT UPPER(nombre) AS "nombre de producto", precio FROM productos; /*6*/
SELECT LOWER(nombre) AS "nombre de producto", precio FROM productos; /*7*/
SELECT nombre, UPPER(LEFT(nombre,2))  FROM fabricantes; /*8*/
SELECT nombre, ROUND(precio) FROM productos;  /*9*/
SELECT nombre, TRUNCATE(precio,0) FROM productos;  /*10*/
SELECT DISTINCT codigoFabricante FROM productos /*11*/