CREATE TABLE ce_payment
  (
    Payment_id         VARCHAR(8) PRIMARY KEY,
    Payment_type_group VARCHAR2(50) NOT NULL,
    Prepayment         VARCHAR2(10) NOT NULL
  );