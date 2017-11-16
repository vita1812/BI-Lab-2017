CREATE TABLE DimCustomer
  (
    Customer_key          NUMBER(8) PRIMARY KEY,
    Customer_id           VARCHAR2(15) NOT NULL,
    Customer_name         VARCHAR2(35) NOT NULL,
    Customer_surname      VARCHAR2(35) NOT NULL,
    Customer_email        VARCHAR2(65) NOT NULL,
    Customer_phone        VARCHAR2(30) NOT NULL,
    Customer_age          NUMBER(3) NOT NULL,
    Customer_card         VARCHAR2(30) NOT NULL,
    Customer_card_expires VARCHAR2(10) NOT NULL,
    Customer_region_key   NUMBER(8) NOT NULL,
    Customer_region       VARCHAR2(60) NOT NULL,
    Customer_country_key  NUMBER(8) NOT NULL,
    Customer_country      VARCHAR2(60) NOT NULL,
    Customer_city_key     NUMBER(8) NOT NULL,
    Customer_city         VARCHAR2(60) NOT NULL,
    Customer_address_key  NUMBER(8) NOT NULL,
    Customer_address      VARCHAR2(60) NOT NULL,
    Customer_postal_code  VARCHAR2(20)
  );
