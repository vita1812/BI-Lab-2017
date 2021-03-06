show user;

exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Country', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Region', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Organization', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Category', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Station', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Location', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Individual', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Currency', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Payment_Type', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Unit', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Fuel_Type', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('PriceList', 'TABLE');

exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Product_Type', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Product', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Customer_Type', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Customer', 'TABLE');

exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Line_Item', 'TABLE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('Payment', 'TABLE');

/*exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('SEQ_Line_Item_ID_LINE_ITEM', 'SEQUENCE');
exec  FRAMEWORK.pkg_utl_drop.proc_drop_obj ('SEQ_Payment_ID_PAYMENT', 'SEQUENCE');*/


CREATE TABLE Country
(
	ID_COUNTRY NUMBER(2) NOT NULL,
	C_NAME VARCHAR2(50),
	C_CODE VARCHAR2(3) NOT NULL
)
;

CREATE TABLE Region
(
	ID_REGION NUMBER(3) NOT NULL,
	ID_COUNTRY NUMBER(2) NOT NULL,
	R_NAME VARCHAR2(50) NOT NULL
)
;

CREATE TABLE Organization
(
	ID_CUSTOMER NUMBER(10) NOT NULL,
	RUS_FULL_NAME VARCHAR2(50) NOT NULL,
	RUS_SHORT_NAME VARCHAR2(50),
	CONTACT VARCHAR2(50),
	MANAGER_FIRST_NAME VARCHAR2(50),
	MANAGER_LAST_NAME VARCHAR2(50),
	MANAGER_MIDDLE_NAME VARCHAR2(50),
	TAX_ID NUMBER(10) NOT NULL
)
;

CREATE TABLE Category
(
	ID_CATEGORY NUMBER(3) NOT NULL,
	RUS_DESCRIPTION VARCHAR2(50),
	ENG_DESCRIPTION VARCHAR2(50)
)
;

CREATE TABLE Location
(
	ID_LOCATION NUMBER(4) NOT NULL,
	ID_DISTRICT NUMBER(4),
	L_NAME VARCHAR2(50) NOT NULL,
	ID_REGION NUMBER(3) NOT NULL,
	D_NAME VARCHAR2(50)
)
;

CREATE TABLE Station
(
	ID_STATION NUMBER(4) NOT NULL,
	S_NUMBER NUMBER(3),
	ID_LOCATION NUMBER(4) NOT NULL,
	LONGITUDE NUMBER(10,6) NOT NULL,
	LATITUDE NUMBER(10,6) NOT NULL,
	ROAD1 VARCHAR(50),
	ROAD2 VARCHAR2(50),
  LOCATION_DECS VARCHAR2(255)
)
;



CREATE TABLE Individual
(
	ID_CUSTOMER NUMBER(10) NOT NULL,
	FIRST_NAME VARCHAR2(50) NOT NULL,
	LAST_NAME VARCHAR2(50) NOT NULL,
	MIDDLE_NAME VARCHAR2(50) NOT NULL,
	BITRHDAY DATE NOT NULL,
	SEX NUMBER(1) NOT NULL
)
;

CREATE TABLE Currency
(
	ID_CURRENCY VARCHAR2(3) NOT NULL,
	RUS_DESCRIPTION VARCHAR2(50),
	ENG_DESCRIPTION VARCHAR2(50)
)
;

CREATE TABLE Payment_Type
(
	ID_PAYMENT_TYPE NUMBER(2) NOT NULL,
	PT_DESCRIPTION VARCHAR2(255),
	PT_NAME VARCHAR2(50) NOT NULL
)
;

CREATE TABLE PriceList
(
	ID_ITEM NUMBER(8) NOT NULL,
	ID_PRODUCT NUMBER(8) NOT NULL,
	ID_CURRENCY VARCHAR(3) NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE,
	PRICE NUMBER(8,3) NOT NULL,
	IS_CURRENT NUMBER(1) DEFAULT 0 NOT NULL
)
;

CREATE TABLE Unit
(
	ID_UNIT VARCHAR2(3) NOT NULL,
	RUS_DESCRIPTION VARCHAR2(50),
	ENG_DESCRIPTION VARCHAR2(50)
)
;

