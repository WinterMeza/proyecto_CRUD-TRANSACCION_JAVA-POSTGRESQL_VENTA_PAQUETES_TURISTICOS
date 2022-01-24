/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     22/1/2022 13:42:29                           */
/*==============================================================*/


drop index CONTRATAN_FK;

drop index AGENTE_PK;

drop table AGENTE;

drop index EXISTEN_FK;

drop index CIUDAD_PK;

drop table CIUDAD;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index REALIZA_FK;

drop index BRINDA_FK;

drop index REGISTRA_FK;

drop index CONTRATACION_PK;

drop table CONTRATACION;

drop index MANTIENE_FK;

drop index CONVENIOS_PK;

drop table CONVENIOS;

drop index EXAMINA_FK;

drop index EMPRESA_PAQUETES_PK;

drop table EMPRESA_PAQUETES;

drop index EPOCAS_VENTA_PK;

drop table EPOCAS_VENTA;

drop index DESCRIBEN_FK;

drop index POSEE_FK;

drop index TIENE_FK;

drop index SE_REALIZAN_FK;

drop index HAY_FK;

drop index PAGO_PK;

drop table PAGO;

drop index PAIS_PK;

drop table PAIS;

drop index VENDEN_FK;

drop index COMPRA_FK;

drop index UBICAN_FK;

drop index RECIBE_FK;

drop index VENDE_FK;

drop index PAQUETE_TURISTICO_PK;

drop table PAQUETE_TURISTICO;

drop index CONTIENE_FK;

drop index PROVINCIA_PK;

drop table PROVINCIA;

drop index REGISTRAN_FK;

drop index SASTIFACCION_PK;

drop table SASTIFACCION;

drop index OFRECEN_FK;

drop index SERVICIOS_PK;

drop table SERVICIOS;

drop index SERVICIOS_ADICIONALES_PK;

drop table SERVICIOS_ADICIONALES;

drop index TIPO_PAGO_PK;

drop table TIPO_PAGO;

/*==============================================================*/
/* Table: AGENTE                                                */
/*==============================================================*/
create table AGENTE (
   ID_AGENTE            INT4                 not null,
   ID_EMPRESA_PA        INT4                 not null,
   NOMBRE_A             VARCHAR(100)         not null,
   CEDULA_A             VARCHAR(10)          not null,
   NUME_TELE_G          VARCHAR(10)          not null,
   CORREO_A             VARCHAR(100)         not null,
   FECHA_INGRESA        DATE                 not null,
   constraint PK_AGENTE primary key (ID_AGENTE)
);

/*==============================================================*/
/* Index: AGENTE_PK                                             */
/*==============================================================*/
create unique index AGENTE_PK on AGENTE (
ID_AGENTE
);

/*==============================================================*/
/* Index: CONTRATAN_FK                                          */
/*==============================================================*/
create  index CONTRATAN_FK on AGENTE (
ID_EMPRESA_PA
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            INT4                 not null,
   ID_PROVINCIA         INT4                 not null,
   NOMBRE_CIUDAD        VARCHAR(50)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
ID_CIUDAD
);

