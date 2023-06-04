/* crear la base de datos no relacionada */
create database bd_no_relacional;

/* creaccion de las tablas */
use bd_no_relacional;
create table categoria(
    id int primary key auto_increment,
    cat_nombre varchar(50) not null,
    cat_codigo varchar(10) not null
);

create table productos(
    id int primary key auto_increment,
    prod_nombre varchar(50) not null,
    prod_codigo varchar(10) not null,
    prod_descripcion varchar(250) not null,
    id_categoria INT
);

/* ingeso de datos */

use bd_no_relacional;
INSERT INTO categoria VALUES(1,"electrodomesticos","ELECT_HOME"),
(2,"hogar","Home"),
(3,"electronicos","Electronics");

use bd_no_relacional;
INSERT INTO productos VALUES('',"Ipad","IPAD123","Ipad marca APPLE",3),
(2,"Lavadora","SONY_26367","LAvadora marca sony, tambor hasta de 13.5 libras",1);

use bd_no_relacional;
INSERT INTO productos VALUES('',"Laptop","MSI_gs66","laptop con ssd de 1 tb",3),
('',"pañales","Pañal_3","Pañañes de bebe ultra absorvente",6);


/* seleccion de las tablas */

use bd_no_relacional;
Select * FROM categoria;

use bd_no_relacional;
Select * FROM productos;

/* Uso del Full join para comprobar la conecion con las tablas */

use bd_no_relacional;
Select * FROM productos
join categoria
on productos.id_categoria=categoria.id;

/* join left en funcion de productos */

use bd_no_relacional;
Select categoria.cat_codigo, categoria.cat_nombre, productos.prod_codigo, productos.prod_nombre
FROM productos
LEFT join categoria
on productos.id_categoria=categoria.id;

/* join right en funcion de productos */

use bd_no_relacional;
Select categoria.cat_codigo, categoria.cat_nombre, productos.prod_codigo, productos.prod_nombre
FROM productos
RIGHT join categoria
on productos.id_categoria=categoria.id;