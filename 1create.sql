/* crear la base de datos  */
CREATE DATABASE ists_test;

/* crea la tabla siempre no relacionada, hay que especidicar la tabla test */
use ists_test;

CREATE table usuarios(
    id int primary key auto_increment,
    nombre varchar(50) not null,
    cedula varchar(50) not null,
    telefono varchar(15) not null,
    email varchar(60) not null
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

/* crear tablas relacionadas */
use ists_test;

create table empresa (
    id int primary key auto_increment,
    codigo varchar(50) not null,
    nombre varchar(50) not null
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

create table productos(
    id int primary key auto_increment,
    codigo varchar(50) not null,
    nombre varchar(10) not null,
    descripcion varchar(15) not null,
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresa(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;
