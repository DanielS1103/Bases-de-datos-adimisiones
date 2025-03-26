-- INDEXES

-- Es importante crear indexes de algunas de las primary keys de las tablas
-- Las keys compuestas no es necesario tener indexes. (o las que son auto genretared)
-- Pero las index se crean automáticamente para las primary key

-- Es importante tener indexes de las tablas que están conectadas a la tabla solicitudes:
-- Para pregrado:
CREATE INDEX `fk_Simulacro_exttranjero_Solicitud_admision1_idx` ON `bd_admisiones`.`Simulacro_extranjero` (`id_solicitud_admision` ASC) VISIBLE;
CREATE INDEX `fk_Pruebas_Musica_Solicitud_admision1_idx` ON `bd_admisiones`.`Pruebas_musica` (`id_solicitud_admision` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_admisión_Solicitud_admision1_idx` ON `bd_admisiones`.`Prueba_admision_pregrado` (`id_solicitud_admision_pregrado` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_cine_y_television_Solicitud_admision1_idx` ON `bd_admisiones`.`Prueba_cine_y_television` (`id_solicitud_admision` ASC) VISIBLE;
CREATE INDEX `fk_Inscripcion_programa_Solicitud_admision1_idx` ON `bd_admisiones`.`Inscripcion_programa_pregrado` (`id_solicitud_admision` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_artes_plasticas_Solicitud_admision1_idx` ON `bd_admisiones`.`Prueba_artes_plasticas` (`id_solicitud_admision` ASC) VISIBLE;
-- Para posgrado
CREATE INDEX `fk_Pruebas_posgrado_Solicitud_admision _posgrado1_idx` ON `bd_admisiones`.`Pruebas_posgrado` (`id_solicitud_admision_posgrado` ASC) VISIBLE;
CREATE INDEX `fk_Inscripcion_programa_posgrado_Solicitud_admision _posgra_idx` ON `bd_admisiones`.`Inscripcion_programa_posgrado` (`id_solicitud_admision_posgrado` ASC) VISIBLE;

-- Uno de los aspectos mas importantes es el poder buscar por convocatoria, pues, es necesario tener rápido los datos de la convocatoria actual
-- Además que dado como está hecho el modelo siempre usando llaves foraneas para referirse a la convocatoria. es necesario tener indexes.
-- Para pregrado
CREATE INDEX `fk_Convocatoria_pregrado_Convocatoria1_idx` ON `bd_admisiones`.`Convocatoria_pregrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Programa_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Programa` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Solicitud_admision_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Solicitud_admision_pregrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Pruebas_musica_Convocatoria_musica1_idx` ON `bd_admisiones`.`Pruebas_musica` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Simulacro_exttranjero_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Simulacro_extranjero` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_admisión_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Prueba_admision_pregrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Inscripcion_programa_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Inscripcion_programa_pregrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_cine_y_television_Convocatoria_cine_y_television1_idx` ON `bd_admisiones`.`Prueba_cine_y_television` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Prueba_artes_plasticas_Convocatoria_artes_plasticas1_idx` ON `bd_admisiones`.`Prueba_artes_plasticas` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Convocatoria_cine_y_television_Convocatoria_pregrado1_idx` ON `bd_admisiones`.`Convocatoria_cine_y_television` (`id_convocatoria` ASC) VISIBLE;
-- Para posgrado
CREATE INDEX `fk_Programa_posgrado_Convocatoria_posgrado1_idx` ON `bd_admisiones`.`Programa_posgrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Inscripcion_programa_posgrado_Convocatoria_posgrado1_idx` ON `bd_admisiones`.`Inscripcion_programa_posgrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Pruebas_posgrado_Convocatoria_posgrado1_idx` ON `bd_admisiones`.`Pruebas_posgrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Solicitud_admision _posgrado_Convocatoria_posgrado1_idx` ON `bd_admisiones`.`Solicitud_admision _posgrado` (`id_convocatoria` ASC) VISIBLE;
CREATE INDEX `fk_Convocatoria_programa_posgrado_Convocatoria_posgrado1_idx` ON `bd_admisiones`.`Convocatoria_programa_posgrado` (`id_convocatoria` ASC) VISIBLE;

-- Otro index importante en esta lógica de negocio es el de id programa e id programa posgrado, es también muy importante a la hora de hacer selects. Para formalizar inscripciones se necesita mirar por programa academico y evaluar solicitudes. Por eso es importante tener index de programa
-- PAra pregrado
CREATE INDEX `fk_Solicitud_admision_Programa1_idx` ON `bd_admisiones`.`Solicitud_admision_pregrado` (`id_programa` ASC) VISIBLE;
CREATE INDEX `fk_Solicitud_admision_Programa2_idx` ON `bd_admisiones`.`Solicitud_admision_pregrado` (`id_programa_secundario` ASC) VISIBLE;
CREATE INDEX `fk_Inscripcion_programa_Programa1_idx` ON `bd_admisiones`.`Inscripcion_programa_pregrado` (`id_programa` ASC) VISIBLE;
-- Para posgrado
CREATE INDEX `fk_Solicitud_admision _posgrado_Programa_posgrado1_idx` ON `bd_admisiones`.`Solicitud_admision _posgrado` (`id_programa_posgrado` ASC) VISIBLE;
CREATE INDEX `fk_Convocatoria_programa_posgrado_Programa_posgrado1_idx` ON `bd_admisiones`.`Convocatoria_programa_posgrado` (`id_programa_posgrado` ASC) VISIBLE;

-- Ya como un agregado aunque no tan importante, para bscar aspirantes con facilidad
CREATE INDEX `fk_Solicitud_admision_Aspirante1_idx` ON `bd_admisiones`.`Solicitud_admision_pregrado` (`Aspirante_id_aspirante` ASC) VISIBLE;
CREATE INDEX `fk_Solicitud_admision _posgrado_Aspirante1_idx` ON `bd_admisiones`.`Solicitud_admision _posgrado` (`Aspirante_id_aspirante` ASC) VISIBLE;


