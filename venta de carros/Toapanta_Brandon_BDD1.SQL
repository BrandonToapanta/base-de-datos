CREATE DATABASE ints_ventaCarro;

use ints_ventaCarro;

create table categoria_veiculo (    

    id int primary key auto_increment,
    categoria_nombre varchar(40) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table manual (    

    id int primary key auto_increment,
    manual_nombre varchar(80) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table marca (    

    id int primary key auto_increment,
    marca_nombre varchar(80) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table color (    

    id int primary key auto_increment,
    color varchar(60) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table veiculo (    

    id int primary key auto_increment,
    codigo_veiculo varchar(40) not null,
    modelo_veiculo varchar(80) not null,
    id_marca int not null,
    costoSinIVA_veiculo int not null,
    stock_veiculo int(3) not null,
    id_categoria int not null,
    id_manual int not null,
    FOREIGN KEY (id_marca) REFERENCES marca(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria_veiculo(id),
    FOREIGN KEY (id_manual) REFERENCES manual(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table color_veiculo (    

    id int primary key auto_increment,
    id_color int not null,
    id_veiculo int not null,
    FOREIGN KEY (id_color) REFERENCES color(id),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table vendedor (    

    id int primary key auto_increment,
    codigo_vendedor varchar(10) not null,
    nombres_vendedor varchar(80) not null,
    apellidos_vendedor varchar(80) not null,
    cedula_vendedor varchar(10) not null,
    genero_vendedor enum('Masculino','Femenino') not null,
    direccion_vendedor varchar(150) not null,
    telefono_vendedor varchar(10) not null,
    mail_vendedor varchar(150) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table comprador (    

    id int primary key auto_increment,
    nombres_comprador varchar(80) not null,
    apellidos_comprador varchar(80) not null,
    direccion_comprador varchar(150) not null,
    cedula_comprador varchar(10) not null,
    telefono_comprador varchar(10) not null,
    mail_comprador varchar(150) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table cabecera_factura (    

    id int primary key auto_increment,
    fecha_factura date not null,
    id_comprador int not null,
    id_vendedor int not null,
    FOREIGN KEY (id_comprador) REFERENCES comprador(id),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table iva (    

    id int primary key auto_increment,
    iva_valor int(2) not null

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 

create table detalle_factura (    

    id int primary key auto_increment,
    cantidad_factura int not null,
    id_veiculo int not null,
    id_cabecera int not null,
    id_iva int not null,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id),
    FOREIGN KEY (id_cabecera) REFERENCES cabecera_factura(id),
    FOREIGN KEY (id_iva) REFERENCES iva(id)

) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci; 