CREATE TABLE Fuel_Type
(
	ID_FUEL_CODE VARCHAR2(3) NOT NULL,
	RUS_DESCRIPTION VARCHAR2(50),
	ENG_DESCRIPTION VARCHAR2(50)
)
;

CREATE TABLE Product_Type
(
	ID_PRODUCT_TYPE NUMBER(1) NOT NULL,
	ID_FUEL VARCHAR2(3),
	ID_CATEGORY NUMBER(3)
)
;

CREATE TABLE Customer_Type
(
	ID_CUSTOMER_TYPE NUMBER(1) NOT NULL,
	DESCRIPTION VARCHAR2(50) NOT NULL
)
;

CREATE TABLE Customer
(
	ID_CUSTOMER NUMBER(10) NOT NULL,
	ID_CUSTOMER_TYPE NUMBER(1) NOT NULL,
	ID_LOCATION NUMBER(8),
	ADDRESS VARCHAR2(50),
	PHONE VARCHAR2(50),
	POSTALCODE NUMBER(8),
	EMAIL VARCHAR2(50)
)
;

CREATE TABLE Product
(
	ID_PRODUCT NUMBER(8) NOT NULL,
	ID_PRODUCT_TYPE NUMBER(1) NOT NULL
)
;

CREATE TABLE Line_Item
(
	ID_LINE_ITEM NUMBER(16) NOT NULL,
	ID_PAYMENT NUMBER(16) NOT NULL,
	ID_PRODUCT NUMBER(8) NOT NULL,
	ID_UNIT VARCHAR2(3) NOT NULL,
	ID_CURRENCY VARCHAR2(3) NOT NULL,
	AMOUNT NUMBER(6,3) NOT NULL,
	PRICE_PER_UNIT NUMBER(6,3) NOT NULL,
	DISCOUNT NUMBER(2,3) DEFAULT 0,
	TOTAL_PRICE NUMBER(8,3) NOT NULL
)
;

CREATE TABLE Payment
(
	ID_PAYMENT NUMBER(16) NOT NULL,
	ID_CURRENCY VARCHAR2(3) NOT NULL,
	ID_CUSTOMER NUMBER(10),
	ID_PAYMENT_TYPE NUMBER(2) NOT NULL,
	PAYMENT_DATE DATE NOT NULL,
	PRICE NUMBER(8,2) NOT NULL,
	PAYMENT_TIME TIMESTAMP(6),
	ID_STATION NUMBER(4) NOT NULL
)
;

CREATE SEQUENCE SEQ_Line_Item_ID_LINE_ITEM 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE SEQUENCE SEQ_Payment_ID_PAYMENT 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

ALTER TABLE Country 
 ADD CONSTRAINT PK_Country
	PRIMARY KEY (ID_COUNTRY) USING INDEX
;

CREATE INDEX IXFK_Region_Country   
 ON Region (ID_COUNTRY) 
;

ALTER TABLE Region 
 ADD CONSTRAINT PK_Region
	PRIMARY KEY (ID_REGION) USING INDEX
;

CREATE INDEX IXFK_Organization_Customer   
 ON Organization (ID_CUSTOMER) 
;

ALTER TABLE Organization 
 ADD CONSTRAINT PK_Organization
	PRIMARY KEY (ID_CUSTOMER) USING INDEX
;

ALTER TABLE Category 
 ADD CONSTRAINT PK_Category
	PRIMARY KEY (ID_CATEGORY) USING INDEX
;

/*CREATE INDEX IXFK_Station_Location   
 ON Station (ID_LOCATION) 
;*/

ALTER TABLE Station 
 ADD CONSTRAINT PK_Station
	PRIMARY KEY (ID_STATION) USING INDEX
;

CREATE INDEX IXFK_Location_Region   
 ON Location (ID_REGION) 
;

ALTER TABLE Location 
 ADD CONSTRAINT PK_Location
	PRIMARY KEY (ID_LOCATION) USING INDEX
;

CREATE INDEX IXFK_Individual_Customer   
 ON Individual (ID_CUSTOMER) 
;

ALTER TABLE Individual 
 ADD CONSTRAINT PK_Individual
	PRIMARY KEY (ID_CUSTOMER) USING INDEX
;

ALTER TABLE Currency 
 ADD CONSTRAINT PK_Currency
	PRIMARY KEY (ID_CURRENCY) USING INDEX
;

