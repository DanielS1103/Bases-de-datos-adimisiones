-- Trigger para registrar la fecha de creación de un registro en la tabla "Aspirante":

DELIMITER //
CREATE TRIGGER tr_aspirante_insert
BEFORE INSERT ON Aspirante
FOR EACH ROW
BEGIN
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END //
DELIMITER ;

-- Trigger para actualizar la fecha de modificación de un registro en la tabla "Aspirante":

DELIMITER //
CREATE TRIGGER tr_aspirante_update
BEFORE UPDATE ON Aspirante
FOR EACH ROW
BEGIN
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END //
DELIMITER ;

-- Trigger para calcular el promedio de resultados ICFES cuando se inserta un nuevo registro en "Resultados_ICFES":

DELIMITER //
CREATE TRIGGER tr_resultados_icfes_insert
AFTER INSERT ON Resultados_ICFES
FOR EACH ROW
BEGIN
    DECLARE promedio DECIMAL(5, 2);
    SELECT AVG(resultado_icfes) INTO promedio FROM Resultados_ICFES;
    UPDATE Estadisticas_ICFES SET promedio_resultados_icfes = promedio;
END //
DELIMITER ;

-- Trigger para actualizar el promedio de resultados ICFES cuando se actualiza un registro en "Resultados_ICFES":

DELIMITER //
CREATE TRIGGER tr_resultados_icfes_update
AFTER UPDATE ON Resultados_ICFES
FOR EACH ROW
BEGIN
    DECLARE promedio DECIMAL(5, 2);
    SELECT AVG(resultado_icfes) INTO promedio FROM Resultados_ICFES;
    UPDATE Estadisticas_ICFES SET promedio_resultados_icfes = promedio;
END //
DELIMITER ;

-- Trigger para controlar el cupo máximo de un programa al insertar una nueva solicitud de admisión:

DELIMITER //
CREATE TRIGGER tr_solicitud_admision_pregrado_insert
BEFORE INSERT ON Solicitud_admision_pregrado
FOR EACH ROW
BEGIN
    DECLARE cupos INT;
    SELECT cupos_programa INTO cupos FROM Programa WHERE id_programa = NEW.id_programa;
    IF cupos <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El programa ha alcanzado el cupo máximo.';
    END IF;
END //
DELIMITER ;

-- Trigger para controlar el cupo máximo de un programa al actualizar una solicitud de admisión:

DELIMITER //
CREATE TRIGGER tr_solicitud_admision_pregrado_update
BEFORE UPDATE ON Solicitud_admision_pregrado
FOR EACH ROW
BEGIN
    DECLARE cupos INT;
    SELECT cupos_programa INTO cupos FROM Programa WHERE id_programa = NEW.id_programa;
    IF cupos <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El programa ha alcanzado el cupo máximo.';
    END IF;
END //
DELIMITER ;

-- Trigger para verificar que un aspirante presente al menos una prueba específica si el campo correspondiente es "Sí":

DELIMITER //
CREATE TRIGGER tr_solicitud_admision_pregrado_insert
BEFORE INSERT ON Solicitud_admision_pregrado
FOR EACH ROW
BEGIN
    IF NEW.presenta_examen_musica = 'Sí' AND NEW.presenta_examen_cine_y_television = 'No' AND NEW.presenta_examen_artes_plasticas = 'No' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El aspirante debe presentar al menos una prueba específica.';
    END IF;
END //
DELIMITER ;

-- Trigger para calcular la edad de un aspirante al insertar su fecha de nacimiento en la tabla "Aspirante":

DELIMITER //
CREATE TRIGGER tr_aspirante_fecha_nacimiento_insert
BEFORE INSERT ON Aspirante
FOR EACH ROW
BEGIN
    SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
END //
DELIMITER ;

-- Trigger para calcular la edad de un aspirante al actualizar su fecha de nacimiento en la tabla "Aspirante":

DELIMITER //
CREATE TRIGGER tr_aspirante_fecha_nacimiento_update
BEFORE UPDATE ON Aspirante
FOR EACH ROW
BEGIN
    SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
END //
DELIMITER ;

-- Trigger para incrementar el contador de solicitudes de admisión al insertar una nueva solicitud en la tabla "Solicitud_admision_pregrado":

DELIMITER //
CREATE TRIGGER tr_solicitud_admision_pregrado_insert
AFTER INSERT ON Solicitud_admision_pregrado
FOR EACH ROW
BEGIN
    UPDATE Programa SET solicitudes_admision = solicitudes_admision + 1 WHERE id_programa = NEW.id_programa;
END //
DELIMITER ;

-- Trigger para controlar la eliminación de registros en la tabla "Programa" y evitar que se elimine si tiene solicitudes de admisión asociadas:

DELIMITER //
CREATE TRIGGER tr_programa_delete
BEFORE DELETE ON Programa
FOR EACH ROW
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM Solicitud_admision_pregrado WHERE id_programa = OLD.id_programa;
    IF count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el programa, existen solicitudes de admisión asociadas.';
    END IF;
END //
DELIMITER ;

-- Trigger para calcular el total de créditos matriculados al insertar un nuevo registro en la tabla "Matricula":

DELIMITER //
CREATE TRIGGER tr_matricula_insert
AFTER INSERT ON Matricula
FOR EACH ROW
BEGIN
    UPDATE Estadisticas_Matricula SET total_creditos_matriculados = total_creditos_matriculados + NEW.creditos_matriculados;
END //
DELIMITER ;

-- Trigger para actualizar el total de créditos matriculados al eliminar un registro de la tabla "Matricula":

DELIMITER //
CREATE TRIGGER tr_matricula_delete
AFTER DELETE ON Matricula
FOR EACH ROW
BEGIN
    UPDATE Estadisticas_Matricula SET total_creditos_matriculados = total_creditos_matriculados - OLD.creditos_matriculados;
END //
DELIMITER ;

-- Trigger para verificar la disponibilidad de un aula al programar una clase en la tabla "Clase":

DELIMITER //
CREATE TRIGGER tr_clase_insert
BEFORE INSERT ON Clase
FOR EACH ROW
BEGIN
    DECLARE capacidad INT;
    SELECT capacidad_aula INTO capacidad FROM Aula WHERE id_aula = NEW.id_aula;
    IF capacidad <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El aula seleccionada no está disponible.';
    END IF;
END //
DELIMITER ;

-- Trigger para actualizar el saldo de la cuenta bancaria al registrar un pago en la tabla "Pago":

DELIMITER //
CREATE TRIGGER tr_pago_insert
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    UPDATE Cuenta_Bancaria SET saldo = saldo + NEW.monto WHERE id_cuenta = NEW.id_cuenta;
END //
DELIMITER ;