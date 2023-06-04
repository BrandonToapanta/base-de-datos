CREATE DATABASE ints_biblioteca;

use ints_biblioteca;

create table biblioteca (    

    id int primary key auto_increment,
    bibl_nombre varchar(80) not null,
    bibl_pais varchar(30) not null,
    bibl_cuidad varchar(30) not null,
    bibl_direccion varchar(150) not null,
    bibl_telefono varchar(10) not null
    
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table editoria (    

    id int primary key auto_increment,
    edit_nombre varchar(80) not null,
    edit_pais varchar(30) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table categoria (    

    id int primary key auto_increment,
    categoria varchar(60) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table libro (    

    id int primary key auto_increment,
    id_editoria int,
    libro_nombre varchar(80) not null,
    libro_idioma varchar(50) not null,
    libro_isbn varchar(13) not null,
    fecha_publicacion date not null,
    id_categoria int,
    FOREIGN KEY (id_editoria) REFERENCES editoria(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table autor (    

    id int primary key auto_increment,
    autor_nombres1 varchar(20) not null,
    autor_nombres2 varchar(20) not null,
    autor_apillido1 varchar(20) not null,
    autor_apillido2 varchar(20) not null,
    autor_cuidad varchar(30) not null,
    autor_fechaNacim date not null,
    autor_fechaMuerte date 

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table escritores (    

    id int primary key auto_increment,
    id_libro int,
    id_autor int,
    FOREIGN KEY (id_libro) REFERENCES libro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

create table catalogo_libro (    

    id int primary key auto_increment,
    id_libro int,
    id_biblioteca int,
    cat_libro_codigo varchar(10) not null,
    cat_libro_estado enum('nuevo','viejo','bueno') not null,
    cat_libro_disponibilidad enum('prestado','disponible') not null,
    cat_libro_fecha_otenido date not null,
    FOREIGN KEY (id_libro) REFERENCES libro(id),
    FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 
create table usuario (    

    id int primary key auto_increment,
    usuario_nombres1 varchar(20) not null,
    usuario_nombres2 varchar(20) not null,
    usuario_apillido1 varchar(20) not null,
    usuario_apillido2 varchar(20) not null,
    usuario_fechaNacim date not null,
    usuario_cedula varchar(10) not null,
    usuario_genero enum('Masculino','Femenino') not null,
    usuario_direccion varchar(150) not null,
    usuario_telefono varchar(10) not null,
    usuario_mail varchar(150) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table prestamo (    

    id int primary key auto_increment,
    id_libro int unique,
    id_usuario int,
    fecha_prestamo date not null,
    fecha_devolucion date not null,
    FOREIGN KEY (id_libro) REFERENCES catalogo_libro(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

/* Insertar datos */

INSERT INTO biblioteca
VALUES ('',"Biblioteca Nacional del Ecuador Eugenio Espejo","Ecuador","Quito","Luis Sodiro y Valparaíso (esquina)","3814550"),
('',"Biblioteca Municipal de Guayaquil","Ecuador","Quito","Pichincha 605 entre Clemente Ballén y 10 de Agosto","2594800");

INSERT INTO editoria
VALUES ('',"Pre-textos","España"),
('',"Sexto Piso","Mexico");

INSERT INTO categoria
VALUES ('',"Científicos"),
('',"Literatura y lingüísticos"),
('',"Biografías"),
('',"ficcion"),
('',"dramatica"),
('',"romantico");

INSERT INTO libro
VALUES ('',"1","Wigetta y el mundo de Trotuman","Español","9788427046672",'2019-11-26',"4"),
('',"1","Wigetta y los secretos del cuerpo humano","Español","9788427044272",'2018-06-19',"4"),
('',"1","Wigetta y la momia de Ra-mon","Español","9788427045569",'2019-04-02',"4");

INSERT INTO autor
VALUES ('',"Samuel","Roberto","de Luque","Batuecas","España",'1989-04-12',''),
('',"Guillermo","?","Díaz","Ibáñez","España",'1993-05-09','');

INSERT INTO escritores
VALUES ('',"1",1),
('',"1",2),
('',"2",1),
('',"2",2);

INSERT INTO catalogo_libro
VALUES ('',"1","1","65723823","bueno","disponible",'2020-05-18'),
('',"1","1","19872323","viejo","prestado",'2019-05-18'),
('',"1","1","12983728","bueno","prestado",'2020-05-18'),
('',"2","2","09823873","nuevo","prestado",'2022-09-12'),
('',"2","2","98271398","bueno","disponible",'2020-05-18'),
('',"2","2","87327648","viejo","disponible",'2019-05-18');

INSERT INTO usuario
VALUES ('',"Brandon","Ramiro","Toapanta","Basantes",'2002-11-05',"1753029659","Masculino","ignacio cabal y juan de quiroz","09628364785","brandontoapanta12345@gmail.com"),
('',"Ismail","Fernando","Ruales","Maldonado",'2002-16-18',"1745793845","Masculino","hgasjbxsksakjds","0998732674","ismail@gmail.com"),
('',"Miguel","Alngel","Toapanta","Basantes",'2007-01-09',"1753086468","Masculino","ignacio cabal y juan de quiroz","0925723673","miguel@gmail.com"),
('',"Kevin","Estuardo","Toapanta","Basantes",'1998-11-25',"1753987649","Masculino","ignacio cabal y juan de quiroz","0987654873","kevin@gmail.com"),
('',"Aracely","Brigette","Toapanta","Basantes",'2000-08-08',"1783948576","Femenino","ignacio cabal y juan de quiroz","0927653495","aracely@gmail.com"),
('',"Wilma","Judith","Basantes","Sinchiguano",'1976-09-03',"17137287378","Femenino","ignacio cabal y juan de quiroz","0987236734","wilma@gmail.com");

use ints_biblioteca;
INSERT INTO prestamo
VALUES ('',"2","3",'2023-02-12','2023-02-18'),
('',"3","3",'2023-02-11','2023-02-17'),
('',"4","5",'2023-02-12','2023-02-20');

/* consultas */
use ints_biblioteca;
SELECT * FROM libro

use ints_biblioteca;
SELECT * FROM autor

use ints_biblioteca;
SELECT * FROM usuario

use ints_biblioteca;
SELECT libro.libro_nombre as libro, autor.autor_nombres1 as autor_nombre, autor.autor_apillido1 as autor_apellido, catalogo_libro.cat_libro_codigo as codigo_libro, catalogo_libro.cat_libro_estado as estado_libro, usuario.usuario_nombres1 as nombre_usuario, usuario.usuario_apillido1 as apellido_usuario, prestamo.fecha_prestamo as Prestado, prestamo.fecha_devolucion as Devolucion
FROM catalogo_libro
JOIN libro
ON catalogo_libro.id_libro = libro.id
JOIN escritores
ON escritores.id_libro = libro.id
JOIN autor
ON escritores.id_autor = autor.id
JOIN prestamo
ON prestamo.id_libro = catalogo_libro.id
JOIN usuario
ON prestamo.id_usuario = usuario.id
order by cat_libro_codigo