ALTER TABLE Payment_Type 
 ADD CONSTRAINT PK_Payment_Type
	PRIMARY KEY (ID_PAYMENT_TYPE) USING INDEX
;

CREATE INDEX IXFK_PriceList_Currency   
 ON PriceList (ID_CURRENCY) 
;

CREATE INDEX IXFK_PriceList_Product   
 ON PriceList (ID_PRODUCT) 
;

ALTER TABLE PriceList 
 ADD CONSTRAINT PK_PriceList
	PRIMARY KEY (ID_ITEM) USING INDEX
;

ALTER TABLE Unit 
 ADD CONSTRAINT PK_Unit
	PRIMARY KEY (ID_UNIT) USING INDEX
;

ALTER TABLE Fuel_Type 
 ADD CONSTRAINT PK_Fuel_Type
	PRIMARY KEY (ID_FUEL_CODE) USING INDEX
;

CREATE INDEX IXFK_Product_Type_Category   
 ON Product_Type (ID_CATEGORY) 
;

CREATE INDEX IXFK_Product_Type_Fuel_Type   
 ON Product_Type (ID_FUEL) 
;

ALTER TABLE Product_Type 
 ADD CONSTRAINT PK_PRODUCT_TYPE
	PRIMARY KEY (ID_PRODUCT_TYPE) USING INDEX
;

ALTER TABLE Customer_Type 
 ADD CONSTRAINT PK_Customer_Typ_01
	PRIMARY KEY (ID_CUSTOMER_TYPE) USING INDEX
;

CREATE INDEX IXFK_Customer_Customer_Type   
 ON Customer (ID_CUSTOMER_TYPE) 
;

CREATE INDEX IXFK_Customer_Location   
 ON Customer (ID_LOCATION) 
;

CREATE INDEX IXFK_Customer_Organization   
 ON Customer (ID_CUSTOMER) 
;

ALTER TABLE Customer 
 ADD CONSTRAINT PK_Customer
	PRIMARY KEY (ID_CUSTOMER) USING INDEX
;

CREATE INDEX IXFK_Product_Product_Type   
 ON Product (ID_PRODUCT_TYPE) 
;

ALTER TABLE Product 
 ADD CONSTRAINT PK_Product
	PRIMARY KEY (ID_PRODUCT) USING INDEX
;

CREATE INDEX IXFK_Line_Item_Currency  ON Line_Item (ID_CURRENCY);

CREATE INDEX IXFK_Line_Item_Product   
 ON Line_Item (ID_PRODUCT) 
;

CREATE INDEX IXFK_LINE_ITEM_Payment    ON Line_Item (ID_PAYMENT);
CREATE INDEX IXFK_Line_Item_Unit    ON Line_Item (ID_UNIT) ;

ALTER TABLE Line_Item 
 ADD CONSTRAINT PK_LINE_ITEM
	PRIMARY KEY (ID_LINE_ITEM) USING INDEX
;

CREATE INDEX IXFK_Payment_Currency   
 ON Payment (ID_CURRENCY) 
;

CREATE INDEX IXFK_Payment_Customer   
 ON Payment (ID_CUSTOMER) 
;

CREATE INDEX IXFK_Payment_Payment_Type   
 ON Payment (ID_PAYMENT_TYPE) 
;

CREATE INDEX IXFK_Payment_Station   
 ON Payment (ID_STATION) 
;

ALTER TABLE Payment 
 ADD CONSTRAINT PK_PAYMENTS
	PRIMARY KEY (ID_PAYMENT) USING INDEX
;

ALTER TABLE Region 
 ADD CONSTRAINT FK_Region_Country
	FOREIGN KEY (ID_COUNTRY) REFERENCES Country (ID_COUNTRY)
;

ALTER TABLE Organization 
 ADD CONSTRAINT FK_Organization_Customer
	FOREIGN KEY (ID_CUSTOMER) REFERENCES Customer (ID_CUSTOMER)
;

/*ALTER TABLE Station 
 ADD CONSTRAINT FK_Station_Location
	FOREIGN KEY (ID_LOCATION) REFERENCES Location (ID_LOCATION)
;*/

ALTER TABLE Location 
 ADD CONSTRAINT FK_Location_Region
	FOREIGN KEY (ID_REGION) REFERENCES Region (ID_REGION)
;

