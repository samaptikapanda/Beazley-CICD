CREATE OR REPLACE PROCEDURE "TRANSIENT"."Proc_return_float_example"("INPUT_NUMBER" FLOAT)
RETURNS FLOAT
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS '
  return 42.0;
  ';