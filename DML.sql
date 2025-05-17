CALL fabricantes ("Asus");
CALL fabricantes ("Lenovo");
CALL fabricantes ("Hewlett-Packard");
CALL fabricantes ("Samsung");
CALL fabricantes ("Seagate");
CALL fabricantes ("Crucial");
CALL fabricantes ("Gigabyte");
CALL fabricantes ("Huawei");
CALL fabricantes ("Xiaomi");

CALL productos ("Disco duro SATA3 1TB", 86.99, 5);
CALL productos ("Memoria RAM DDR4 8GB", 120, 6);
CALL productos ("Disco SSD 1 TB", 150.99, 4);
CALL productos ("GeForce GTX 1050Ti", 185, 7);
CALL productos ("GeForce GTX 1080 Xtreme", 755, 6);
CALL productos ("Monitor 24 LED Full HD", 202, 1);
CALL productos ("Monitor 27 LED Full HD", 245.99, 1);
CALL productos ("Portátil Yoga 520", 559, 2);
CALL productos ("Portátil codigoeapd 320", 444, 2);
CALL productos ("Impresora HP Deskjet 3720", 59.99, 3);
CALL productos ("Impresora HP Laserjet Pro M26nw", 180, 3);

USE consultas;
/*Consultas sobre una tabla*/

SELECT nombre FROM productos; /*1*/
SELECT nombre, precio FROM productos; /*2*/
SELECT * FROM productos; /*3*/
SELECT nombre, precio, precio*0.90 FROM productos;/*4*/
SELECT nombre AS "nombre de productos", precio AS "dolares", precio*0.90 AS "euros" FROM productos; /*5*/
SELECT UPPER(nombre) AS "nombre de productos", precio FROM productos; /*6*/
SELECT LOWER(nombre) AS "nombre de productos", precio FROM productos; /*7*/
SELECT nombre, UPPER(LEFT(nombre,2))  FROM fabricantes; /*8*/
SELECT nombre, ROUND(precio) FROM productos;  /*9*/
SELECT nombre, TRUNCATE(precio,0) FROM productos;  /*10*/
SELECT codigofabricante FROM productos; /*11*/
SELECT DISTINCT codigofabricante  FROM productos; /*12*/
SELECT nombre FROM fabricantes ORDER BY nombre; /*13*/
SELECT nombre FROM fabricantes ORDER BY nombre DESC; /*14*/
SELECT nombre, precio FROM productos ORDER BY nombre ASC, precio DESC;/*15*/
SELECT * FROM fabricantes LIMIT 5;/*16*/
SELECT * FROM fabricantes LIMIT 2 OFFSET 3; /*17*/
SELECT nombre, precio FROM productos ORDER BY precio ASC LIMIT 1;/*18*/
SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;/*19*/
SELECT nombre FROM productos WHERE codigofabricante=2;/*20*/ 
SELECT nombre FROM productos WHERE precio <=120 ;/*21*/
SELECT nombre FROM productos WHERE precio >=400 ;/*22*/
SELECT nombre FROM productos WHERE precio <400 ;/*23*/
SELECT * FROM productos WHERE precio >=80 AND precio <=300; /*24*/
SELECT * FROM productos WHERE precio BETWEEN 60 AND 200; /*25*/
SELECT * FROM productos WHERE precio >=200 AND codigofabricante=6; /*26*/
SELECT * FROM productos WHERE codigofabricante=1 OR codigofabricante=3 OR codigofabricante=5; /*27*/ 
SELECT * FROM productos WHERE codigofabricante IN(1,3,5); /*28*/ 
SELECT nombre, precio*100 AS centimos FROM productos WHERE precio; /*29*/ 
SELECT nombre FROM fabricantes WHERE nombre LIKE 'S%';/*30*/
SELECT nombre FROM fabricantes WHERE nombre LIKE '%e';/*31*/
SELECT nombre FROM fabricantes WHERE nombre LIKE '%w%';/*32*/
SELECT nombre FROM fabricantes WHERE LENGTH(nombre) = 4;/*33*/
SELECT nombre FROM productos WHERE nombre LIKE '%Portátil%';/*34*/
SELECT nombre, precio FROM productos WHERE nombre LIKE '%Monitor%' AND precio <215;/*35*/
SELECT nombre, precio  FROM productos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;/*36*/
SHOW TABLES;


