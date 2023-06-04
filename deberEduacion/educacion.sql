CREATE DATABASE ints_deber2;

use ints_deber2;

create table instituto (    

    id int primary key auto_increment,
    ints_nombre varchar(200) not null,
    ints_telefono varchar(10) not null,
    ints_email varchar(150) not null,
    ints_tipo enum('publica','privada') not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table sede (    

    id int primary key auto_increment,
    sede_nombres varchar(80) not null,
    sede_cuidad varchar(50) not null,
    sede_pais varchar(50) not null,
    sede_direccion varchar(150) not null,
    sede_telefono varchar(10) not null,
    id_ints int,
    FOREIGN KEY (id_ints) REFERENCES instituto(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table carrera (    

    id int primary key auto_increment,
    carrera_nombres varchar(150) not null,
    id_sede int,
    FOREIGN KEY (id_sede) REFERENCES sede(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table semestre (    

    id int primary key auto_increment,
    semestre varchar(1) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table malla (    

    id int primary key auto_increment,
    malla_requisito_graduacion enum('Ingles A2','Ingles B1','Ingles A1') not null,
    malla_total_creditos int(2) not null,
    malla_total_horas int(4) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

create table materia (    

    id int primary key auto_increment,
    materia_codigo varchar(5) not null,
    materia_nombres varchar(80) not null,
    materia_pre_requisito varchar(300) not null,
    materia_co_requisito varchar(300) not null,
    materia_unidad_curricular enum('unidad Básica','Unidad Profesional','Unidad de Integración Curricular') not null,
    materia_creditos int(2) not null,
    materia_horas int(3) not null,
    id_carrera int,
    id_semestre int,
    id_malla int,
    FOREIGN KEY (id_carrera) REFERENCES carrera(id),
    FOREIGN KEY (id_semestre) REFERENCES semestre(id),
    FOREIGN KEY (id_malla) REFERENCES malla(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table paralelo (    

    id int primary key auto_increment,
    paralelo varchar(1) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table jornada (    

    id int primary key auto_increment,
    jornada enum('matutina','vespertina','nocturna') not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table periodo (    

    id int primary key auto_increment,
    periodo varchar(6) not null,
    fech_inicio date not null,
    fech_fin date not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table user (    

    id int primary key auto_increment,
    user_nombres1 varchar(30) not null,
    user_nombres2 varchar(30) not null,
    user_apellidoDad varchar(30) not null,
    user_apellidoMom varchar(30) not null,
    user_cedula varchar(10) not null,
    user_tipo enum('admin','docente','estudiante') not null,
    user_sexo enum('masculino','femenino') not null,
    user_correo varchar(150) not null,
    user_telefono varchar(10) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table dist_docente (    

    id int primary key auto_increment,
    id_docente int,
    id_materia int,
    id_paralelo int,
    id_jornada int,
    id_periodo int,
    FOREIGN KEY (id_docente) REFERENCES user(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id),
    FOREIGN KEY (id_paralelo) REFERENCES paralelo(id),
    FOREIGN KEY (id_jornada) REFERENCES jornada(id),
    FOREIGN KEY (id_periodo) REFERENCES periodo(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table asignatura (    

    id int primary key auto_increment,
    id_distributivo int,
    id_estudiante int,
    FOREIGN KEY (id_distributivo) REFERENCES dist_docente(id),
    FOREIGN KEY (id_estudiante) REFERENCES user(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table nota (    

    id int primary key auto_increment,
    id_asignatura int UNIQUE not null,
    nota_unidad1 int(2) not null,
    nota_unidad2 int(2) not null,
    nota_unidad3 int(2) not null,
    nota_unidad4 int(2) not null,
    nota_final int(2) not null,
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 