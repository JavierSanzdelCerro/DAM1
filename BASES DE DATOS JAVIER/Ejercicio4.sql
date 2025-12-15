-- Creamos una base de datos deportes
DROP DATABASE IF EXISTS deporte;
CREATE DATABASE deporte;

USE deporte;

-- Crear tres tablas
-- Equipo (codigo (entero autoincremental), nombre, fecha_creación
CREATE TABLE equipo (
	codigoEquipo INTEGER AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20),
	fecha_creacion DATETIME
);


-- Jugador (codigo (texto 6), nombre, apellidos, posición)
CREATE TABLE jugador(
	codigoJugador CHAR(6) PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos VARCHAR(30),
	posición VARCHAR(30)	
);


-- Juega (codigoJugador, codigoEquipo, fecha_contrato)
CREATE TABLE juega(
	codigoJugador CHAR(6),
	codigoEquipo INTEGER,
	fecha_contrato DATETIME,
	CONSTRAINT pk_juega_cod_jug_cod_equipo_fecha_contrato PRIMARY KEY (codigoJugador, codigoEquipo, fecha_contrato),
	CONSTRAINT fk_juega_codigo_jugador FOREIGN KEY (codigoJugador) REFERENCES jugador(codigoJugador),
	CONSTRAINT fk_juega_codigo_equipo FOREIGN KEY (codigoEquipo) REFERENCES equipo(codigoEquipo)
);