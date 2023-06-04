/* Tabla1: Empresa
		id
		Nombre
		Dirección
Tabla2: Categoria
		id
		Nombre
		Descripción
		id_empresa
Tabla3: Producto
		id
		Nombre
		Descripción
		id_Categoria

Normalizar
Tipos de datos
# de caracteres
Relaciones
Ingresar 1 empresa 2 Categorías 2 Productos por cada categoría */

CREATE DATABASE trabajo;

use trabajo;

create table empresa (    

    id int primary key auto_increment,
    emp_nombre varchar(40) not null,
    emp_direccion varchar(120) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table categoria (    

    id int primary key auto_increment,
    cat_nombre varchar(30) not null,
    cat_descripcion varchar(300) not null,
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

create table productos (    

    id int primary key auto_increment,
    prod_nombre varchar(50) not null,
    prod_descripcion varchar(300) not null,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

INSERT INTO empresa VALUES("","TECH","CCI");

INSERT INTO categoria VALUES("","Electrodomesticos","Aparatos electronicos para el hogar","1");
INSERT INTO categoria VALUES("","Deportes","Objetos utilizados para algun tipo de deporte","1");

INSERT INTO Productos VALUES("","Cosina a gas Continental","30 pulgadas, 6 quemadores de aceroinoxidables, color plata","1");
INSERT INTO Productos VALUES("","Planca a vapor UMCO","Antiadherente color lila","1");
INSERT INTO Productos VALUES("","FLTBIRD mancuernas ajustables","juego de mancuernas de 15 libras, pesas de cambio rapido con mango de metal","2");
INSERT INTO Productos VALUES("","Gaiam Essentials","Tapete de yoga grueso para ejercicio, con correa de trasporte, 72 pulgadas de largo y 24 pulgadas de ancho por 2/5 pulgadas de grosor","2");
