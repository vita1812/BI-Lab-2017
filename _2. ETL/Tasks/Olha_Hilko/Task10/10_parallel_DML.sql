EXPLAIN PLAN FOR
UPDATE /*+ PARALLEL(c) */ 
 BL_DM.DIMCUSTOMER c
SET ID_LOCATION = -99
WHERE ID_LOCATION=0;
  
SELECT * FROM TABLE (dbms_xplan.display);
--rollback;