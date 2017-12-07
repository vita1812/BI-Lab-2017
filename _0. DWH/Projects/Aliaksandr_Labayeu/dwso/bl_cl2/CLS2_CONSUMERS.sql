execute bl_cl.PKG_DROP.DROP_Proc('CLS_CONSUMERS','table');
CREATE TABLE "BL_CL2"."CLS_CONSUMERS"
(

	"CONSUMER_ID" NUMBER(8),
	"CONSUMER_DESC" VARCHAR2(100),
	"RATE_ID" NUMBER(15),
	"RATE_DESC" VARCHAR2(100),
	"RESPONSIBLE_ID" NUMBER(8),
	"RESPONSIBLE_DESC" VARCHAR2(100),
	"ADDRESS_ID" NUMBER(8),
	"ADDRESS_DESC" VARCHAR2(50),
	"CITY_ID" NUMBER(8),
  "CITY_DESC" VARCHAR2(50),
	"COUNTRY_ID" NUMBER(8),
  "COUNTRY_DESC" VARCHAR2(100),
	"SUBREGION_ID" NUMBER(8),
	"SUBREGION_DESC" VARCHAR2(50),
	"REGION_ID" NUMBER(8),
	"REGION_DESC" VARCHAR2(50),
	"POSTAL_CODE" VARCHAR2(50),
	"PHONE" VARCHAR2(50),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

