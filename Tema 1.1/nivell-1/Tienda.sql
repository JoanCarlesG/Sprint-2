/*1*/SELECT nombre FROM producto;
/*2*/SELECT nombre, precio FROM producto;
/*3*/SELECT * FROM producto;
/*4*/SELECT nombre, precio, precio * 1.02 FROM producto;
/*5*/SELECT nombre AS "nom producte", precio AS "euros", precio * 1.02 AS "dòlars nord-americans" FROM producto;
/*6*/SELECT UPPER(nombre) AS "nom producte", precio FROM producto;
/*7*/SELECT LOWER(nombre) AS "nom producte", precio FROM producto;
/*8*/SELECT nombre, UPPER(LEFT(nombre , 2)) FROM fabricante; 
/*9*/SELECT nombre, CEIL(precio) FROM producto;
-- SELECT nombre, ROUND(precio) FROM producto; "No dona decimal"
-- SELECT nombre, FLOOR(precio) FROM producto; "Arrodoneix a la baixa, o com si no tingués decimal"
/*10*/SELECT nombre, TRUNCATE(precio,0) FROM producto;
-- Es poden utilitzar igual ROUND() o FLOOR()
/*11*/SELECT f.codigo FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*12*/SELECT DISTINCT f.codigo FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
/*13*/SELECT nombre FROM fabricante ORDER BY nombre;
/*14*/SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15*/SELECT nombre FROM producto ORDER BY nombre, precio DESC;
/*16*/SELECT * FROM fabricante LIMIT 5;
/*17*/SELECT * FROM fabricante LIMIT 3, 2;
/*18*/SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
/*19*/SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*20*/SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.codigo = 2;
/*21*/
/*22*/
/*23*/
/*24*/
/*25*/
/*26*/
/*27*/
/*28*/
/*29*/
/*30*/
/*31*/
/*32*/
/*33*/
/*34*/
/*35*/
/*36*/
/*37*/
/*38*/
/*39*/
/*40*/
/*41*/

