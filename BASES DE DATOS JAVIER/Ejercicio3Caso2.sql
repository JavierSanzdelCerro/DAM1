-- Ejercicio 3
-- logistica
-- Nombre: Javier Sanz del Cerro
-- Fecha:28/11/2025

DROP DATABASE IF EXISTS hospital;

-- Crear base de datos
CREATE DATABASE hospital;

-- Usar base de datos
USE hospital;

-- Crear tabla ENFERMEDAD
CREATE TABLE enfermedad(
	id_enfermedad NUMERIC(3) PRIMARY KEY,
	nombre VARCHAR(30) UNIQUE NOT NULL,
	descripcion VARCHAR(100),
	t_recuperacion INTEGER	
);

-- Crear tabla PACIENTE
CREATE TABLE paciente(
	id_paciente NUMERIC(3) PRIMARY KEY,
	nombre VARCHAR(30),
	apellidos VARCHAR(40),
	f_nacimiento DATE,
	poblacion VARCHAR(25),
	id_medico NUMERIC(3),
	CONSTRAINT fk_paciente_id_medico FOREIGN KEY (id_medico)
		REFERENCES paciente(id_paciente)
);

-- Crear tabla HISTORIAL
CREATE TABLE historial(
	id_historial NUMERIC(3) PRIMARY KEY,
	grupo_sanguineo VARCHAR(3),
	id_paciente NUMERIC(3),
	CONSTRAINT fk_historial_id_paciente FOREIGN KEY (id_paciente)
		REFERENCES paciente(id_paciente)
);

-- Crear tabla LINEA_HISTORIAL
CREATE TABLE linea_historial(
	num_linea NUMERIC(3) PRIMARY KEY,
	id_historial NUMERIC(3),
	id_enfermedad NUMERIC(3) NOT NULL,
	f_inicio DATE,
	f_fin DATE,
	sintomas VARCHAR(150),
	observaciones VARCHAR(150),
	CONSTRAINT fk_linea_historial_id_historial FOREIGN KEY (id_historial)
		REFERENCES historial(id_historial),
	CONSTRAINT fk_linea_historial_id_enfermedad FOREIGN KEY (id_enfermedad)
		REFERENCES enfermedad(id_enfermedad),
	CONSTRAINT ck_f_ini_f_fin CHECK(f_fin > f_inicio)
);

-- Crear tabla LOCALIZACION
CREATE TABLE localizacion(
	id_localizacion NUMERIC(3) PRIMARY KEY,
	cp NUMERIC(5),
	ciudad VARCHAR(20),
	riesgo INTEGER(1)
);

-- Crear tabla ESTANCIAS_PACIENTES
CREATE TABLE estancias_pacientes(
	id_paciente NUMERIC(3),
	id_localizacion NUMERIC(3),
	f_entrada DATE,
	f_salida DATE, 
	CONSTRAINT pk_estancias_pacientes_id_paciente_localizacion_f_entrada
		PRIMARY KEY(id_paciente, id_localizacion, f_entrada),
	CONSTRAINT pk_estancias_pacientes_id_paciente FOREIGN KEY (id_paciente)
		REFERENCES paciente(id_paciente),
	CONSTRAINT pk_estancias_pacientes_id_localizacion FOREIGN KEY (id_localizacion)
		REFERENCES localizacion(id_localizacion)
);
