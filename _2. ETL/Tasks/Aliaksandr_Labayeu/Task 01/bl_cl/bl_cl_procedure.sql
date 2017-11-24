------------------ Procedure DML INSERT  
-- EXECUTE pkg_system.table_reinsert();
CREATE OR REPLACE PACKAGE pkg_system
  AUTHID CURRENT_USER as
  PROCEDURE table_reinsert;
END pkg_system;
/

CREATE OR REPLACE PACKAGE BODY pkg_system AS 
  PROCEDURE table_reinsert AS
    BEGIN
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_cntr2structure');
      EXECUTE IMMEDIATE ('INSERT INTO cls_cntr2structure SELECT * FROM EXT_GEO_cntr2structure_ISO3166');  
      
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_geo_countries');
      EXECUTE IMMEDIATE ('INSERT INTO cls_geo_countries SELECT * FROM EXT_GEO_countries_ISO3166');
      
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_geo_structure');
      EXECUTE IMMEDIATE ('INSERT INTO cls_geo_structure SELECT * FROM EXT_GEO_STRUCTURE_ISO3166');
      
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_products');
      EXECUTE IMMEDIATE ('INSERT INTO cls_products SELECT * FROM EXT_PRODUCTS');
      
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_consumers');
      EXECUTE IMMEDIATE ('INSERT INTO cls_consumers SELECT * FROM EXT_CONSUMERS');
  
      EXECUTE IMMEDIATE ('TRUNCATE TABLE cls_departments');
      EXECUTE IMMEDIATE ('INSERT INTO cls_departments SELECT * FROM EXT_DEPARTMENTS');
      
      COMMIT;
    END;
END pkg_system;
/
