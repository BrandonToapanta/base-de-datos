/* drop database tienda_examen; */
/* crear la base de datos */
create database tienda_examen;
/* crear la tabla donde se almacenara las categorias */
use tienda_examen;
create table categorias(
    id int primary key auto_increment,
    cat_codigo varchar(10) not null,
    cat_nombre varchar(10) not null
);
/* crear la tabla donde se almacenara a los usuarios */
use tienda_examen;
create table usuarios(
    id int primary key auto_increment,
    user_nombre1 varchar(20) not null,
    user_nombre2 varchar(20),
    user_apellido1 varchar(20) not null,
    user_apellido2 varchar(20),
    user_edad int not null,
    user_cedula varchar(10) not null,
    user_telefono varchar(10) not null,
    user_direccion varchar(150) not null,
    user_correo varchar(150) not null
);
/* crear la tablas donde se almacenara los productos con su categoria */
use tienda_examen;
create table productos(
    id int primary key auto_increment,
    prod_codigo varchar(10) not null,
    prod_nombre varchar(50) not null,
    prod_marca varchar(40) not null,
    prod_descripcion varchar(250) not null,
    prod_precio varchar(8) not null,
    prod_stok varchar(8) not null,
    id_categoria int,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);
/* crear la tabla donde se almacenara las compras conde esta el usuario y el producto */
use tienda_examen;
create table compras(
    id int primary key auto_increment,
    id_usuario int not null,
    id_producto int not null,
    com_cantidad int not null,
    com_fecha date not null,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

/* CRUDs */
/* CRUD categoria */
/* Crear categorias*/
use tienda_examen;
INSERT INTO categorias VALUES('',"TEC","TECNOLOGIA"),
('',"KITCHEN","COSINA"),
('',"TABLE","MUEBLES");
/* Actualizar  categorias*/
use tienda_examen;
Update categorias set cat_codigo="TECH" where id=1 ;
/* Eliminar una categoria*/
use tienda_examen;
delete from categorias where id=2;
/* Visualizar todos las categorias */
use tienda_examen;
Select * FROM categorias;

/* CRUD Uusarios */
/* Crear usuarios*/
use tienda_examen;
INSERT INTO usuarios VALUES('',"Brandon","Ramiro","Toapanta","Basantes",20,"1753029659","098736424","Ignacio Cabal","bt@gmaol.com"),
('',"Miguel","Angel","Toapanta","Basantes",16,"1753028745","0987794234","Ignacio Cabal","mt@gmaol.com"),
('',"Aracely","Brigette","Toapanta","Basantes",23,"1773849532","0973936424","Ignacio Cabal","at@gmaol.com");
/* Actualizar  usuario*/
use tienda_examen;
Update usuarios set user_direccion="casa" where user_cedula = "1753029659" ;
/* Eliminar una categoria*/
use tienda_examen;
delete from usuarios where user_cedula='1773849532';
/* Visualizar todos las categorias */
use tienda_examen;
Select * FROM usuarios;

/* CRUD productos */
/* Crear productos*/
use tienda_examen;
INSERT INTO productos VALUES('',"ASJK","iPad","APPLE","Tableta de 12 pulgadas procesador M2","$999","30","1"),
('',"KASI","Silla gamer","Logitech","Silla ergonomica con luses RGB y pustones de buena calidad","$500","5","3"),
('',"JDSO","Laptop GS65","MSI","Laoptop gamer con SSD 1 tera, 17 pulgadas de pantalla y prosesador i9 de 10 generacion","$1800","3","1");
/* Actualizar producto */
use tienda_examen;
Update productos set prod_stok=10 where prod_codigo="KASI" ;
/* Eliminar una producto*/
use tienda_examen;
delete from productos where prod_codigo="ASJK";
/* Visualizar todos los productos */
use tienda_examen;
Select * FROM productos;

/* CRUD compras  */
/* Crear compra*/
use tienda_examen;
INSERT INTO compras VALUES('',1,2,2,"2001/05/21"),
('',2,2,1,"2001/05/21"),
('',1,3,1,"2001/05/21");
/* Actualizar  */
use tienda_examen;
Update compras set com_cantidad=3 where id=1 ;
/* Eliminar una compras */
use tienda_examen;
delete from compras where id=2;
/* Visualizar todos las compras */
use tienda_examen;
Select * FROM compras;

/* Obtener el nombre del usuario que realizó una compra específica*/
/* compra por id de compra */
use tienda_examen;
Select usuarios.user_nombre1 as nombre ,usuarios.user_apellido1 as apellido FROM compras
join usuarios
on compras.id_usuario=usuarios.id
where compras.id=1;
/* compra por codigo del producto */
use tienda_examen;
Select usuarios.user_nombre1 as nombre ,usuarios.user_apellido1 as apellido FROM compras
join usuarios
on compras.id_usuario=usuarios.id
join productos
on compras.id_producto=productos.id
where prod_codigo="KASI";

/* Obtener los detalles de una compra, incluyendo el nombre del producto y el nombre del usuario */
/* detalles de compra por id */
use tienda_examen;
Select usuarios.user_nombre1 as nombre ,usuarios.user_apellido1 as apellido, prod_nombre as producto, compras.com_cantidad as cantidad, productos.prod_precio as precio
FROM compras
join usuarios
on compras.id_usuario=usuarios.id
join productos
on compras.id_producto=productos.id
where compras.id=1;
/* detalles de compra por codigo del producto */
use tienda_examen;
Select usuarios.user_nombre1 as nombre ,usuarios.user_apellido1 as apellido, prod_nombre as producto, compras.com_cantidad as cantidad, productos.prod_precio as precio
FROM compras
join usuarios
on compras.id_usuario=usuarios.id
join productos
on compras.id_producto=productos.id
where prod_codigo="KASI";

/* Obtener los productos de una categoría específica junto con su precio y descripción */
use tienda_examen;
Select categorias.cat_nombre as categoria, productos.prod_nombre as producto, productos.prod_precio as precio, productos.prod_descripcion
FROM categorias
left join productos
on productos.id_categoria=categorias.id
where categorias.cat_codigo="TECH";

/* Obtener las compras realizadas por un usuario específico, incluyendo el nombre del producto y la fecha de compra */
use tienda_examen;
Select usuarios.user_nombre1 as nombre ,usuarios.user_apellido1 as apellido, productos.prod_nombre as producto, compras.com_fecha as fecha
FROM compras
right join usuarios
on compras.id_usuario=usuarios.id
join productos
on compras.id_producto=productos.id
where usuarios.id=1;