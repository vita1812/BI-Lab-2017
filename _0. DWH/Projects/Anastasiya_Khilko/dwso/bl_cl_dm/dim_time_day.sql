CREATE TABLE DIM_TIME_DAY
(
	"DATE_ID" DATE NOT NULL,
	"FULL_DATE" DATE NOT NULL,
	"DAY_OF_WEEK" NUMBER(1) NOT NULL,
	"DAY_NAME" VARCHAR2(50) NOT NULL,
	"DAY_OF_MONTH" NUMBER(2) NOT NULL,
	"DAY_OF_YEAR" NUMBER(3) NOT NULL,
	"MONTH_NUMBER" NUMBER(2) NOT NULL,
	"MONTH_NAME" VARCHAR2(50) NOT NULL,
	"QUARTER" NUMBER(1) NOT NULL,
	"YAER" NUMBER(4) NOT NULL,
	"YEAR_QUARTER" VARCHAR2(50) NOT NULL
)
;