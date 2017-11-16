DROP TABLE DIM_SELLERS CASCADE CONSTRAINTS;
CREATE TABLE DIM_SELLERS(
    SELLER_ID	    NUMBER NOT NULL,
    SELLER_NAME	    VARCHAR2(200) NOT NULL,
    SELLER_SURNAME	VARCHAR2(200) NOT NULL,	
    SELLER_RATING	NUMBER(8)     NOT NULL,	
    PHONE	        VARCHAR2(200) NOT NULL,	
    EMAIL	        VARCHAR2(200) NOT NULL,
    CITY_NAME       VARCHAR2(200) NOT NULL,
    INSERT_DT       DATE          NOT NULL,
    UPDATE_DT       DATE          NOT NULL,
    CONSTRAINT SELLER_ID PRIMARY KEY (SELLER_ID));