use proyecto_biblioteca;
drop DATABASE proyecto_biblioteca;
CREATE DATABASE proyecto_biblioteca;
use proyecto_biblioteca;
create table libro(
    id int primary key auto_increment,
    titulo_libro varchar(100) not null,
    codISBN_libro varchar(20) not null,
    fechaPulicacion_libro date,
    editorial_libro varchar(100) not null
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;
use proyecto_biblioteca;
create table autor(
    id int primary key auto_increment,
    nombre_autor varchar(75) not null,
    apellido_autor varchar(75) not null,
    fechaNacimiento_autor date,
    fechaMuerte_autor date
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;
use proyecto_biblioteca;
create table libroAutor(
    id int primary key auto_increment,
    id_libro INT,
    id_autor INT,
    FOREIGN KEY (id_libro) REFERENCES libro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;
use proyecto_biblioteca;
create table usuario(
    id int primary key auto_increment,
    nombre_usuario varchar(75) not null,
    apellido_usuario varchar(75) not null,
    direccion_usuario varchar(100) not null,
    fechaNacimiento_usuario date,
    identificacion_usuario varchar(15) not null
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;
use proyecto_biblioteca;
create table prestamo(
    id int primary key auto_increment,
    fecha_prestamo date,
    fecha_devolucion date,
    id_libro INT,
    id_usuario INT,
    FOREIGN KEY(id_libro) REFERENCES libro(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

/* insert libro */
use proyecto_biblioteca;
INSERT INTO libro(id,titulo_libro,codISBN_libro,fechaPulicacion_libro,editorial_libro)
VALUES (1," El corazón de la piedra","978-84-939750-7-4","2014/01/01","Nocturna"),
(2,"Salmos de vísperas","84 932914 8 X","2003/04/25","Obra social de Caja de Avila"),
(3,"La música en las catedrales españolas del Siglo de Oro"," 84-206-8562-3","1993/05/09","Alianza Música"),
(4," Tomás Luis de Victoria: A guide to research"," 0 8153 2096 5","1998/08/15","Garland Publishing Inc."),
(5,"Studies in the Music of Tomás Luis de Victoria"," 0 7546 0241 9","2001/05/21"," Ashgate");
/* ----------------------------------------------------- */
/* insert autor */
use proyecto_biblioteca;
INSERT INTO autor(id,nombre_autor,apellido_autor,fechaNacimiento_autor,fechaMuerte_autor)
VALUES (1,"José María","García López","1945/05/08","00/00/00"),
(2,"Esteban","Hernández Castelló","1975/08/14","00/00/00"),
(3,"Robert","Stevenson","1850/11/13","1894/12/03"),
(4,"Eugene","Cramer","1945/11/22","00/00/00"),
(5,"Eugene","Casjen Cramer","1935/11/22","00/00/00");
/* ----------------------------------------------------- */
/* insert libroAutor */
use proyecto_biblioteca;
INSERT INTO libroAutor(id,id_autor,id_libro)
VALUES (1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);
/* ----------------------------------------------------- */
/* insert usuario */
use proyecto_biblioteca;
INSERT INTO usuario(id,nombre_usuario,apellido_usuario,direccion_usuario,fechaNacimiento_usuario,identificacion_usuario)
VALUES (1,"Scarleth","Salinas","San Jose de Monjas","2002/04/14","1753814589"),
(2,"Paolaa","Cortez","Puengasi","1978/11/09","1103446082"),
(3,"Daniela","","Charcopa""Sangolqui","2011/09/05","1798654896"),
(4,"Ronal","Salinas","Magdalena","2000/06/28","1165987485"),
(5,"Daniel","Pallo","Pintado","1998/05/27","179865321569");
/* ----------------------------------------------------- */
/* insert prestamo */
use proyecto_biblioteca;
INSERT INTO prestamo(id,fecha_prestamo,fecha_devolucion,id_libro,id_usuario)
VALUES (1,"2023/1/23","2023/01/28","1","1"),
(2,"2022/12/27","2023/01/05","2","2"),
(3,"2023/01/02","2023/01/12","3","3"),
(4,"2023/01/26","2023/02/05","4","4"),
(5,"2023/01/29","2023/02/12","5","5");

/* Consultas */

/* TODO */
use proyecto_biblioteca;
SELECT * FROM libro

use proyecto_biblioteca;
SELECT * FROM autor

use proyecto_biblioteca;
SELECT * FROM usuario

/* ----------- */
use proyecto_biblioteca;
SELECT
libro.titulo_libro, autor.nombre_autor, autor.apellido_autor, usuario.nombre_usuario, usuario.apellido_usuario, prestamo.fecha_prestamo, prestamo.fecha_devolucion
FROM libro
JOIN libroAutor 
ON libroAutor.id_libro = libro.id
JOIN autor 
ON libroAutor.id_autor = autor.id
JOIN prestamo 
ON prestamo.id_libro = libro.id
JOIN usuario 
ON prestamo.id_usuario = usuario.id