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