CREATE OR REPLACE PROCEDURE "CDR"."ADD_PROCEDURE"("PARAM1" NUMBER(38,0), "PARAM2" NUMBER(38,0), "PARAM3" NUMBER(38,0))
RETURNS FLOAT
LANGUAGE SQL
EXECUTE AS OWNER
AS '
  SELECT param1::FLOAT * param2::FLOAT ;
  ';
-----------------------------------------------------------------------------
