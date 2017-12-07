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
  