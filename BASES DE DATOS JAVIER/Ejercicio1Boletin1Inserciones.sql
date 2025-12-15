-- Hacemos los ejercicios del 6 al 10
-- EJERCICIO 6
INSERT INTO especialidades (codigo_especialidad, nombre_especialidad, area_medica, disponible)
	VALUES (101, 'CARDIOLOGIA', 'CARDIOLOGIA', 'S');

-- EJERCICIO 7
INSERT INTO medicos (num_colegiado, nombre_medico, apellidos_medico, email, anos_experiencia, codigo_especialidad)
	VALUES ('28-4567890', 'Carlos', 'Fernandez Ruiz', 'cfernandez@clinica.es', 5, 101);
-- RESPUESTA A LA PREGUNTA:
/*Lo que ocurre es que esa especialidad no existe 
en la tabla que tiene como referencia y al meter el 
101 si porque lo hemos introducido con anterioridad */
	
	
-- EJERCICIO 8
-- Lo he hecho directamente en el 7
	
-- EJERCICIO 9
INSERT INTO pacientes (dni, nombre_paciente, apellidos_paciente, fecha_nacimiento, grupo_sanguineo, telefono_contacto)
	VALUES('12345678A', 'Maria', 'Garcia Lopez', '1990-05-15', 'A+', '666777888');

-- EJERCICIO 10	
	INSERT INTO consultas();