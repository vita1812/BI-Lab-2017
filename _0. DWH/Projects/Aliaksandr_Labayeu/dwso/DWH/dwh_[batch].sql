@USER_[dwh].sql

CONNECT bl_cl2/123456;
show user;

@DIM_DATE.sql
@DIM_PROMOTIONS.sql
@DIM_PRODUCT.sql
@DIM_DEPARTMENTS.sql
@DIM_CONSUMERS.sql
@FCT_SALES.sql

@DWH_[DDL-SYNONYMS].sql
@DWH_[DDL-CONSTRAINTS].sql

@DWH_[DML].sql