ALTER TABLE Individual 
 ADD CONSTRAINT FK_Individual_Customer
	FOREIGN KEY (ID_CUSTOMER) REFERENCES Customer (ID_CUSTOMER)
;

ALTER TABLE PriceList 
 ADD CONSTRAINT FK_PriceList_Currency
	FOREIGN KEY (ID_CURRENCY) REFERENCES Currency (ID_CURRENCY)
;

ALTER TABLE PriceList 
 ADD CONSTRAINT FK_PriceList_Product
	FOREIGN KEY (ID_PRODUCT) REFERENCES Product (ID_PRODUCT)
;

ALTER TABLE Product_Type 
 ADD CONSTRAINT FK_Product_Type_Category
	FOREIGN KEY (ID_CATEGORY) REFERENCES Category (ID_CATEGORY)
;

ALTER TABLE Product_Type 
 ADD CONSTRAINT FK_Product_Type_Fuel_Type
	FOREIGN KEY (ID_FUEL) REFERENCES Fuel_Type (ID_FUEL_CODE)
;

ALTER TABLE Customer 
 ADD CONSTRAINT FK_Customer_Customer_Type
	FOREIGN KEY (ID_CUSTOMER_TYPE) REFERENCES Customer_Type (ID_CUSTOMER_TYPE)
;

ALTER TABLE Customer 
 ADD CONSTRAINT FK_Customer_Location
	FOREIGN KEY (ID_LOCATION) REFERENCES Location (ID_LOCATION)
;

ALTER TABLE Product 
 ADD CONSTRAINT FK_Product_Product_Type
	FOREIGN KEY (ID_PRODUCT_TYPE) REFERENCES Product_Type (ID_PRODUCT_TYPE)
;

ALTER TABLE Line_Item 
 ADD CONSTRAINT FK_Line_Item_Currency
	FOREIGN KEY (ID_CURRENCY) REFERENCES Currency (ID_CURRENCY)
;

ALTER TABLE Line_Item 
 ADD CONSTRAINT FK_Line_Item_Product
	FOREIGN KEY (ID_PRODUCT) REFERENCES Product (ID_PRODUCT)
;

ALTER TABLE Line_Item 
 ADD CONSTRAINT FK_LINE_ITEM_Payment
	FOREIGN KEY (ID_PAYMENT) REFERENCES Payment (ID_PAYMENT)
;

ALTER TABLE Line_Item 
 ADD CONSTRAINT FK_Line_Item_Unit
	FOREIGN KEY (ID_UNIT) REFERENCES Unit (ID_UNIT)
;

ALTER TABLE Payment 
 ADD CONSTRAINT FK_Payment_Currency
	FOREIGN KEY (ID_CURRENCY) REFERENCES Currency (ID_CURRENCY)
;

ALTER TABLE Payment 
 ADD CONSTRAINT FK_Payment_Customer
	FOREIGN KEY (ID_CUSTOMER) REFERENCES Customer (ID_CUSTOMER)
;

ALTER TABLE Payment 
 ADD CONSTRAINT FK_Payment_Payment_Type
	FOREIGN KEY (ID_PAYMENT_TYPE) REFERENCES Payment_Type (ID_PAYMENT_TYPE)
;

ALTER TABLE Payment 
 ADD CONSTRAINT FK_Payment_Station
	FOREIGN KEY (ID_STATION) REFERENCES Station (ID_STATION)
;




grant select on Station to BL_CL2;
grant update on Station to BL_CL2;--BL_CL2;
grant insert on Station to BL_CL2;--BL_CL2;

grant select on Currency to BL_CL2;
grant update on Currency to BL_CL2;--BL_CL2;
grant insert on Currency to BL_CL2;

grant select on Payment_Type to BL_CL2;
grant update on Payment_Type to BL_CL2;--BL_CL2;
grant insert on Payment_Type to BL_CL2;

grant select on Customer to BL_CL2;
grant update on Customer to BL_CL2;--BL_CL2;
grant insert on Customer to BL_CL2;

grant select on Individual to BL_CL2;
grant update on Individual to BL_CL2;--BL_CL2;
grant insert on Individual to BL_CL2;


grant select on CUSTOMER_TYPE to BL_CL2;
grant update on CUSTOMER_TYPE to BL_CL2;--BL_CL2;
grant insert on CUSTOMER_TYPE to BL_CL2;