/* Especifique tanto los nombres de las columnas como los valores que se insertarán: */
/* INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); */

use test;
INSERT INTO usuarios(id,nombre,cedula,telefono,email)
VALUES("","EDISON",1714355482,0983506849,"emeneses@emenesesdevelopers.com");

/* Si está agregando valores para todas las columnas de la tabla, no necesita especificar los nombres de las columnas en la consulta SQL. Sin embargo, asegúrese de que el orden de los valores sea el mismo que el de las columnas de la tabla. */
/* INSERT INTO table_name
VALUES (value1, value2, value3, ...); */

use test;
INSERT INTO usuarios
VALUES ("","FERNANDO",0412345678,1234567891,"emeneses1@emenesesdevelopers.com");


use test;
INSERT INTO productos
VALUES("","cuad_200","cuad_200","cuad_200","1")
