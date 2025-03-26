-- Crear los roles
CREATE ROLE aspirante;
CREATE ROLE comite;
CREATE ROLE decano;

GRANT SELECT, UPDATE ON bd_admisiones.vista_aspirante_editable TO 'aspirante';
GRANT SELECT ON bd_admisiones.vista_aspirante_noeditable TO 'aspirante';

GRANT SELECT, UPDATE, INSERT ON aspirante TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_artes_plasticas TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_cine_y_tv TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_musica TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_pregrado TO comite;
GRANT SELECT, UPDATE, INSERT ON convocatoria_programa_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON especificacion_lugar_prueba TO comite;
GRANT SELECT, UPDATE, INSERT ON facultad TO comite;
GRANT SELECT, UPDATE, INSERT ON inscripcion_programa_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON inscripcion_programa_pregrado TO comite;
GRANT SELECT, UPDATE, INSERT ON lugar_prueba TO comite;
GRANT SELECT, UPDATE, INSERT ON programa TO comite;
GRANT SELECT, UPDATE, INSERT ON programa_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON prueba_admision_pregrado TO comite;
GRANT SELECT, UPDATE, INSERT ON prueba_artes_plasticas TO comite;
GRANT SELECT, UPDATE, INSERT ON prueba_cine_y_tv TO comite;
GRANT SELECT, UPDATE, INSERT ON pruebas_musica TO comite;
GRANT SELECT, UPDATE, INSERT ON prueba_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON resultados_icfes TO comite;
GRANT SELECT, UPDATE, INSERT ON sede TO comite;
GRANT SELECT, UPDATE, INSERT ON simulcro_extranjero TO comite;
GRANT SELECT, UPDATE, INSERT ON solicitud_admision_posgrado TO comite;
GRANT SELECT, UPDATE, INSERT ON solicitud_admision_pregrado TO comite;

GRANT SELECT, UPDATE, INSERT, DELETE ON programa TO decano;
GRANT SELECT, UPDATE, INSERT, DELETE ON programa_posgrado TO decano;
GRANT SELECT, UPDATE ON sede TO decano;


-- rol aspirante
CREATE USER 'Bertrada'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Wolfdietrich'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Helvin'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Fridurich'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Uodalrich'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Wastl'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Demian'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Kunigunde'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Wedekind'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Bernhardin'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Howe'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Detlef'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Abbeygail'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Bonifaz'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Aleida'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Innozenz'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Demian'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Abby'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Ruvina'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'Sonea'@'localhost' IDENTIFIED BY 'password';


-- dar permisos
GRANT aspirante TO 'Bertrada'@'localhost';
GRANT aspirante TO 'Wolfdietrich'@'localhost';
GRANT aspirante TO 'Helvin'@'localhost';
GRANT aspirante TO 'Fridurich'@'localhost';
GRANT aspirante TO 'Uodalrich'@'localhost';
GRANT aspirante TO 'Wastl'@'localhost';
GRANT aspirante TO 'Demian'@'localhost';
GRANT aspirante TO 'Kunigunde'@'localhost';
GRANT aspirante TO 'Wedekind'@'localhost';
GRANT aspirante TO 'Bernhardin'@'localhost';
GRANT aspirante TO 'Howe'@'localhost';
GRANT aspirante TO 'Detlef'@'localhost';
GRANT aspirante TO 'Abbeygail'@'localhost';
GRANT aspirante TO 'Bonifaz'@'localhost';
GRANT aspirante TO 'Aleida'@'localhost';
GRANT aspirante TO 'Innozenz'@'localhost';
GRANT aspirante TO 'Demian'@'localhost';
GRANT aspirante TO 'Abby'@'localhost';
GRANT aspirante TO 'Ruvina'@'localhost';
GRANT aspirante TO 'Sonea'@'localhost';

-- Crear usuarios para cada comité de admisiones --
CREATE USER 'MiembroA'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroB'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroC'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroD'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroE'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroF'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroG'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroH'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroI'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'MiembroJ'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';

GRANT comite TO 'MiembroA'@'localhost';
GRANT comite TO 'MiembroB'@'localhost';
GRANT comite TO 'MiembroC'@'localhost';
GRANT comite TO 'MiembroD'@'localhost';
GRANT comite TO 'MiembroE'@'localhost';
GRANT comite TO 'MiembroF'@'localhost';
GRANT comite TO 'MiembroG'@'localhost';
GRANT comite TO 'MiembroH'@'localhost';
GRANT comite TO 'MiembroI'@'localhost';
GRANT comite TO 'MiembroJ'@'localhost';


-- Crear usuario decano --
CREATE USER 'DecanoA'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoB'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoC'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoD'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoE'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoF'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoG'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoH'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoI'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';
CREATE USER 'DecanoJ'@'localhost' IDENTIFIED BY 'Contraseña_segura_123';

GRANT decano TO 'DecanoA'@'localhost';
GRANT decano TO 'DecanoB'@'localhost';
GRANT decano TO 'DecanoC'@'localhost';
GRANT decano TO 'DecanoD'@'localhost';
GRANT decano TO 'DecanoE'@'localhost';
GRANT decano TO 'DecanoF'@'localhost';
GRANT decano TO 'DecanoG'@'localhost';
GRANT decano TO 'DecanoH'@'localhost';
GRANT decano TO 'DecanoI'@'localhost';
GRANT decano TO 'DecanoJ'@'localhost';

