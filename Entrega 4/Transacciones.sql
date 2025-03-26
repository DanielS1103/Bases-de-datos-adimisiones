-- Procedimiento para que el aspirante consulte su resultado de examen:

DELIMITER //

CREATE PROCEDURE ConsultarPuntajeExamenPregrado(
    IN aspirante_id INT UNSIGNED,
    OUT puntaje INT UNSIGNED
)
BEGIN
    START TRANSACTION;
    
    SELECT resultado_prueba_pregrado INTO puntaje
    FROM prueba_admision_pregrado cp
    INNER JOIN Solicitud_admision_pregrado sap ON sap.id_convocatoria = cp.id_convocatoria
    WHERE sap.Aspirante_id_aspirante = aspirante_id;
    
    COMMIT;
END //

DELIMITER ;

-- Procedimiento para consultar lugar para presentar el examen de admisión de pregrado:

DELIMITER //

CREATE PROCEDURE ConsultarLugarCitacion(
    IN aspirante_id INT UNSIGNED,
    OUT lugar_citacion VARCHAR(100)
)
BEGIN
    START TRANSACTION;
    
    SELECT descripcion_especifica_lugar_prueba 
    INTO lugar_citacion
    FROM prueba_admision_pregrado 
    WHERE aspirante_id = aspirante_id limit 1;
    
    COMMIT;
END //

DELIMITER ;

-- Procedimiento para consultar los datos del aspirante:

DELIMITER //

CREATE PROCEDURE ConsultarDatosAspirante(IN aspirante_id INT)
BEGIN
  START TRANSACTION;
  
  SELECT *
  FROM Aspirante
  WHERE id_aspirante = aspirante_id;
  
  COMMIT;
END //

DELIMITER ;

-- Procedimiento para modificar los datos del aspirante:

DELIMITER //

CREATE PROCEDURE ModificarDatosAspirante(
    IN p_id INT,
    IN p_tipo INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_nacimiento DATE,
    IN p_departamento VARCHAR(255),
    IN p_ciudad VARCHAR(255),
    IN p_estrato INT
)
BEGIN
    START TRANSACTION;
    
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE aspirante
    SET id_tipo_aspirante = p_tipo, nombre_aspirante = p_nombre, apellido_aspirante = p_apellido, correo_personal_aspirante = p_correo, fecha_nacimiento = p_nacimiento, departamento_aspirante = p_departamento, ciudad_aspirante = p_ciudad, estrato_apirante = p_estrato
    WHERE id_aspirante = p_id;
    
    COMMIT;
END //

DELIMITER ;

-- Procedimiento almacenado para consultar resultados de examen:

DELIMITER //

CREATE PROCEDURE ConsultarDatosPruebaAdmisionPregrado()
BEGIN
    START TRANSACTION;
    
    -- Consultar todos los datos de la tabla prueba_admision_pregrado
    SELECT *
    FROM prueba_admision_pregrado;
    
    COMMIT;
END //

DELIMITER ;
-- Procedimiento almacenado para modificar los resultados de exámenes:

DELIMITER //

CREATE PROCEDURE ModificarDatosPruebaAdmisionPregrado(
    IN p_id INT,
    IN p_admitido VARCHAR(255),
    IN p_puntaje INT,
    IN p_solicitud INT
)
BEGIN
    START TRANSACTION;
    
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE prueba_admision_pregrado
    SET Admitido = p_admitido, resultado_prueba at the end of the conversation
    
Procedimiento almacenado para registrar la solicitud de admisión de pregrado:
sql
Copy code
DELIMITER //

CREATE PROCEDURE RegistrarSolicitudAdmisionPregrado(
    IN p_aspirante_id INT UNSIGNED,
    IN p_fecha_solicitud DATE,
    IN p_programa_id INT UNSIGNED
)
BEGIN
    START TRANSACTION;
    
    -- Insertar la solicitud de admisión en la tabla Solicitud_admision_pregrado
    INSERT INTO Solicitud_admision_pregrado (Aspirante_id_aspirante, fecha_solicitud, Programa_id_programa)
    VALUES (p_aspirante_id, p_fecha_solicitud, p_programa_id);
    
    COMMIT;
END //

DELIMITER ;

-- Procedimiento almacenado para consultar el programa de estudio de un aspirante:
DELIMITER //

CREATE PROCEDURE ConsultarProgramaEstudio(
    IN p_aspirante_id INT UNSIGNED,
    OUT p_programa VARCHAR(255)
)
BEGIN
    START TRANSACTION;
    
    -- Consultar el programa de estudio del aspirante
    SELECT nombre_programa
    INTO p_programa
    FROM Programa_estudio pe
    INNER JOIN Solicitud_admision_pregrado sap ON sap.Programa_id_programa = pe.id_programa
    WHERE sap.Aspirante_id_aspirante = p_aspirante_id;
    
    COMMIT;
END //

DELIMITER ;
-- Procedimiento almacenado para registrar un nuevo programa de estudio:

DELIMITER //

CREATE PROCEDURE RegistrarProgramaEstudio(
    IN p_nombre VARCHAR(255),
    IN p_tipo_programa VARCHAR(255)
)
BEGIN
    START TRANSACTION;
    
    -- Insertar el nuevo programa de estudio en la tabla Programa_estudio
    INSERT INTO Programa_estudio (nombre_programa, tipo_programa)
    VALUES (p_nombre, p_tipo_programa);
    
    COMMIT;
END //

DELIMITER ;
-- Procedimiento almacenado para eliminar un programa de estudio:

DELIMITER //

CREATE PROCEDURE EliminarProgramaEstudio(
    IN p_programa_id INT UNSIGNED
)
BEGIN
    START TRANSACTION;
    
    -- Eliminar el programa de estudio de la tabla Programa_estudio
    DELETE FROM Programa_estudio
    WHERE id_programa = p_programa_id;
    
    COMMIT;
END //

DELIMITER ;


-- Procedimiento almacenado para actualizar la información de un estudiante:

DELIMITER //

CREATE PROCEDURE ActualizarInformacionEstudiante(
    IN p_estudiante_id INT UNSIGNED,
    IN p_nuevo_nombre VARCHAR(255),
    IN p_nueva_edad INT,
    IN p_nuevo_semestre INT
)
BEGIN
    START TRANSACTION;
    
    -- Actualizar la información del estudiante en la tabla Estudiante
    UPDATE Estudiante
    SET nombre = p_nuevo_nombre, edad = p_nueva_edad, semestre = p_nuevo_semestre
    WHERE id_estudiante = p_estudiante_id;
    
    COMMIT;
END //

DELIMITER ;
-- Procedimiento almacenado para calcular el promedio de calificaciones de un estudiante:

DELIMITER //

CREATE PROCEDURE CalcularPromedioCalificaciones(
    IN p_estudiante_id INT UNSIGNED,
    OUT p_promedio FLOAT
)
BEGIN
    START TRANSACTION;
    
    -- Calcular el promedio de calificaciones del estudiante
    SELECT AVG(calificacion)
    INTO p_promedio
    FROM Calificaciones
    WHERE estudiante_id = p_estudiante_id;
    
    COMMIT;
END //