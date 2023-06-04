/* busqueda con el apellido con R y departamento*/
use universidad;
SELECT  * FROM `persona` 
INNER JOIN profesor 
ON profesor.id_profesor = persona.id 
INNER JOIN departamento 
ON departamento.id=profesor.id_departamento
WHERE apellido1>="R" and apellido1 <"s";

CREATE DATABASE Pruebas CHARACTER SET utf8mb4;
	
DROP DATABASE Pruebas;

CREATE DATABASE Tarea CHARACTER SET utf8mb4;

CREATE TABLE usuario(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombres VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	cuidad VARCHAR(25) NOT NULL,
);

CREATE TABLE carrera(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT UNSIGNED NOT NULL,ff
	carrera VARCHAR(50) NOT NULL,
);


CREATE TABLE pasantias(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT UNSIGNED NOT NULL,
	empresa VARCHAR(50) NOT NULL,
	cargo VARCHAR(50) NOT NULL,
	fecha_iniciacion DATE NOT NULL,
	horas_realizadas VARCHAR(9),
);

/* introdicior 10 datos*/

INSERT INTO usuario VALUES (1, 'María José', 'Mejía Enrique');
INSERT INTO usuario VALUES (2, 'María Fernanda', 'María Mireya');
INSERT INTO usuario VALUES (3, 'Ana Sofía', 'María Ofelia');
INSERT INTO usuario VALUES (4, 'María Paula', 'Alderete Porras');
INSERT INTO usuario VALUES (5, 'María Alejandra', 'Alemán Mundo');
INSERT INTO usuario VALUES (6, 'Sara Sofía', 'Alvarado Barbosa');
INSERT INTO usuario VALUES (7, 'Ana Paula', 'Angulo Garfias');
INSERT INTO usuario VALUES (8, 'María Camila', 'Antemate Chigo');
INSERT INTO usuario VALUES (9, 'María Victoria', 'Argumosa Lopez');
INSERT INTO usuario VALUES (10, 'María Paz', 'Antonio Palomeque');

/* eliminar los 5 primeros datos*/

delete from usuario where id<=5;