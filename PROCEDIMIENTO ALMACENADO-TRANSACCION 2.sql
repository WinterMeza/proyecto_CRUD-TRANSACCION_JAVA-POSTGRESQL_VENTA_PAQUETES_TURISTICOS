--TRANSACCION 2
--  CREACION DE TABLA
/*==============================================================*/
/* Table: SASTIFACCION                                          */
/*==============================================================*/
create table SASTIFACCION (
   ID_SASTIFACION       INT                      null,
   ID_CLIENTE           INT                      null,
   FECHA_INCIDENTES     DATE                     null,
   INCIDENTES_S         CHARACTER VARYING (100)  null,
   BUENAS_VISITAS       INT                      null,
   MALAS_VISITAS        INT                      null,
   TOTAL_VISITAS        INT  CHECK (TOTAL_VISITAS > 0) null,
   constraint PK_SASTIFACCION primary key (ID_SASTIFACION)
);
-- PROCEDIMIENTO ALMACENADO
--PROCEDIMIENTO ALMACENADO
CREATE OR REPLACE PROCEDURE prosastifaccion()
LANGUAGE PLPGSQL
AS $BODY$
BEGIN
UPDATE SASTIFACCION SET TOTAL_VISITAS=BUENAS_VISITAS+MALAS_VISITAS;
IF(SELECT MAX(ID_SASTIFACION) FROM SASTIFACCION WHERE TOTAL_VISITAS IS NULL)>0 THEN
COMMIT;
ELSE 
IF(SELECT MAX(ID_SASTIFACION) FROM SASTIFACCION WHERE TOTAL_VISITAS IS NULL)<=0 THEN
ROLLBACK;
END IF;
END IF;
END
$BODY$;
--LLAMAR PROCEDIMIENTO
CALL prosastifaccion()
--INSERTAR DATOS
INSERT INTO SASTIFACCION VALUES (6,2,'2020-02-12','ROBO',5,2)
-- SELECCIONAR TABLA 
SELECT * FROM SASTIFACCION