/*1.1.4 Consultas multitabla (Composición interna)*/
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo;/*1*/
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo ORDER BY f.nombre ASC;/*2*/
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo;/*3*/
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;/*4*/
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;/*5*/
SELECT p.* FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Lenovo';/*6*/
SELECT p.* FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;/*7*/
SELECT p.* FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';/*8*/
SELECT p.* FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');/*9*/
SELECT p.nombre, p.precio FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre LIKE '%e';/*10*/
SELECT p.nombre, p.precio FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre LIKE '%w%';/*11*/
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;/*12*/
SELECT DISTINCT f.codigo, f.nombre FROM fabricantes f JOIN productos p ON p.codigofabricante = f.codigo;/*13*/

/*1.1.5 Consultas multitabla (Composición externa)*/
SELECT f.nombre AS fabricantes, p.nombre AS productos FROM fabricantes f LEFT JOIN productos p ON f.codigo = p.codigofabricante;/*1*/
SELECT f.nombre AS fabricantes FROM fabricantes f LEFT JOIN productos p ON f.codigo = p.codigofabricante WHERE p.codigo IS NULL;/*2*/
SELECT * FROM productos p RIGHT JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.codigo IS NULL;/*3*/

/*1.1.6 Consultas resumen*/
SELECT COUNT(*) AS total_productos FROM productos;/*1*/
SELECT COUNT(*) AS totalfabricantes FROM fabricantes;/*2*/
SELECT COUNT(DISTINCT codigofabricante) AS fabricantes_diferentes FROM productos;/*3*/
SELECT AVG(precio) AS precio_promedio FROM productos;/*4*/
SELECT MIN(precio) AS precio_minimo FROM productos;/*5*/
SELECT MAX(precio) AS precio_maximo FROM productos;/*6*/
SELECT nombre, precio FROM productos ORDER BY precio ASC LIMIT 1;/*7*/
SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;/*8*/
SELECT SUM(precio) AS suma_total FROM productos;/*9*/
SELECT COUNT(*) AS total FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus';/*10*/
SELECT AVG(p.precio) AS promedio FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus';/*11*/
SELECT MIN(p.precio) AS precio_minimo FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus';/*12*/
SELECT MAX(p.precio) AS precio_maximo FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus';/*13*/
SELECT SUM(p.precio) AS suma FROM productos p JOIN fabricantes f ON p.codigofabricante = f.codigo WHERE f.nombre = 'Asus';/*14*/
SELECT 
  MAX(p.precio) AS maximo,
  MIN(p.precio) AS minimo,
  AVG(p.precio) AS promedio,
  COUNT(*) AS total
FROM productos p
JOIN fabricantes f ON p.codigofabricante = f.codigo
WHERE f.nombre = 'Crucial';/*15*/
SELECT f.nombre, COUNT(p.codigo) AS total FROM fabricantes f LEFT JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre ORDER BY total DESC;/*16*/
SELECT f.nombre, MAX(p.precio) AS maximo, MIN(p.precio) AS minimo, AVG(p.precio) AS promedio FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre;/*17*/
SELECT p.codigofabricante FROM productos p GROUP BY p.codigofabricante HAVING AVG(p.precio) > 200;/*18*/
SELECT f.nombre, MAX(p.precio) AS maximo, MIN(p.precio) AS minimo, AVG(p.precio) AS promedio, COUNT(*) AS total FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre HAVING AVG(p.precio) > 200;/*19*/
SELECT COUNT(*) AS total FROM productos WHERE precio >= 180;/*20*/
SELECT f.nombre, COUNT(p.codigo) AS total FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante WHERE p.precio >= 180 GROUP BY f.nombre;/*21*/
SELECT codigofabricante, AVG(precio) AS promedio FROM productos GROUP BY codigofabricante;/*22*/
SELECT f.nombre, AVG(p.precio) AS promedio FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre;/*23*/
SELECT f.nombre FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre HAVING AVG(p.precio) >= 150;/*24*/
SELECT f.nombre FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre HAVING COUNT(p.codigo) >= 2;/*25*/
SELECT f.nombre, COUNT(p.codigo) AS total FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante WHERE p.precio >= 220 GROUP BY f.nombre;/*26*/
SELECT f.nombre, COUNT(p.codigo) AS total FROM fabricantes f LEFT JOIN productos p ON f.codigo = p.codigofabricante AND p.precio >= 220 GROUP BY f.nombre;/*27*/
SELECT f.nombre FROM fabricantes f JOIN productos p ON f.codigo = p.codigofabricante GROUP BY f.nombre HAVING SUM(p.precio) > 1000;/*28*/
SELECT p.nombre, p.precio, f.nombre
FROM productos p
JOIN fabricantes f ON p.codigofabricante = f.codigo
WHERE (p.codigo, p.precio) IN (
    SELECT p2.codigo, MAX(p2.precio)
    FROM productos p2
    GROUP BY p2.codigofabricante
)
ORDER BY f.nombre ASC;/*29*/

