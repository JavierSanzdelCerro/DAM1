-- Ejercicio 1 - Javier Sanz

-- Borramos la base de datos
DROP DATABASE IF EXISTS terfrutos;

-- Creacion de la base de datos 
CREATE DATABASE terfrutos;

-- Nos posicionamos en la base de datos
USE terfrutos;

-- Creamos las tablas
CREATE TABLE tiendas (
	numero_tienda NUMERIC(2),
	direccion VARCHAR(100),
	cp_tienda CHAR(5),
	telefono CHAR(9),
	CONSTRAINT pk_tiendas_numero PRIMARY KEY(numero_tienda)
);

CREATE TABLE vendedores (
	nif CHAR(12),
	nombre VARCHAR(90),
	domicilio VARCHAR(100),
	cp_vendedor CHAR(5),
	telefono CHAR(9),
	fecha_nacimiento DATE,
	estado_civil VARCHAR(20),
	numero_hijos SMALLINT,
	numero_tienda NUMERIC(2),
	CONSTRAINT pk_vendedores_nif PRIMARY KEY (nif),
	CONSTRAINT pk_vendedores_tienda FOREIGN KEY (numero_tienda) 
		REFERENCES tiendas(numero_tienda) ON DELETE SET NULL  /*Si borras en la tabla tiendas una de ellas los 
																el campo de tienda estará en NULL*/
);

-- MODIFICACIONES
-- Insertar un nuevo campo ADD( Para añadir un atributo ), AFTER( Para ponerlo después de un campo )

ALTER TABLE vendedores ADD minusvalia ENUM('S', 'N') AFTER numero_hijos;

-- Añadimos nuevo campo en la tabla vendedores
ALTER TABLE vendedores ADD sueldo FLOAT;

-- Modificamos el estado_civil de la tabla vendedores

ALTER TABLE vendedores MODIFY estado_civil CHAR(1);