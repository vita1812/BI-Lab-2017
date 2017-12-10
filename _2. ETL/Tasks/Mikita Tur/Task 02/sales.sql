
CREATE SEQUENCE sales_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE;

CREATE TABLE SALES
  ( SALES_ID   NUMBER PRIMARY KEY,
    SALES_DATE DATE,
    PRODUCT_ID VARCHAR2 (8),
    EMPLOYEE_ID VARCHAR2 (6),
    CUSTOMER_ID NUMBER,
    PROMO_ID NUMBER(6,0),
    SUMM     NUMBER ,
    AMOUNT  NUMBER,
    DISCOUNT NUMBER
  ) ;
       BEGIN
  FOR i IN 1..50
  LOOP
    dbms_random.seed ( i * 5 ) ;

INSERT
    INTO SALES
      (
        SALES_ID,
        SALES_DATE,
        PRODUCT_ID,
        EMPLOYEE_ID,
        CUSTOMER_ID,
        PROMO_ID,
        SUMM,
        AMOUNT,
        DISCOUNT
      )
    SELECT sales_seq.nextval AS SALES_ID,
      TRUNC ( SYSDATE - DBMS_RANDOM.VALUE ( 1, 1700 ) ) AS SALES_DATE ,
      ROUND (DBMS_RANDOM.VALUE (1,
      (SELECT MAX(PROD_ID)FROM PRODUCTS
      ))) AS PRODUCT_ID ,
      ROUND ( DBMS_RANDOM.VALUE (1,
      (SELECT MAX(EMPLOYEE_ID)FROM HR.EMPLOYEES
      ))) AS EMPLOYEE_ID ,
      ROUND ( DBMS_RANDOM.VALUE (1,
      ( SELECT MAX(CUST_ID) FROM SH.CUSTOMERS
      )) ) AS CUSTOMER_ID ,
      ROUND ( DBMS_RANDOM.VALUE (1,
      ( SELECT MAX(PROMO_ID) FROM SH.PROMOTIONS
      )) )                                  AS PROMO_ID ,
      ROUND ( DBMS_RANDOM.VALUE (10, 500) ) AS SUMM ,
      ROUND ( DBMS_RANDOM.VALUE (1, 20) )   AS AMOUNT ,
      ROUND( DBMS_RANDOM.VALUE (1, 10))     AS DISCOUNT
    FROM dual
      CONNECT BY level <= 10000;
  END LOOP;
END;
/
commit;