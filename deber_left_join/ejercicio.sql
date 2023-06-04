create database ejercicio_enClase;

use ejercicio_enClase;

create table usuario(
    id int primary key auto_increment,
    user_nombre varchar(50) not null,
    user_edad int(3) not null,
    user_cedula varchar(10) not null,
    user_telefono varchar(10) not null,
    user_direccion varchar(150) not null,
    user_correo varchar(150) not null
);
create table productos(
    id int primary key auto_increment,
    prod_nombre varchar(50) not null,
    prod_codigo varchar(10) not null,
    prod_descripcion varchar(250) not null,
    prod_stok int not null
);
create table factura(
    id int primary key auto_increment,
    id_usuario int,
    id_producto int,
    cantidad int not null,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

use ejercicio_enclase;
INSERT INTO usuario VALUES('',"brandon",20,"1753029659","0999999","mi casa :v","bt@gmail.com");
INSERT INTO productos VALUES('',"Xiaomi","Xioami12","celular de china",10),
('',"planca","Sony3000","plancha sony",10),
('',"lavadora","Samsung300","lavadora de tambor hasta 13.5 libras",10);
INSERT INTO factura VALUES('',1,1,1),('',1,2,1),('',1,3,1);

Select * FROM factura;

use ejercicio_enClase;
Select * FROM factura
join usuario
on factura.id_usuario=usuario.id
join productos
on factura.id_producto=productos.id;

use ejercicio_enClase;
Select * FROM factura
join usuario
on factura.id_usuario=usuario.id
join productos
on factura.id_producto=productos.id;

