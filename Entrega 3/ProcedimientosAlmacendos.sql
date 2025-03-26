-- Procedimiento para que el aspirante consulte su resultado de examen:
DELIMITER //
CREATE PROCEDURE ConsultarPuntajeExamenPregrado(
    IN aspirante_id INT UNSIGNED,
    OUT puntaje INT UNSIGNED
)
BEGIN
    SELECT resultado_prueba_pregrado INTO puntaje
    FROM prueba_admision_pregrado cp
    INNER JOIN Solicitud_admision_pregrado sap ON sap.id_convocatoria = cp.id_convocatoria
    WHERE sap.Aspirante_id_aspirante = aspirante_id;
END //

DELIMITER ;

CALL ConsultarPuntajeExamenPregrado(5, @puntaje);
SELECT @puntaje;




-- Procedimiento para consultar lugar para presentar el examen de admisión de pregrado:

DELIMITER //

CREATE PROCEDURE ConsultarLugarCitacion(
    IN aspirante_id INT UNSIGNED,
    OUT lugar_citacion VARCHAR(100)
)
BEGIN
    SELECT descripcion_especifica_lugar_prueba 
    INTO lugar_citacion
    FROM prueba_admision_pregrado 
    WHERE aspirante_id = aspirante_id limit 1;
END //

DELIMITER ;

CALL ConsultarLugarCitacion(1, @lugar_citacion);
SELECT @lugar_citacion;


-- Procedimiento para consultar los datos del aspirante:

DELIMITER //

CREATE PROCEDURE ConsultarDatosAspirante(IN aspirante_id INT)
BEGIN
  SELECT *
  FROM Aspirante
  WHERE id_aspirante = aspirante_id;
END //

DELIMITER ;
CALL ConsultarDatosAspirante(1);


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
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE aspirante
    SET id_tipo_aspirante = p_tipo, nombre_aspirante = p_nombre, apellido_aspirante = p_apellido, correo_personal_aspirante = p_correo, fecha_nacimiento = p_nacimiento, departamento_aspirante = p_departamento, ciudad_aspirante = p_ciudad, estrato_apirante = p_estrato
    WHERE id_aspirante = p_id;
END //

DELIMITER ;

CALL ModificarDatosAspirante(1, 765, "Luis", "Perez", "hola@example.com", '1995-01-29','Antioquia', "Medellin", 6);




-- Rol comité de admisiones:

-- Procedimiento almacenado para consultar resultados de examen:
DELIMITER //

CREATE PROCEDURE ConsultarDatosPruebaAdmisionPregrado()
BEGIN
    -- Consultar todos los datos de la tabla prueba_admision_pregrado
    SELECT *
    FROM prueba_admision_pregrado;
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
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE prueba_admision_pregrado
    SET Admitido = p_admitido, resultado_prueba_pregrado = p_puntaje, id_solicitud_admision_pregrado = p_solicitud
    WHERE id_prueba_admision_pregrado = p_id;
END //

DELIMITER ;

call ModificarDatosPruebaAdmisionPregrado(1, "Si", 700, 12);



-- Procedimiento almacenado para modificar los datos de la solicitud de aspirante:
DELIMITER //

CREATE PROCEDURE ModificarDatosSolicitudAmisionPregrado(
    IN p_id INT,
    IN p_sede VARCHAR(255),
    IN p_secundario INT,
    IN p_artes VARCHAR(255),
    IN p_musica VARCHAR(255),
    IN p_cine VARCHAR(255)
)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE solicitud_admision_pregrado
    SET nombre_sede = p_sede, id_programa_secundario = p_secundario, presenta_examen_artes_plasticas = p_artes, presenta_examen_musica = p_musica, presenta_examen_cine_y_television = p_cine
    WHERE id_solicitud_admision_pregrado = p_id;
END //

DELIMITER ;

call ModificarDatosSolicitudAmisionPregrado(1, "Bogota", 555, "No", "No", "No");




-- Procedimiento almacenado para insertar nuevas convocatorias:
DELIMITER //

CREATE PROCEDURE InsertarDatosConvocatoriaPregrado(
	IN p_id INT,
    IN p_convocatoria VARCHAR(255),
    IN p_puntaje INT
)
BEGIN
    -- Insertar datos en la tabla convocatoria_pregrado
    INSERT INTO convocatoria_pregrado (id_convocatoria, tipo_convocatoria_pregrado, puntaje_minimo_admision_convocatoria_pregrado)
    VALUES (p_id, p_convocatoria, p_puntaje);
