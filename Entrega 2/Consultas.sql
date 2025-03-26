-- Obtener el número total de solicitudes de admisión por programa:

SELECT p.nombre_programa, COUNT(*) AS total_solicitudes
FROM Programa p
JOIN Solicitud_admision_pregrado s ON p.id_programa = s.id_programa
GROUP BY p.nombre_programa;
-- Obtener el promedio de puntajes obtenidos en la prueba de música por convocatoria:

SELECT c.anno_convocatoria, AVG(pm.resultado_prueba_1) AS promedio_prueba_musica
FROM Convocatoria c
JOIN Convocatoria_musica cm ON c.id_convocatoria = cm.id_convocatoria
JOIN Pruebas_musica pm ON cm.id_convocatoria = pm.id_convocatoria
GROUP BY c.anno_convocatoria;

-- Obtener el número de aspirantes por sede que han presentado el examen de música:

SELECT s.nombre_sede, COUNT(*) AS total_aspirantes
FROM Sede s
JOIN Solicitud_admision_pregrado sa ON s.nombre_sede = sa.nombre_sede
WHERE sa.presenta_examen_musica = 'SI'
GROUP BY s.nombre_sede;
-- Obtener el programa con el mayor número de cupos disponibles:

SELECT p.nombre_programa, p.cupos_programa
FROM Programa p
WHERE p.cupos_programa = (
    SELECT MAX(cupos_programa)
    FROM Programa
);
-- Obtener las sedes que tienen programas en las convocatorias de los años 2022 y 2023:

SELECT s.nombre_sede
FROM Sede s
JOIN Facultad f ON s.nombre_sede = f.nombre_sede
JOIN Programa p ON f.id_facultad = p.id_facultad_programa
JOIN Convocatoria_pregrado cp ON p.id_convocatoria = cp.id_convocatoria
JOIN Convocatoria c ON cp.id_convocatoria = c.id_convocatoria
WHERE c.anno_convocatoria IN (2022, 2023)
GROUP BY s.nombre_sede
HAVING COUNT(DISTINCT c.anno_convocatoria) = 2;

-- Obtener la nota promedio de la prueba de artes plásticas para cada convocatoria:

SELECT CAP.id_convocatoria, AVG(PAP.resultado_prueba_artes_plasticas) AS nota_promedio
FROM Convocatoria_artes_plasticas CAP
JOIN Prueba_artes_plasticas PAP ON CAP.id_convocatoria = PAP.id_convocatoria
GROUP BY CAP.id_convocatoria;

-- Obtener la cantidad de solicitudes de admisión para cada programa de pregrado:
SELECT IP.id_programa, COUNT(IP.id_solicitud_admision) AS cantidad_solicitudes
FROM Inscripcion_programa_pregrado IP
GROUP BY IP.id_programa;

-- Obtener el promedio de las notas de pasar la prueba final para cada programa de posgrado:
SELECT CPP.id_programa_posgrado, AVG(CPP.nota_pasar_prueba_final_programa_posgrado) AS promedio_notas
FROM Convocatoria_programa_posgrado CPP
GROUP BY CPP.id_programa_posgrado;

-- Obtener la cantidad de inscripciones en programas de pregrado para cada convocatoria, solo si hay más de 10 inscripciones:
SELECT IP.id_convocatoria, COUNT(IP.id_inscripcion_programa_pregrado) AS cantidad_inscripciones
FROM Inscripcion_programa_pregrado IP
GROUP BY IP.id_convocatoria
HAVING COUNT(IP.id_inscripcion_programa_pregrado) > 10;

-- Obtener la cantidad de pruebas posgrado realizadas en cada convocatoria, solo si el resultado de la prueba final es superior a 80:
SELECT PP.id_convocatoria, COUNT(PP.id_pruebas_posgrado) AS cantidad_pruebas
FROM Pruebas_posgrado PP
WHERE PP.resultado_prueba_final_programa_posgrado > 80
GROUP BY PP.id_convocatoria;

-- Obtener todas las solicitudes de admisión pregrado junto con los nombres de los programas a los que se han inscrito:
SELECT S.*, P.nombre_programa
FROM Solicitud_admision_pregrado S
JOIN Inscripcion_programa_pregrado I ON S.id_solicitud_admision = I.id_solicitud_admision
JOIN Programa P ON I.id_programa = P.id_programa;

-- Obtener todas las convocatorias de posgrado junto con los nombres de los programas de posgrado correspondientes:
SELECT C.*, P.nombre_programa
FROM Convocatoria_posgrado C
JOIN Convocatoria_programa_posgrado CP ON C.id_convocatoria = CP.id_convocatoria
JOIN Programa_posgrado P ON CP.id_programa_posgrado = P.id_programa_posgrado;

-- Obtener los resultados de las pruebas de artes plásticas junto con los nombres de los solicitantes y la fecha de la convocatoria:
SELECT P.resultado_prueba_artes_plasticas, S.nombre_solicitante, C.fecha_prueba_artes_plasticas
FROM Prueba_artes_plasticas P
JOIN Solicitud_admision_pregrado S ON P.id_solicitud_admision = S.id_solicitud_admision
JOIN Convocatoria_artes_plasticas C ON P.id_convocatoria = C.id_convocatoria;

-- Obtener los resultados de las pruebas de posgrado junto con los nombres de los solicitantes y los nombres de los programas a los que se han inscrito:
SELECT P.resultado_prueba_1_programa_posgrado, P.resultado_prueba_final_programa_posgrado, S.nombre_solicitante, PR.nombre_programa
FROM Pruebas_posgrado P
JOIN Solicitud_admision_posgrado S ON P.id_solicitud_admision_posgrado = S.id_solicitud_admision_posgrado
JOIN Convocatoria_programa_posgrado CP ON P.id_prueba_posgrado = CP.id_prueba_posgrado
JOIN Programa_posgrado PR ON CP.id_programa_posgrado = PR.id_programa_posgrado;