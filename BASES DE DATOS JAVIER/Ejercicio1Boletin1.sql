-- JAVIER SANZ DEL CERRO
-- 03/12/2025

DROP DATABASE IF EXISTS clinica_salud;

-- Creamos la base de datos 
CREATE DATABASE clinica_salud;

-- Usamos la base de datos
USE clinica_salud;

-- Creamos las tablas
CREATE TABLE especialidades(
	cod_especialidad NUMERIC(3) PRIMARY KEY,
	nombre_especialidad VARCHAR(50) NOT NULL,
	area_medica ENUM('MEDICINA', 'GENERAL', 'CIRUGIA', 'PEDIATRIA', 'CARDIOLOGIA'),
	disponible ENUM('S', 'N') DEFAULT 'S' 
);

CREATE TABLE medicos(
	num_colegiado VARCHAR(15) PRIMARY KEY,
	nombre_medico VARCHAR(40) NOT NULL,
	apellidos_medico VARCHAR(60) NOT NULL,
	telefono CHAR(12),
	email VARCHAR(80) NOT NULL,
	fecha_y_hora_alta DATETIME DEFAULT NOW(),
	anos_experiencia INTEGER,
	cod_especialidad NUMERIC(3),
	CONSTRAINT ck_medicos_anos_experiencia CHECK (anos_experiencia >= 0 AND anos_experiencia < 50),
	CONSTRAINT fk_medicos_cod_especialidad 
		FOREIGN KEY (cod_especialidad) REFERENCES especialidades(cod_especialidad)
);

CREATE TABLE pacientes(
	num_historial INTEGER PRIMARY KEY AUTO_INCREMENT,
	dni VARCHAR(10) UNIQUE NOT NULL,
	nombre_paciente VARCHAR(40) NOT NULL,
	apellidos_paciente VARCHAR(60) NOT NULL,
	fecha_nacimiento DATETIME NOT NULL,
	grupo_sanguineo ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
	alergias VARCHAR(200),
	telefono_contacto CHAR(12) NOT NULL
);

CREATE TABLE consultas(
	cod_consulta INTEGER PRIMARY KEY AUTO_INCREMENT,
	num_historial_paciente INTEGER,
	num_colegiado_medico VARCHAR(15),
	fecha_consulta DATETIME DEFAULT NOW(),
	diagnostico VARCHAR(200),
	precio DECIMAL(6,2) CHECK (precio > 0 AND precio < 5000),
	pagado CHAR(1) CHECK( pagado IN ('S', 'N')) DEFAULT 'N',
	CONSTRAINT fk_consultas_num_hist_paciente 
		FOREIGN KEY (num_historial_paciente) REFERENCES pacientes(num_historial) ON DELETE RESTRICT
);

