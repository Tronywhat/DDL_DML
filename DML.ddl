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
SELECT codigoFabricante FROM productos; /*11*/
SELECT DISTINCT codigoFabricante  FROM productos; /*12*/
SELECT nombre FROM fabricantes ORDER BY nombre; /*13*/
SELECT nombre FROM fabricantes ORDER BY nombre DESC; /*14*/
SELECT nombre, precio FROM productos ORDER BY nombre ASC, precio DESC;/*15*/
SELECT * FROM fabricantes LIMIT 5;/*16*/
SELECT * FROM fabricantes LIMIT 2 OFFSET 3; /*17*/
SELECT nombre, precio FROM productos ORDER BY precio ASC LIMIT 1;/*18*/
SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;/*19*/
SELECT nombre FROM productos WHERE codigoFabricante=2;/*20*/ 
SELECT nombre FROM productos WHERE precio <=120 ;/*21*/
SELECT nombre FROM productos WHERE precio >=400 ;/*22*/
SELECT nombre FROM productos WHERE precio <400 ;/*23*/
SELECT * FROM productos WHERE precio >=80 AND precio <=300; /*24*/
SELECT * FROM productos WHERE precio BETWEEN 60 AND 200; /*25*/
SELECT * FROM productos WHERE precio >=200 AND codigoFabricante=6; /*26*/
SELECT * FROM productos WHERE codigoFabricante=1 OR codigoFabricante=3 OR codigoFabricante=5; /*27*/ 
SELECT * FROM productos WHERE codigoFabricante IN(1,3,5); /*28*/ 
SELECT nombre, precio*100 AS centimos FROM productos WHERE precio; /*29*/ 
SELECT nombre FROM fabricantes WHERE nombre LIKE 'S%';/*30*/
SELECT nombre FROM fabricantes WHERE nombre LIKE '%e';/*31*/
SELECT nombre FROM fabricantes WHERE nombre LIKE '%w%';/*32*/
SELECT nombre FROM fabricantes WHERE LENGTH(nombre) = 4;/*33*/
SELECT nombre FROM productos WHERE nombre LIKE '%Portátil%';/*34*/
SELECT nombre, precio FROM productos WHERE nombre LIKE '%Monitor%' AND precio <215;/*35*/
SELECT nombre, precio FROM productos WHERE precio >=180;/*36*/