CREATE OR REPLACE FUNCTION "DBO"."EVEN_OR_ODD"("INPUT_NUMBER" NUMBER(38,0))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    -- Check if the input number is even or odd
    CASE WHEN MOD(input_number,10) <> 0 THEN ''Odd'' ELSE ''Even'' END
  ';