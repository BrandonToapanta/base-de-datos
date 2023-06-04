/* Crea la base de datos */
CREATE database joins_tablas_relacionales;

/* Crea la tabla SIMPLE NO RELACIONADA, hay que especificar la tabla test */
use joins_tablas_relacionales;

create table campus(
    id int primary key auto_increment,
    nombre varchar(50) not null,
    codigo varchar(50) not null
);

create table carrera(
    id int primary key auto_increment,
    nombre varchar(50) not null,
    codigo varchar(50) not null,
    id_campus INT,
    FOREIGN KEY (id_campus) REFERENCES campus(id)
);


use joins_tablas_relacionales;
INSERT INTO campus(id,nombre,codigo)
VALUES (1,"SUR","ISTS_SUR"),
(2,"NORTE","ISTS_NORTE");

use joins_tablas_relacionales;
INSERT INTO campus(id,nombre,codigo)
VALUES (3,"CENTRO","ISTS_CENTRO");

use joins_tablas_relacionales;
INSERT INTO carrera(id,nombre,codigo,id_campus)
VALUES (1,"Carrera de Desarrollo de Software","CDS",1),
(2,"Carrera de Marketing","CMK",2);


use joins_tablas_relacionales;
Select * FROM campus;

use joins_tablas_relacionales;
Select * FROM carrera;

use joins_tablas_relacionales;
Select campus.nombre as campus_nombre, carrera.nombre as carrera_nombre, carrera.codigo as carrera_codigo
FROM carrera
JOIN campus
ON carrera.id_campus=campus.id;

/* En funcion de carrera */
use joins_tablas_relacionales;
Select campus.nombre as campus_nombre, carrera.nombre as carrera_nombre, carrera.codigo as carrera_codigo
FROM carrera
LEFT JOIN campus
ON carrera.id_campus=campus.id;

use joins_tablas_relacionales;
Select campus.nombre as campus_nombre, carrera.nombre as carrera_nombre, carrera.codigo as carrera_codigo
FROM carrera
RIGHT JOIN campus
ON carrera.id_campus=campus.id;

/* En funcion campus */
use joins_tablas_relacionales;
Select campus.nombre as campus_nombre, carrera.nombre as carrera_nombre, carrera.codigo as carrera_codigo
FROM campus
LEFT JOIN carrera
ON carrera.id_campus=campus.id;

use joins_tablas_relacionales;
Select campus.nombre as campus_nombre, carrera.nombre as carrera_nombre, carrera.codigo as carrera_codigo
FROM campus
RIGHT JOIN carrera
ON carrera.id_campus=campus.id;