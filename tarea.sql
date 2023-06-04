CREATE DATABASE educacion;

use educacion;

create table docente (    

    id int primary key auto_increment,
    docent_cedula varchar(10) not null,
    docent_nombres varchar(50) not null,
    docent_apellidos varchar(50) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 
use educacion;
create table pasajero (    

    id int primary key auto_increment,

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 
use educacion;
create table pasaporte (    

    id int primary key auto_increment,
    semestre char(1) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table carrera (    

    id int primary key auto_increment,
    carrera_nombres varchar(150) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 
use educacion;
create table semestre (    

    id int primary key auto_increment,
    semestre char(1) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table materia (    

    id int primary key auto_increment,
    materia_nombres varchar(150) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table paralelo (    

    id int primary key auto_increment,
    paralelo_nombres char(1) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table jornada (    

    id int primary key auto_increment,
    jornada_nombres enum('matutina','vespertina','nocturna') not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table periodo (    

    id int primary key auto_increment,
    periodo varchar(6) not null,
    fech_inicio date not null,
    fech_fin date not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table dist_docente (    

    id int primary key auto_increment,
    id_docente int,
    id_carrera int,
    id_semestre int,
    id_materia int,
    id_paralelo int,
    id_jornada int,
    id_periodo int,
    FOREIGN KEY (id_docente) REFERENCES docente(id),
    FOREIGN KEY (id_carrera) REFERENCES carrera(id),
    FOREIGN KEY (id_semestre) REFERENCES semestre(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id),
    FOREIGN KEY (id_paralelo) REFERENCES paralelo(id),
    FOREIGN KEY (id_jornada) REFERENCES jornada(id),
    FOREIGN KEY (id_periodo) REFERENCES periodo(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table estudiante (    

    id int primary key auto_increment,
    estudiante_nombres varchar(150) not null,
    id_docente int,
    id_distributivo int,
    FOREIGN KEY (id_docente) REFERENCES docente(id),
    FOREIGN KEY (id_distributivo) REFERENCES dist_docente(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

