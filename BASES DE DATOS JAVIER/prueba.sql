-- Creacion de una base de datos
CREATE DATABASE prueba;

-- Nos posicionamos dentro de la base de datos
USE prueba;

-- Creacion de una tabla
CREATE TABLE uno (
	a int PRIMARY KEY, 
	b int,
	c varchar(20)
);

-- Asignamos la primary key a dos atributos
CREATE TABLE dosUno (
	e int, 
	f int,
	a int,
	PRIMARY KEY (e,f),
	FOREIGN KEY (a) REFERENCES uno (a)
);
-- Asignamos la primary key a dos atributos pero con CONSTRAINT
CREATE TABLE dosDos (
	e int, 
	f int,
	a int,
	CONSTRAINT pk_dos_e_f PRIMARY KEY (e,f),
	CONSTRAINT fk_dosDos_a FOREIGN KEY (a) REFERENCES uno (a)
);

/* Añadimos ON DELETE CASCADE, significa que cuando borre el atributo 
de la tabla principal se borrara en el todos los lados */ 
CREATE TABLE dosTres (
	e int, 
	f int,
	a int,
	CONSTRAINT pk_dosTres_e_f PRIMARY KEY (e,f),
	CONSTRAINT fk_dosTres_a FOREIGN KEY (a) REFERENCES uno (a) ON DELETE CASCADE
);