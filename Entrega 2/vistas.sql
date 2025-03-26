-- VISTAS
USE bd_admisiones;
-- VISTAS DE ASPIRANTE
DROP VIEW IF EXISTS vista_semestres;
CREATE VIEW vista_semestres AS SELECT * FROM Convocatoria;

DROP VIEW IF EXISTS vista_aspirante_noeditable;
CREATE VIEW vista_aspirante_noeditable AS SELECT nombre_aspirante,apellido_aspirante,correo_personal_aspirante,telefono_aspirante FROM Aspirante WHERE id_aspirante = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

DROP VIEW IF EXISTS vista_aspirante_editable;
CREATE VIEW vista_aspirante_editable AS SELECT correo_personal_aspirante, telefono_aspirante FROM Aspirante WHERE id_aspirante = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

DROP VIEW IF EXISTS vista_admisiones;
CREATE VIEW vista_admisiones AS
SELECT c.anno_convocatoria, c.semestre_convocatoria, c.fecha_prueba_admision, sap.nombre_sede, f.nombre_facultad, p.nombre_programa
FROM Solicitud_admision_pregrado sap
JOIN Convocatoria c ON sap.id_convocatoria = c.id_convocatoria
JOIN Facultad f ON f.nombre_sede = sap.nombre_sede
JOIN Programa p ON p.id_programa = sap.id_programa
WHERE sap.id_aspirante = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);

DROP VIEW IF EXISTS VistaPruebasAdmision;
CREATE VIEW VistaPruebasAdmision AS
SELECT
  CA.fecha_prueba_admision,
  PA.Resultado_prueba_pregrado,
  PA.Admitido,
  LP.nombre_lugar_prueba,
  LP.departamento_lugar_prueba,
  LP.ciudad_lugar_prueba,
  PA.descripcion_especifica_lugar_prueba
FROM
  `bd_admisiones`.`Prueba_admision_pregrado` PA
  INNER JOIN `bd_admisiones`.`Convocatoria` CA ON PA.id_convocatoria = CA.id_convocatoria
  INNER JOIN `bd_admisiones`.`Lugar_prueba` LP ON PA.id_lugar_prueba = LP.id_lugar_prueba
  INNER JOIN `bd_admisiones`.`Solicitud_admision_pregrado` SA ON PA.id_solicitud_admision_pregrado = SA.id_solicitud_admision_pregrado
WHERE
  SA.id_aspirante = SUBSTRING_INDEX(CURRENT_USER(), '@', 1);
  

-- algunas otras vistas

-- vista de información básica de los aspirantes:

CREATE VIEW vw_InformacionAspirantes AS
SELECT id_aspirante, nombre_aspirante, apellido_aspirante, correo_personal_aspirante
FROM Aspirante;
-- vista de información de convocatorias de pregrado:

CREATE VIEW vw_ConvocatoriasPregrado AS
SELECT id_convocatoria, anno_convocatoria, semestre_convocatoria, fecha_prueba_admision
FROM Convocatoria;

-- Vista de programas y facultades:

CREATE VIEW vw_ProgramasFacultades AS
SELECT p.id_programa, p.nombre_programa, f.nombre_facultad
FROM Programa p
JOIN Facultad f ON p.id_facultad_programa = f.id_facultad;

-- Vista de resultados de las pruebas de música:

CREATE VIEW vw_ResultadosMusica AS
SELECT pm.id_pruebas_musica, pm.resultado_prueba_1, pm.resultado_prueba_2, pm.resultado_prueba_3
FROM Pruebas_musica pm;

-- Vista de solicitudes de admisión de pregrado y sus programas:

CREATE VIEW vw_SolicitudesAdmision AS
SELECT sap.id_solicitud_admision_pregrado, a.nombre_aspirante, a.apellido_aspirante, p.nombre_programa
FROM Solicitud_admision_pregrado sap
JOIN Aspirante a ON sap.Aspirante_id_aspirante = a.id_aspirante
JOIN Programa p ON sap.id_programa = p.id_programa;

-- Vista de información detallada de los lugares de prueba:

CREATE VIEW vw_InformacionLugaresPrueba AS
SELECT lp.id_lugar_prueba, lp.nombre_lugar_prueba, lp.departamento_lugar_prueba, lp.ciudad_lugar_prueba,
       elp.descripcion_especifica_lugar_prueba
FROM Lugar_prueba lp
JOIN Especificacion_lugar_prueba elp ON lp.id_lugar_prueba = elp.id_lugar_prueba;

-- Vista de información completa de las convocatorias de música:

CREATE VIEW vw_ConvocatoriasMusica AS
SELECT cm.id_convocatoria, cm.nota_pasar_prueba_1, cm.nota_pasar_prueba_2, cm.nota_pasar_prueba_3,
       cp.tipo_convocatoria_pregrado
FROM Convocatoria_musica cm
JOIN Convocatoria_pregrado cp ON cm.id_convocatoria = cp.id_convocatoria;
  