END //

DELIMITER ;

call InsertarDatosConvocatoriaPregrado(555, "Bachilleres", 450);



-- Procedimiento almacenado para insertar un nuevo semestre de convocatoria:

DELIMITER //

CREATE PROCEDURE InsertarPeriodoConvocatoria(
	IN p_id INT,
    IN p_semestre VARCHAR(255),
    IN p_anno INT,
    IN p_fecha datetime
)
BEGIN
    -- Insertar datos en la tabla convocatoria_pregrado
    INSERT INTO convocatoria (id_convocatoria, semestre_convocatoria, anno_convocatoria, fecha_prueba_admision)
    VALUES (p_id, p_semestre, p_anno, p_fecha);
END //

DELIMITER ;

call InsertarPeriodoConvocatoria(333, "2024-1", 2024, '1998-01-23 12:45:56');



-- Procedimiento para marcar como admitido a todos los aspirantes con una nota superior a la estipulada:

DELIMITER //

CREATE PROCEDURE ActualizarAdmitidos()
BEGIN
	DECLARE puntaje_minimo INT UNSIGNED;
    
	-- Obtener el puntaje mínimo de admisión
	SELECT puntaje_minimo_admision_convocatoria_pregrado INTO puntaje_minimo
	FROM bd_admisiones.Convocatoria_pregrado;
    
	-- Actualizar el valor de Admitido según el puntaje obtenido
	UPDATE bd_admisiones.Prueba_admision_pregrado
	SET Admitido = CASE
    	WHEN Resultado_prueba_pregrado > puntaje_minimo THEN 'SI'
    	ELSE 'NO'
	END;
END //

DELIMITER ;


-- Procedimiento para eliminar una solicitud y su referencia en todas las tablas:

DELIMITER //

CREATE PROCEDURE eliminar_solicitud_admision_pregrado(IN solicitud_id INT)
BEGIN
	-- Verificar si la solicitud existe
	IF EXISTS (SELECT * FROM Solicitud_admision_pregrado WHERE id_solicitud_admision_pregrado = solicitud_id) THEN
    	DELETE FROM Prueba_artes_plasticas WHERE id_solicitud_admision = solicitud_id;
    	DELETE FROM Prueba_admision_pregrado WHERE id_solicitud_admision_pregrado = solicitud_id;
    	DELETE FROM Simulacro_extranjero WHERE id_solicitud_admision = solicitud_id;
    	DELETE FROM Solicitud_admision_pregrado WHERE id_solicitud_admision_pregrado = solicitud_id;
    	DELETE FROM Prueba_cine_y_television WHERE id_solicitud_admision = solicitud_id;
   	 DELETE FROM Inscripcion_programa_pregrado WHERE id_solicitud_admision = solicitud_id;
   	 DELETE FROM Pruebas_musica WHERE id_solicitud_admision = solicitud_id;   	 
    	SELECT 'Solicitud de admisión pregrado y registros relacionados eliminados.';
	ELSE
    	SELECT 'No se encontró una solicitud con el ID especificado.';
	END IF;
END //
DELIMITER ;

-- Procedimiento para eliminar una solicitud de posgrado y su referencia en todas las tablas


DELIMITER //

CREATE PROCEDURE eliminar_solicitud_admision_posgrado(IN solicitud_id INT)
BEGIN
	-- Verificar si la solicitud existe
	IF EXISTS (SELECT * FROM Solicitud_admision_posgrado WHERE id_solicitud_admision_posgrado = solicitud_id) THEN
    	DELETE FROM Pruebas_posgrado WHERE id_solicitud_admision_posgrado = solicitud_id;
    	DELETE FROM Inscripcion_programa_posgrado WHERE id_solicitud_admision_posgrado = solicitud_id;    
    	SELECT 'Solicitud de admisión posgrado y registros relacionados eliminados.';
	ELSE
    	SELECT 'No se encontró una solicitud con el ID especificado.';
	END IF;
END //

DELIMITER ;



-- Procedimiento para modificar la prueba de artes plásticas:

DELIMITER //

CREATE PROCEDURE ModificarDatosArtes(
    IN p_id INT,
    IN p_convocatoria INT,
    IN p_solicitud INT,
    IN p_lugar INT,
    IN p_descripcion VARCHAR(255),
    IN p_resultado INT
)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE prueba_artes_plasticas
    SET id_convocatoria = p_convocatoria, id_solicitud_admision = p_solicitud, id_lugar_prueba = p_lugar, descripcion_especifica_lugar_prueba = p_descripcion, resultado_prueba_artes_plasticas = p_resultado
    WHERE id_prueba_artes_plasticas = p_id;
