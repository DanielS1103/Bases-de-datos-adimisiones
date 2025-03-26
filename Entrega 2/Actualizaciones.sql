-- Actualizaciones

-- Actualizar el nombre del solicitante con ID 1
UPDATE Solicitud_admision_pregrado
SET nombre_solicitante = 'Nuevo Nombre'
WHERE id_solicitud_admision = 1;

-- Actualizar la fecha de nacimiento del solicitante con ID 2
UPDATE Solicitud_admision_pregrado
SET fecha_nacimiento = '1990-01-01'
WHERE id_solicitud_admision = 2;

-- Actualizar el programa de posgrado de la solicitud con ID 3
UPDATE Solicitud_admision_posgrado
SET id_programa_posgrado = 2
WHERE id_solicitud_admision_posgrado = 3;

-- Actualizar la nota de la prueba de matemáticas del solicitante con ID 4
UPDATE Prueba_matematicas
SET nota_prueba = 90
WHERE id_solicitud_admision = 4;

-- Actualizar el estado de la inscripción del programa de posgrado con ID 5
UPDATE Inscripcion_programa_posgrado
SET estado_inscripcion = 'Aceptada'
WHERE id_inscripcion_programa_posgrado = 5;

-- Actualizar la fecha de inicio de la convocatoria de pregrado con ID 6
UPDATE Convocatoria_pregrado
SET fecha_inicio = '2023-06-01'
WHERE id_convocatoria_pregrado = 6;

-- Actualizar el nombre del programa de posgrado con ID 7
UPDATE Programa_posgrado
SET nombre_programa = 'Nuevo Programa'
WHERE id_programa_posgrado = 7;

-- Actualizar la fecha de la convocatoria de artes plásticas con ID 8
UPDATE Convocatoria_artes_plasticas
SET fecha_convocatoria = '2023-07-01'
WHERE id_convocatoria_artes_plasticas = 8;

-- Actualizar el resultado de la prueba de inglés del solicitante con ID 9
UPDATE Prueba_ingles
SET resultado_prueba = 'Aprobado'
WHERE id_solicitud_admision = 9;

-- Actualizar el estado de la solicitud de admisión pregrado con ID 10
UPDATE Solicitud_admision_pregrado
SET estado_solicitud = 'Rechazada'
WHERE id_solicitud_admision = 10;


-- Borrados

-- Borrar la solicitud de admisión pregrado con ID 11
DELETE FROM Solicitud_admision_pregrado
WHERE id_solicitud_admision = 11;

-- Borrar la inscripción del programa de posgrado con ID 12
DELETE FROM Inscripcion_programa_posgrado
WHERE id_inscripcion_programa_posgrado = 12;

-- Borrar la convocatoria de pregrado con ID 13
DELETE FROM Convocatoria_pregrado
WHERE id_convocatoria_pregrado = 13;

-- Borrar el programa de posgrado con ID 14
DELETE FROM Programa_posgrado
WHERE id_programa_posgrado = 14;

-- Borrar la convocatoria de artes plásticas con ID 15
DELETE FROM Convocatoria_artes_plasticas
WHERE id_convocatoria_artes_plasticas = 15;

-- Borrar la solicitud de admisión posgrado con ID 16
DELETE FROM Solicitud_admision_posgrado
WHERE id_solicitud_admision_posgrado = 16;

-- Borrar la prueba de matemáticas del solicitante con ID 17
DELETE FROM Prueba_matematicas
WHERE id_solicitud_admision = 17;

-- Borrar la convocatoria de posgrado con ID 18
DELETE FROM Convocatoria_posgrado
WHERE id_convocatoria = 18;

-- Borrar la prueba de inglés del solicitante con ID 19
DELETE FROM Prueba_ingles
WHERE id_solicitud_admision = 19;

-- Borrar la prueba de artes plásticas del solicitante con ID 20
DELETE FROM Prueba_artes_plasticas
WHERE id_solicitud_admision = 20;
