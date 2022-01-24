--TRANSACCION 1
--  CREACION DE TABLA
/*==============================================================*/
/* Table: PAQUETE_TURISTICO                                         */
/*==============================================================*/
create table PAQUETE_TURISTICO (
   ID_PT                INT                 not null,
   ID_EMPRESA_PA        INT                      null,
   ID_CONVENIOS         INT                      null,
   ID_CIUDAD            INT                      null,
   ID_CLIENTE           INT                      null,
   ID_AGENTE            INT                      null,
   TIPO_PT              CHARACTER VARYING (100)  null,
   CANTIDAD_PT          INT                 null,
   PRECIO_PT            NUMERIC(10,2)       null,
   TOTAL_PT             NUMERIC(10,2)  CHECK (TOTAL_PT > 0) null,
   constraint PK_PAQUETE_TURISTICO primary key (ID_PT)
);
-- PROCEDIMIENTO ALMACENADO
CREATE OR REPLACE PROCEDURE propaquetes()
LANGUAGE PLPGSQL
AS $BODY$
BEGIN
UPDATE PAQUETE_TURISTICO SET TOTAL_PT=CANTIDAD_PT*PRECIO_PT;
IF(SELECT MAX(ID_PT) FROM PAQUETE_TURISTICO WHERE TOTAL_PT IS NULL)>0 THEN
COMMIT;
ELSE 
IF(SELECT MAX(ID_PT) FROM PAQUETE_TURISTICO WHERE TOTAL_PT IS NULL)<=0 THEN
ROLLBACK;
END IF;
END IF;
END
$BODY$;
--LLAMAR PROCEDIMIENTO
CALL propaquetes();
--INSERTAR DATOS
INSERT INTO PAQUETE_TURISTICO VALUES (8,1,5,4,5,3,'NORMAL',4,6.00)
-- SELECCIONAR TABLA 
SELECT* FROM PAQUETE_TURISTICO