/*==============================================================*/
/* Index: EXISTEN_FK                                            */
/*==============================================================*/
create  index EXISTEN_FK on CIUDAD (
ID_PROVINCIA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_C             VARCHAR(100)         not null,
   CEDULA_C             VARCHAR(10)          not null,
   NUME_TELE_C          VARCHAR(10)          not null,
   CORREO_C             VARCHAR(100)         not null,
   TIPO_USUARIO         VARCHAR(20)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CONTRATACION                                          */
/*==============================================================*/
create table CONTRATACION (
   ID_CONTRATACION      INT4                 not null,
   ID_AGENTE            INT4                 not null,
   ID_SA                INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA_PAGO           DATE                 not null,
   FECHA_INICIO_VIAJE   DATE                 not null,
   FECHA_FIN_VIAJE      DATE                 not null,
   constraint PK_CONTRATACION primary key (ID_CONTRATACION)
);

/*==============================================================*/
/* Index: CONTRATACION_PK                                       */
/*==============================================================*/
create unique index CONTRATACION_PK on CONTRATACION (
ID_CONTRATACION
);

/*==============================================================*/
/* Index: REGISTRA_FK                                           */
/*==============================================================*/
create  index REGISTRA_FK on CONTRATACION (
ID_AGENTE
);

/*==============================================================*/
/* Index: BRINDA_FK                                             */
/*==============================================================*/
create  index BRINDA_FK on CONTRATACION (
ID_SA
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on CONTRATACION (
ID_CLIENTE
);

/*==============================================================*/
/* Table: CONVENIOS                                             */
/*==============================================================*/
create table CONVENIOS (
   ID_CONVENIOS         INT4                 not null,
   ID_EMPRESA_PA        INT4                 not null,
   TIPO_EMPRESA         VARCHAR(50)          not null,
   DIRECCION_EMPREC     VARCHAR(100)         not null,
   PROPIETARIO_EMPREC   VARCHAR(100)         not null,
   NUMERO_TELEC         VARCHAR(10)          not null,
   constraint PK_CONVENIOS primary key (ID_CONVENIOS)
);

/*==============================================================*/
/* Index: CONVENIOS_PK                                          */
/*==============================================================*/
create unique index CONVENIOS_PK on CONVENIOS (
ID_CONVENIOS
);

/*==============================================================*/
/* Index: MANTIENE_FK                                           */
/*==============================================================*/
create  index MANTIENE_FK on CONVENIOS (
ID_EMPRESA_PA
);

/*==============================================================*/
/* Table: EMPRESA_PAQUETES                                      */
/*==============================================================*/
create table EMPRESA_PAQUETES (
   ID_EMPRESA_PA        INT4                 not null,
   ID_EPOCAS            INT4                 not null,
   NOMBRE_E             VARCHAR(50)          not null,
   constraint PK_EMPRESA_PAQUETES primary key (ID_EMPRESA_PA)
);

/*==============================================================*/
/* Index: EMPRESA_PAQUETES_PK                                   */
/*==============================================================*/
create unique index EMPRESA_PAQUETES_PK on EMPRESA_PAQUETES (
ID_EMPRESA_PA
);

/*==============================================================*/
/* Index: EXAMINA_FK                                            */
/*==============================================================*/
create  index EXAMINA_FK on EMPRESA_PAQUETES (
ID_EPOCAS
);

/*==============================================================*/
/* Table: EPOCAS_VENTA                                          */
/*==============================================================*/
create table EPOCAS_VENTA (
   ID_EPOCAS            INT4                 not null,
   SITIO_E              VARCHAR(100)         not null,
   FECHA_VENTAS_ALTAS   DATE                 not null,
   FECHA_VENTA_BAJAS    DATE                 not null,
   constraint PK_EPOCAS_VENTA primary key (ID_EPOCAS)
);

/*==============================================================*/
/* Index: EPOCAS_VENTA_PK                                       */
/*==============================================================*/
create unique index EPOCAS_VENTA_PK on EPOCAS_VENTA (
ID_EPOCAS
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_TIPO_P            INT4                 not null,
   ID_CONTRATACION      INT4                 not null,
   ID_SA                INT4                 not null,
   ID_SERVICIOS         INT4                 not null,
   ID_SASTIFACION       INT4                 not null,
   TOTAL_PAGO           MONEY                not null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: HAY_FK                                                */
/*==============================================================*/
create  index HAY_FK on PAGO (
ID_TIPO_P
);

/*==============================================================*/
/* Index: SE_REALIZAN_FK                                        */
/*==============================================================*/
create  index SE_REALIZAN_FK on PAGO (
ID_CONTRATACION
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on PAGO (
ID_SA
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create  index POSEE_FK on PAGO (
ID_SERVICIOS
);

/*==============================================================*/
/* Index: DESCRIBEN_FK                                          */
/*==============================================================*/
create  index DESCRIBEN_FK on PAGO (
ID_SASTIFACION
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              INT4                 not null,
   NOMBRE_PAIS          VARCHAR(100)         not null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
ID_PAIS
);

/*==============================================================*/
/* Table: PAQUETE_TURISTICO                                     */
/*==============================================================*/
create table PAQUETE_TURISTICO (
   ID_PT                INT4                 not null,
   ID_EMPRESA_PA        INT4                 not null,
   ID_CONVENIOS         INT4                 not null,
   ID_CIUDAD            INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_AGENTE            INT4                 not null,
   TIPO_PT              VARCHAR(100)         not null,
   CANTIDAD_PT          INT4                 not null,
   PRECIO_PT            NUMERIC(10,2)        not null,
   TOTAL_PT             NUMERIC(10,2)        not null,
   constraint PK_PAQUETE_TURISTICO primary key (ID_PT)
);

/*==============================================================*/
/* Index: PAQUETE_TURISTICO_PK                                  */
/*==============================================================*/
create unique index PAQUETE_TURISTICO_PK on PAQUETE_TURISTICO (
ID_PT
);

/*==============================================================*/
/* Index: VENDE_FK                                              */
/*==============================================================*/
create  index VENDE_FK on PAQUETE_TURISTICO (
ID_EMPRESA_PA
);

/*==============================================================*/
/* Index: RECIBE_FK                                             */
/*==============================================================*/
create  index RECIBE_FK on PAQUETE_TURISTICO (
ID_CONVENIOS
);

/*==============================================================*/
/* Index: UBICAN_FK                                             */
/*==============================================================*/
create  index UBICAN_FK on PAQUETE_TURISTICO (
ID_CIUDAD
);

/*==============================================================*/
/* Index: COMPRA_FK                                             */
/*==============================================================*/
create  index COMPRA_FK on PAQUETE_TURISTICO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: VENDEN_FK                                             */
/*==============================================================*/
create  index VENDEN_FK on PAQUETE_TURISTICO (
ID_AGENTE
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         INT4                 not null,
   ID_PAIS              INT4                 not null,
   NOMBRE_PROVINCIA     VARCHAR(50)          not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
);

/*==============================================================*/
/* Index: PROVINCIA_PK                                          */
/*==============================================================*/
create unique index PROVINCIA_PK on PROVINCIA (
ID_PROVINCIA
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create  index CONTIENE_FK on PROVINCIA (
ID_PAIS
);

/*==============================================================*/
/* Table: SASTIFACCION                                          */
/*==============================================================*/
create table SASTIFACCION (
   ID_SASTIFACION       INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA_INCIDENTES     DATE                 not null,
   INCIDENTES_S         VARCHAR(100)         not null,
   BUENAS_VISITAS       INT4                 not null,
   MALAS_VISITAS        INT4                 not null,
   TOTAL_VISITAS        INT4                 not null,
   constraint PK_SASTIFACCION primary key (ID_SASTIFACION)
);

/*==============================================================*/
/* Index: SASTIFACCION_PK                                       */
/*==============================================================*/
create unique index SASTIFACCION_PK on SASTIFACCION (
ID_SASTIFACION
);

/*==============================================================*/
/* Index: REGISTRAN_FK                                          */
/*==============================================================*/
create  index REGISTRAN_FK on SASTIFACCION (
ID_CLIENTE
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   ID_SERVICIOS         INT4                 not null,
   ID_PT                INT4                 not null,
   HOSPEDAJES           MONEY                not null,
   TRASLADO             MONEY                not null,
   EVENTOS              MONEY                not null,
   constraint PK_SERVICIOS primary key (ID_SERVICIOS)
);

/*==============================================================*/
/* Index: SERVICIOS_PK                                          */
/*==============================================================*/
create unique index SERVICIOS_PK on SERVICIOS (
ID_SERVICIOS
);

/*==============================================================*/
/* Index: OFRECEN_FK                                            */
/*==============================================================*/
create  index OFRECEN_FK on SERVICIOS (
ID_PT
);

/*==============================================================*/
/* Table: SERVICIOS_ADICIONALES                                 */
/*==============================================================*/
create table SERVICIOS_ADICIONALES (
   ID_SA                INT4                 not null,
   NOMBRE_S             VARCHAR(50)          not null,
   SEGURO_VIDA          NUMERIC(10,2)        not null,
   SEGURO_ACCIDENTES    NUMERIC(10,2)        not null,
   constraint PK_SERVICIOS_ADICIONALES primary key (ID_SA)
);

/*==============================================================*/
/* Index: SERVICIOS_ADICIONALES_PK                              */
/*==============================================================*/
create unique index SERVICIOS_ADICIONALES_PK on SERVICIOS_ADICIONALES (
ID_SA
);

/*==============================================================*/
/* Table: TIPO_PAGO                                             */
/*==============================================================*/
create table TIPO_PAGO (
   ID_TIPO_P            INT4                 not null,
   CANTIDAD_P_E         INT4                 not null,
   EFECTIVO             NUMERIC(10,2)        not null,
   CANTIDAD_C           INT4                 not null,
   CREDITO              NUMERIC(10,2)        not null,
   CANTIDAD_OP          INT4                 not null,
   OTRA_FORMA_PAGO      NUMERIC(10,2)        not null,
   constraint PK_TIPO_PAGO primary key (ID_TIPO_P)
);

/*==============================================================*/
/* Index: TIPO_PAGO_PK                                          */
/*==============================================================*/
create unique index TIPO_PAGO_PK on TIPO_PAGO (
ID_TIPO_P
);

alter table AGENTE
   add constraint FK_AGENTE_CONTRATAN_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_EXISTEN_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_BRINDA_SERVICIO foreign key (ID_SA)
      references SERVICIOS_ADICIONALES (ID_SA)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_REALIZA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_REGISTRA_AGENTE foreign key (ID_AGENTE)
      references AGENTE (ID_AGENTE)
      on delete restrict on update restrict;

alter table CONVENIOS
   add constraint FK_CONVENIO_MANTIENE_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table EMPRESA_PAQUETES
   add constraint FK_EMPRESA__EXAMINA_EPOCAS_V foreign key (ID_EPOCAS)
      references EPOCAS_VENTA (ID_EPOCAS)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_DESCRIBEN_SASTIFAC foreign key (ID_SASTIFACION)
      references SASTIFACCION (ID_SASTIFACION)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_HAY_TIPO_PAG foreign key (ID_TIPO_P)
      references TIPO_PAGO (ID_TIPO_P)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_POSEE_SERVICIO foreign key (ID_SERVICIOS)
      references SERVICIOS (ID_SERVICIOS)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_SE_REALIZ_CONTRATA foreign key (ID_CONTRATACION)
      references CONTRATACION (ID_CONTRATACION)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_TIENE_SERVICIO foreign key (ID_SA)
      references SERVICIOS_ADICIONALES (ID_SA)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__COMPRA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__RECIBE_CONVENIO foreign key (ID_CONVENIOS)
      references CONVENIOS (ID_CONVENIOS)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__UBICAN_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__VENDE_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__VENDEN_AGENTE foreign key (ID_AGENTE)
      references AGENTE (ID_AGENTE)
      on delete restrict on update restrict;

alter table PROVINCIA
   add constraint FK_PROVINCI_CONTIENE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table SASTIFACCION
   add constraint FK_SASTIFAC_REGISTRAN_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIOS
   add constraint FK_SERVICIO_OFRECEN_PAQUETE_ foreign key (ID_PT)
      references PAQUETE_TURISTICO (ID_PT)
      on delete restrict on update restrict;

