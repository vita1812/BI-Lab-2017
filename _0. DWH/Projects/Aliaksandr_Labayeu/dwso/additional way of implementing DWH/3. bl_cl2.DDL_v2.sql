--------------------------------------------------------------------------------
-- bl_cl2 layer ----------------------------------------------------------------
--------------------------------------------------------------------------------
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

execute bl_cl.PKG_DROP.DROP_Proc('CLS_DEPARTMENTS','table');
CREATE TABLE "BL_CL2"."CLS_DEPARTMENTS"
(
	"DEPARTMENT_ID" NUMBER(8),
	"DEPARTMENT_DESC" VARCHAR2(50),
	"ADDRESS_ID" VARCHAR2(50),
	"ADDRESS_DESC" VARCHAR2(50),
	"CITY_ID" NUMBER(15),
	"CITY_DESC" VARCHAR2(100),
	"COUNTRY_ID" NUMBER(15),
	"COUNTRY_DESC" VARCHAR2(100),
	"SUBREGION_ID" NUMBER(8),
	"SUBREGION_DESC" VARCHAR2(50),
	"REGION_ID" NUMBER(8),
	"REGION_DESC" VARCHAR2(50),
  "PHONE" VARCHAR2(20),
	"POSTAL_CODE" VARCHAR2(50),
	"START_DT" DATE,
	"END_DT" DATE,
	"IS_ACTIVE" VARCHAR2(1),
	"UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.PKG_DROP.DROP_Proc('CLS_PRODUCTS','table');
CREATE TABLE "BL_CL2"."CLS_PRODUCTS"
(

	"PRODUCT_ID" NUMBER(8),
	"PRODUCT_DESC" VARCHAR2(50),
	"PRODUCT_PRICE" VARCHAR2(50),
	"CATEGORY_ID" NUMBER(8),
	"CATEGORY_DESC" VARCHAR2(50),
	"SUBCATEGORY_ID" NUMBER(8),
	"SUBCATEGORY_DESC" VARCHAR2(50),
	"SUBCATEGORY_SIZE" NUMBER(8,2),
	"SUBCATEGORY_TOBACCO" NUMBER(8,2),
	"LOCALIZATION_ID" NUMBER(8),
	"LOCALIZATION_DESC" VARCHAR2(50),
	"UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.PKG_DROP.DROP_Proc('CLS_PROMOTIONS','table');
CREATE TABLE "BL_CL2"."CLS_PROMOTIONS"
(

	"PROMO_ID" NUMBER(8),
	"PROMO_NAME" VARCHAR2(100),
	"PROMO_DESC" VARCHAR2(100),
	"PROMO_COST" NUMBER(8,2),
	"START_DT" DATE,
	"END_DT" DATE,
	"IS_ACTIVE" VARCHAR(1),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.PKG_DROP.DROP_Proc('CLS_DATE','table');
CREATE TABLE "BL_CL2"."CLS_DATE"
(
	"DATE_ID" DATE NOT NULL,
	"DAY_WEEK" NUMBER(8,2),
	"DAY_SHORT" VARCHAR2(50),
	"DAY_LONG" VARCHAR2(50),
	"DAY_MONTH" NUMBER(8,2),
	"LASTDAY_MONTH" DATE,
	"DAY_YEAR" NUMBER(8,2),
	"MONTH_YEAR" NUMBER(8,2),
	"MONTH_SHORT" VARCHAR2(50),
	"MONTH_LONG" VARCHAR2(50),
	"MONTH_DESC" VARCHAR2(50),
	"QUARTER" NUMBER(8,2),
	"YEAR_HALF" NUMBER(8,2),
	"YEAR" NUMBER(8,2)
)
;

execute bl_cl.PKG_DROP.DROP_Proc('CLS_DATE','table');
CREATE TABLE CLS_DATE
(
	"DATE_ID" DATE NOT NULL,
	"DAY_WEEK" NUMBER(8),
	"DAY_SHORT" VARCHAR2(50),
	"DAY_LONG" VARCHAR2(50),
	"DAY_MONTH" NUMBER(8,2),
	"LASTDAY_MONTH" DATE,
	"DAY_YEAR" NUMBER(8),
	"MONTH_YEAR" NUMBER(8),
	"MONTH_SHORT" VARCHAR2(50),
	"MONTH_LONG" VARCHAR2(50),
	"MONTH_DESC" VARCHAR2(50),
	"QUARTER" NUMBER(8),
	"YEAR_HALF" NUMBER(8),
	"YEAR" NUMBER(8)
)
;

execute bl_cl.PKG_DROP.DROP_Proc('CLS_SALES','table');
CREATE TABLE "BL_CL2"."CLS_SALES"
(
	"PRODUCT_ID" NUMBER(8) NOT NULL,
	"DEPARTMENT_ID" NUMBER(8) NOT NULL,
	"CONSUMER_ID" NUMBER(8) NOT NULL,
	"PROMO_ID" NUMBER(8) NOT NULL,
	"DATE_ID" DATE NOT NULL,
	"COST" NUMBER(8,2),
	"AMOUNT" NUMBER(8,2),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;


---------------------------------------------------------------------------------------------
-- DATA WAREHOUSE LAYER ---------------------------------------------------------------------
---------------------------------------------------------------------------------------------

execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."DIM_CONSUMERS"','table');
CREATE TABLE "DWH"."DIM_CONSUMERS"
(
  "CONSUMER_SURR_ID" NUMBER(15),
	"CONSUMER_ID" NUMBER(15),
	"CONSUMER_DESC" VARCHAR2(100),
	"RATE_ID" NUMBER(8),
	"RATE_DESC" VARCHAR2(50),
	"RESPONSIBLE_ID" NUMBER(15),
	"RESPONSIBLE_DESC" VARCHAR2(100),
	"ADDRESS_ID" NUMBER(15),
	"ADDRESS_DESC" VARCHAR2(100),
	"CITY_ID" NUMBER(15),
  "CITY_DESC" VARCHAR2(100),
	"COUNTRY_ID" NUMBER(8),
  "COUNTRY_DESC" VARCHAR2(100),
	"SUBREGION_ID" NUMBER(8),
	"SUBREGION_DESC" VARCHAR2(100),
	"REGION_ID" NUMBER(8),
	"REGION_DESC" VARCHAR2(100),
	"POSTAL_CODE" VARCHAR2(50),
	"PHONE" VARCHAR2(50),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.pkg_drop.DROP_proc('seq_dconsumers','sequence');
CREATE SEQUENCE seq_dconsumers
      INCREMENT BY 1 
          START WITH 1 
       MINVALUE 1 
        NOCYCLE; 

-- dim_DEPARTMENTS
execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."DIM_DEPARTMENTS"','table');
CREATE TABLE "DWH"."DIM_DEPARTMENTS"
(
  "DEPARTMENT_SURR_ID" NUMBER(15),
	"DEPARTMENT_ID" NUMBER(8),
	"DEPARTMENT_DESC" VARCHAR2(50),
	"ADDRESS_ID" VARCHAR2(50),
	"ADDRESS_DESC" VARCHAR2(50),
	"CITY_ID" VARCHAR2(50),
	"CITY_DESC" VARCHAR2(100),
	"COUNTRY_ID" VARCHAR2(50),
	"COUNTRY_DESC" VARCHAR2(100),
	"SUBREGION_ID" NUMBER(8),
	"SUBREGION_DESC" VARCHAR2(50),
	"REGION_ID" VARCHAR2(50),
	"REGION_DESC" VARCHAR2(50),
  "PHONE" VARCHAR2(20),
	"POSTAL_CODE" VARCHAR2(50),
	"START_DT" DATE,
	"END_DT" DATE,
	"IS_ACTIVE" VARCHAR2(1),
	"UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.pkg_drop.DROP_proc('seq_ddepartments','sequence');
CREATE SEQUENCE seq_ddepartments
      INCREMENT BY 1 
          START WITH 1 
       MINVALUE 1 
        NOCYCLE; 

-- dim_PRODUCT
execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."DIM_PRODUCTS"','table');
CREATE TABLE "DWH"."DIM_PRODUCTS"
(
  "PRODUCT_SURR_ID" NUMBER(8),
	"PRODUCT_ID" NUMBER(8),
	"PRODUCT_DESC" VARCHAR2(50),
	"PRODUCT_PRICE" VARCHAR2(50),
	"CATEGORY_ID" NUMBER(8),
	"CATEGORY_DESC" VARCHAR2(50),
	"SUBCATEGORY_ID" VARCHAR2(50),
	"SUBCATEGORY_DESC" VARCHAR2(50),
	"SUBCATEGORY_SIZE" NUMBER(8,2),
	"SUBCATEGORY_TOBACCO" NUMBER(8,2),
	"LOCALIZATION_ID" NUMBER(8),
	"LOCALIZATION_DESC" VARCHAR2(50),
	"UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.pkg_drop.DROP_proc('seq_dproduct','sequence');
CREATE SEQUENCE seq_dproduct
      INCREMENT BY 1 
          START WITH 1 
       MINVALUE 1 
        NOCYCLE; 

-- dim_PROMOTIONS
execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."DIM_PROMOTIONS"','table');
CREATE TABLE "DWH"."DIM_PROMOTIONS"
(
  "PROMO_SURR_ID" NUMBER(8),
	"PROMO_ID" NUMBER(8),
	"PROMO_NAME" VARCHAR2(100),
	"PROMO_DESC" VARCHAR2(100),
	"PROMO_COST" NUMBER(8,2),
	"START_DT" DATE,
	"END_DT" DATE,
	"IS_ACTIVE" VARCHAR(1),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;

execute bl_cl.pkg_drop.DROP_proc('seq_dpromotion','sequence');
CREATE SEQUENCE seq_dpromotion
      INCREMENT BY 1 
          START WITH 1 
       MINVALUE 1 
        NOCYCLE; 

-- dim_DATE
execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."DIM_DATE"','table');
CREATE TABLE "DWH"."DIM_DATE"
(
	"DATE_ID" DATE NOT NULL,
	"DAY_WEEK" NUMBER(8),
	"DAY_SHORT" VARCHAR2(50),
	"DAY_LONG" VARCHAR2(50),
	"DAY_MONTH" NUMBER(8,2),
	"LASTDAY_MONTH" DATE,
	"DAY_YEAR" NUMBER(8),
	"MONTH_YEAR" NUMBER(8),
	"MONTH_SHORT" VARCHAR2(50),
	"MONTH_LONG" VARCHAR2(50),
	"MONTH_DESC" VARCHAR2(50),
	"QUARTER" NUMBER(8),
	"YEAR_HALF" NUMBER(8),
	"YEAR" NUMBER(8)
)
;

execute bl_cl.PKG_DROP.DROP_Proc('"DWH"."FCT_SALES"','table');
CREATE TABLE "DWH"."FCT_SALES"
(
	"PRODUCT_ID" NUMBER(8) NOT NULL,
	"DEPARTMENT_ID" NUMBER(8) NOT NULL,
	"CONSUMER_ID" NUMBER(8) NOT NULL,
	"PROMO_ID" NUMBER(8) NOT NULL,
	"DATE_ID" DATE,
	"COST" NUMBER(8,2),
	"AMOUNT" NUMBER(8,2),
  "UPDATE_DT" DATE,
	"INSERT_DT" DATE
)
;



-- DWH --
ALTER TABLE "DWH"."DIM_CONSUMERS" 
 ADD CONSTRAINT "PK_DIM_CONSUMERS"
	PRIMARY KEY ("CONSUMER_SURR_ID") USING INDEX
;

ALTER TABLE "DWH"."DIM_DATE" 
 ADD CONSTRAINT "PK_DIM_DATE"
	PRIMARY KEY ("DATE_ID") USING INDEX
;

ALTER TABLE "DWH"."DIM_DEPARTMENTS" 
 ADD CONSTRAINT "PK_DIM_DEPARTMENTS"
	PRIMARY KEY ("DEPARTMENT_SURR_ID") USING INDEX
;

ALTER TABLE "DWH"."DIM_PRODUCTS" 
 ADD CONSTRAINT "PK_DIM_PRODUCTS"
	PRIMARY KEY ("PRODUCT_SURR_ID") USING INDEX
;

ALTER TABLE "DWH"."DIM_PROMOTIONS" 
 ADD CONSTRAINT "PK_DIM_PROMOTIONS"
	PRIMARY KEY ("PROMO_SURR_ID") USING INDEX
;

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "PK_FCT_SALES"
	PRIMARY KEY ("PRODUCT_ID","DEPARTMENT_ID","CONSUMER_ID","PROMO_ID","DATE_ID") USING INDEX
;

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "FK_FCT_SALES_DIM_CONSUMERS"
	FOREIGN KEY ("CONSUMER_ID") REFERENCES "DWH"."DIM_CONSUMERS" ("CONSUMER_SURR_ID")
;

-- ALTER TABLE "DWH"."FCT_SALES"
--  DROP CONSTRAINT "FK_FCT_SALES_DIM_DATE";

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "FK_FCT_SALES_DIM_DATE"
	FOREIGN KEY ("DATE_ID") REFERENCES "DWH"."DIM_DATE" ("DATE_ID")
;

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "FK_FCT_SALES_DIM_DEPARTMENTS"
	FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "DWH"."DIM_DEPARTMENTS" ("DEPARTMENT_SURR_ID")
;

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "FK_FCT_SALES_DIM_PRODUCTS"
	FOREIGN KEY ("PRODUCT_ID") REFERENCES "DWH"."DIM_PRODUCTS" ("PRODUCT_SURR_ID")
;

ALTER TABLE "DWH"."FCT_SALES" 
 ADD CONSTRAINT "FK_FCT_SALES_DIM_PROMOTIONS"
	FOREIGN KEY ("PROMO_ID") REFERENCES "DWH"."DIM_PROMOTIONS" ("PROMO_SURR_ID")
;
  