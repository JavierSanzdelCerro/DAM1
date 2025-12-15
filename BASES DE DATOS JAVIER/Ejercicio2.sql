-- Ejercicio 2 

DROP DATABASE IF EXISTS restricciones ;

-- Creamos la base de datos

CREATE DATABASE restricciones;	

USE restricciones;

-- CREAR TABLAS
CREATE TABLE provincias (
	codigo_provincia NUMERIC(2) PRIMARY KEY,
	nombre_provincia VARCHAR(25) NOT NULL,
	pais VARCHAR(25),
	CONSTRAINT ck_provincias_pais CHECK(pais IN ('España', 'Italia', 'Portugal'))
);


-- Insertamos un registro
INSERT INTO provincias VALUES(1, 'Ávila', 'España');

-- CREAMOS OTRA TABLAS
CREATE TABLE empresas ( 
	cod_empresa NUMERIC(2) PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL DEFAULT 'empresa1',
	fecha_creacion DATE
);

CREATE TABLE continentes (
	cod_continente NUMERIC(2) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL DEFAULT 'Europa'
);

CREATE TABLE alumnos (
	codigo NUMERIC(3) PRIMARY KEY,
	nombre VARCHAR(21) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	curso NUMERIC(1),
	fecha_matricula DATETIME DEFAULT NOW(),
	CONSTRAINT ck_alumnos_curso CHECK (curso>=1 AND curso<=3)
	-- CONSTRAINT ck_alumnos_curso CHECK (curso BETWEEN 1 AND 3) (OTRA OPCIÓN)
);

CREATE TABLE empleados (
	cod_empleado NUMERIC(2) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(25),
	salario DECIMAL(7,2),
	provincia NUMERIC(2),
	empresa NUMERIC(2),
	CONSTRAINT ck_emple_salario CHECK (salario>0),
	CONSTRAINT fk_emple_provincia FOREIGN KEY (provincia) REFERENCES provincias(codigo_provincia) ON DELETE CASCADE,
	CONSTRAINT fk_emple_empresa FOREIGN KEY (empresa) REFERENCES empresas(cod_empresa)
);

CREATE TABLE personas (
	dni CHAR(9) PRIMARY KEY,
	nombre VARCHAR(20),
	direccion VARCHAR(100),
	codprovin NUMERIC(2),
	CONSTRAINT fk_personas_codprovin FOREIGN KEY (codprovin) 
		REFERENCES provincias(codigo_provincia) ON DELETE CASCADE
);

CREATE TABLE ejemplo1 (
	dni VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(20),
	edad NUMERIC(2),
	fecha DATE
);

CREATE TABLE ejemplo3 (
	dni VARCHAR(10),
	nombre VARCHAR(30),
	edad NUMERIC(2),
	curso NUMERIC,
	CONSTRAINT ck_edad_ejemplo3 CHECK (EDAD>=5 AND edad<=20),
	CONSTRAINT ck_curso_ejemplo3 CHECK (curso IN (1,2,3))
);

CREATE TABLE alumnos2 (
	codigo NUMERIC(2) PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL
);

CREATE TABLE modulos (
	codigo INTEGER,
	nombre VARCHAR(25),
	CONSTRAINT pk_modulos_cod PRIMARY KEY (codigo)
);

CREATE TABLE notas (
	cod_alumno NUMERIC(2),
	cod_modulo INTEGER,
	nota NUMERIC(2),
	CONSTRAINT pk_cod_al_mod PRIMARY KEY (cod_alumno, cod_modulo),
	CONSTRAINT fk_cod_modulo_notas FOREIGN KEY (cod_modulo) REFERENCES modulos(codigo),
	CONSTRAINT fk_cod_alumnos_notas FOREIGN KEY (cod_alumno) REFERENCES alumnos2(codigo)
);