END //

DELIMITER ;

CALL ModificarDatosArtes(1, 23, 12, 12, "Auditorio", 89);





-- Procedimiento para modificar la prueba de música:

DELIMITER //

CREATE PROCEDURE ModificarDatosMusica(
    IN p_id INT,
    IN p_convocatoria INT,
    IN p_solicitud INT,
    IN p_lugar INT,
    IN p_lugar2 INT,
    IN p_lugar3 INT,
    IN p_descripcion VARCHAR(255),
    IN p_descripcion2 VARCHAR(255),
    IN p_descripcion3 VARCHAR(255),
    IN p_resultado INT,
    IN p_resultado2 INT,
    IN p_resultado3 INT,
    IN p_fecha DATETIME,
    IN p_fecha2 DATETIME,
    IN p_fecha3 DATETIME
)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE pruebas_musica
    SET id_convocatoria = p_convocatoria, id_solicitud_admision = p_solicitud, id_lugar_prueba_1 = p_lugar, id_lugar_prueba_2 = p_lugar2, id_lugar_prueba_3 = p_lugar3, descripcion_especifica_lugar_prueba_1 = p_descripcion, descripcion_especifica_lugar_prueba_2 = p_descripcion2, descripcion_especifica_lugar_prueba_3 = p_descripcion3 , resultado_prueba_1 = p_resultado, resultado_prueba_2 = p_resultado2, resultado_prueba_3 = p_resultado3, fecha_y_hora_prueba_musica_1 = p_fecha, fecha_y_hora_prueba_musica_2 = p_fecha2, fecha_y_hora_prueba_musica_3 = p_fecha3
    WHERE id_pruebas_musica = p_id;
END //

DELIMITER ;

CALL ModificarDatosMusica(1, 23, 12, 12, 13, 14, "Auditorio", "salon musica", "Auditorio B", 30, 40, 45, '1998-01-23 12:45:56', '1998-01-23 12:45:56', '1998-01-23 12:45:56');




-- Procedimiento para modificar la prueba de cine:

CREATE PROCEDURE ModificarDatosCine(
    IN p_id INT,
    IN p_convocatoria INT,
    IN p_solicitud INT,
    IN p_lugar INT,
    IN p_descripcion VARCHAR(255),
    IN p_resultado INT

)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE prueba_cine_y_television
    SET id_convocatoria = p_convocatoria, id_solicitud_admision = p_solicitud, id_lugar_prueba = p_lugar, descripcion_especifica_lugar_prueba = p_descripcion, resultado_prueba_cine_y_television = p_resultado
    WHERE id_prueba_cine_y_television = p_id;
END //

DELIMITER ;

CALL ModificarDatosCine(1, 43, 1234, 28, "Salon 124", 90);




-- Rol decano:

-- Procedimiento para modificar el número de cupos en los programas:

DELIMITER //

CREATE PROCEDURE ModificarDatosPrograma(
    IN p_id INT,
    IN p_cupos INT
)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE programa
    SET cupos_programa = p_cupos
    WHERE id_programa = p_id;
END //

DELIMITER ;

call ModificarDatosSolicitudAmisionPregrado(1, 100);

-- Procedimiento almacenado modificación de convocatorias posgrado:

DELIMITER //

CREATE PROCEDURE ModificarDatosConvocatoriaPosgrado(
    IN p_id INT,
    IN p_programa VARCHAR(255),
    IN p_convocatoria INT,
    IN p_nota INT,
    IN p_notaf INT,
    IN p_prueba DATETIME,
    IN p_final DATETIME
)
BEGIN
    -- Modificar los datos de la tabla prueba_admision_pregrado
    UPDATE convocatoria_programa_posgrado
    SET id_programa_posgrado = p_programa, id_convocatoria = p_convocatoria, nota_pasar_prueba_1_programa_posgrado = p_nota, nota_pasar_prueba_final_programa_posgrado = p_notaf, fecha_y_hora_prueba_1_programa_posgrado = p_prueba, fecha_y_hora_prueba_final_posgrado = p_final
    WHERE id_prueba_posgrado = p_id;
END //

DELIMITER ;

CALL ModificarDatosConvocatoriaPosgrado(56, 765, 472, 100, 80, '1998-01-23 12:45:56','1998-01-23 12:45:56')
