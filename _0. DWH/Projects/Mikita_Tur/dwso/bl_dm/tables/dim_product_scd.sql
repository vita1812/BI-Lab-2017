--------------------------------------------------------
--  DDL for Table DIM_PRODUCT_SCD
--------------------------------------------------------

  CREATE TABLE "BL_DM"."DIM_PRODUCT_SCD" 
   (	"PROD_SURR_ID" NUMBER(8,0), 
	"PROD_ID" NUMBER(8,0), 
	"PROD_NAME" VARCHAR2(100 BYTE), 
	"CATEG_NAME" VARCHAR2(25 BYTE), 
	"SUBCAT_NAME" VARCHAR2(25 BYTE), 
	"PROD_PRICE" NUMBER(8,0), 
	"PROD_PACKAGE" VARCHAR2(25 BYTE), 
	"START_DT" DATE, 
	"END_DT" DATE, 
	"IS_ACTIVE" VARCHAR2(4 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PDB_BL_DM" ;
--------------------------------------------------------
--  DDL for Index PK_PROD_SURR_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_DM"."PK_PROD_SURR_ID" ON "BL_DM"."DIM_PRODUCT_SCD" ("PROD_SURR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PDB_BL_DM" ;
--------------------------------------------------------
--  Constraints for Table DIM_PRODUCT_SCD
--------------------------------------------------------

  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("PROD_SURR_ID" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("PROD_ID" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("PROD_NAME" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("CATEG_NAME" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("SUBCAT_NAME" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("PROD_PRICE" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("PROD_PACKAGE" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("START_DT" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("END_DT" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BL_DM"."DIM_PRODUCT_SCD" ADD CONSTRAINT "PK_PROD_SURR_ID" PRIMARY KEY ("PROD_SURR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PDB_BL_DM"  ENABLE;