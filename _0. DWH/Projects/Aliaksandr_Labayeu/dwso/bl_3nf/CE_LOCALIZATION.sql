-- CE_LOCALIZATION
execute pkg_drop.DROP_proc('"BL_3NF"."CE_LOCALIZATION"','table');
CREATE TABLE "BL_3NF"."CE_LOCALIZATION"
(
	"LOCALIZATION_ID" NUMBER(8,2) NOT NULL,
	"LOCALIZATION_NAME" VARCHAR2(50)
)
;