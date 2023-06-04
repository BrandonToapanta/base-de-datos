create database sql_join1;

use sql_join1;

create table empresa(
    id int primary key auto_increment,
    codigo_empresa varchar(50) not null,
    nombre_empresa varchar(50) not null
);

create table user(
    id int primary key auto_increment,
    nombre_user varchar(100),
    cedula_user varchar(10),
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresa(id)
);


use sql_join1;
INSERT INTO empresa(id,codigo_empresa,nombre_empresa)
VALUES (1,"ISUS","ISUS"),
(2,"ESPE","ESPE");

use sql_join1;
INSERT INTO user(id,nombre_user,cedula_user,empresa_id)
VALUES (1,"Edison","1714355482",1),
(2,"PEPE","1234567891",2);

/* consulta */
use sql_join1;
SELECT * FROM empresa;

use sql_join1;
SELECT * FROM user;

use sql_join1;
SELECT user.nombre_user,user.cedula_user,empresa.nombre_empresa
FROM user
JOIN empresa
ON user.empresa_id=empresa.id
where cedula_user like '%12%'