/*1.1.7 Subconsultas (En la cláusula WHERE)*/
SELECT * FROM productos WHERE codigoFabricante = (SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo');/*1*/
SELECT * FROM productos WHERE precio = (SELECT MAX(precio) FROM productos WHERE codigofabricante = (SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'));/*2*/
SELECT nombre
FROM productos
WHERE precio = (
    SELECT MAX(precio)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
    )
)
AND codigofabricante = (
    SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
);/*3*/
SELECT nombre
FROM productos
WHERE precio = (
    SELECT MIN(precio)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Hewlett-Packard'
    )
)
AND codigofabricante = (
    SELECT codigo FROM fabricantes WHERE nombre = 'Hewlett-Packard'
);/*4*/
SELECT *
FROM productos
WHERE precio >= (
    SELECT MAX(precio)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
    )
);/*5*/
SELECT *
FROM productos
WHERE codigofabricante = (
    SELECT codigo FROM fabricantes WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Asus'
    )
);/*6*/

/*1.1.7.2 Subconsultas con ALL y ANY*/
SELECT * FROM productos WHERE precio >= ALL (SELECT precio FROM productos);/*7*/
SELECT * FROM productos WHERE precio <= ALL (SELECT precio FROM productos);/*8*/
SELECT nombre FROM fabricantes WHERE codigo = ANY (SELECT codigofabricante FROM productos);/*9*/
SELECT nombre FROM fabricantes WHERE codigo <> ALL (SELECT codigofabricante FROM productos);/*10*/

	-- 1.1.7.3 Subconsultas con IN y NOT IN
SELECT nombre FROM fabricantes WHERE codigo IN (SELECT codigofabricante FROM productos);/*11*/
SELECT nombre FROM fabricantes WHERE codigo NOT IN (SELECT codigofabricante FROM productos);/*12*/

	-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
SELECT nombre FROM fabricantes f WHERE EXISTS (SELECT 1 FROM productos p WHERE p.codigofabricante = f.codigo);/*13*/
SELECT nombre FROM fabricantes f WHERE NOT EXISTS (SELECT 1 FROM productos p WHERE p.codigofabricante = f.codigo);/*14*/

	-- 1.1.7.5 Subconsultas correlacionadas
SELECT f.nombre AS fabricantes, p.nombre AS productos, p.precio
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigofabricante
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM productos p2
    WHERE p2.codigofabricante = f.codigo
);/*15*/
SELECT p.*
FROM productos p
WHERE p.precio >= (
    SELECT AVG(p2.precio)
    FROM productos p2
    WHERE p2.codigofabricante = p.codigofabricante
);/*16*/
SELECT nombre
FROM productos
WHERE precio = (
    SELECT MAX(precio)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
    )
)
AND codigofabricante = (
    SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
);/*17*/

	-- 1.1.8 Subconsultas (En la cláusula HAVING)
SELECT f.nombre
FROM fabricantes f
JOIN productos p ON f.codigo = p.codigofabricante
GROUP BY f.codigo, f.nombre
HAVING COUNT(p.codigo) = (
    SELECT COUNT(*)
    FROM productos
    WHERE codigofabricante = (
        SELECT codigo FROM fabricantes WHERE nombre = 'Lenovo'
    )
);/*18*/