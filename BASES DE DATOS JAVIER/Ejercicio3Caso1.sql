-- Ejercicio 3
-- logistica
-- Nombre: Javier Sanz del Cerro
-- Fecha:28/11/2025

DROP DATABASE IF EXISTS logistica;

-- Crear base de datos
CREATE DATABASE logistica;

-- Usar base de datos
USE logistica;

-- Crear tabla PROVEEDORES
CREATE TABLE proveedores (
	id_prov NUMERIC PRIMARY KEY,
	nombre VARCHAR(30),
	telefono CHAR(9) UNIQUE,
	mail VARCHAR(20)
);

-- Crear tabla CATEGORÍAS
CREATE TABLE categorias (
	id_categoria CHAR(2) PRIMARY KEY,
	descripcion VARCHAR(50)
);

-- Crear tabla PRODUCTOS
CREATE TABLE productos (
	num_producto INTEGER PRIMARY KEY,
	nombre VARCHAR(30),
	precio_venta DECIMAL,
	stock INTEGER,
	categoria CHAR(2),
	CONSTRAINT fk_productos_categoria FOREIGN KEY (categoria) 
		REFERENCES categorias(id_categoria)
);

-- Crear tabla PRODUCTOS-PROVEEDORES
CREATE TABLE productos_proveedores (
	id_prov NUMERIC,
	numero_producto INTEGER,
	CONSTRAINT fk_productos_proveedores_id_prov FOREIGN KEY (id_prov)
		REFERENCES proveedores(id_prov),
	CONSTRAINT fk_productos_proveedores_numero_producto FOREIGN KEY (numero_producto)
		REFERENCES productos(num_producto)
);

-- Crear tabla CLIENTES
CREATE TABLE clientes (
	id_cliente CHAR(3) PRIMARY KEY,
	nombre VARCHAR(25),
	apellidos VARCHAR(25),
	direccion VARCHAR(30),
	telefono CHAR(9) UNIQUE
);

-- Crear tabla EMPLEADOS
CREATE TABLE empleados (
	id_empleado CHAR(3) PRIMARY KEY,
	nombre VARCHAR(30),
	apellidos VARCHAR(30),
	direccion VARCHAR(30),
	codigo_area CHAR(2)
);

-- Crear tabla PEDIDOS
CREATE TABLE pedidos (
	num_pedido INTEGER PRIMARY KEY,
	fecha_pedido DATE,
	id_cliente CHAR(3) NOT NULL,
	id_empleado CHAR(3) NOT NULL,
	CONSTRAINT fk_pedidos_id_cliente FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente),
	CONSTRAINT fk_pedidos_id_empleado FOREIGN KEY (id_empleado)
		REFERENCES empleados(id_empleado)
);

-- Crear tabla DETALLES_PEDIDOS
CREATE TABLE detalles_pedidos (
	numero_pedido INTEGER,
	numero_producto INTEGER,
	cantidad INTEGER CHECK(cantidad BETWEEN 1 AND 100),
	precio DECIMAL(7,2),
	CONSTRAINT fk_detalles_pedido_numero_pedido FOREIGN KEY (numero_pedido)
		REFERENCES pedidos(num_pedido),
	CONSTRAINT fk_detalles_pedido_numero_producto FOREIGN KEY (numero_producto)
		REFERENCES productos(num_producto)
);
