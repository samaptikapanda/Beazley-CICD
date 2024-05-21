CREATE OR REPLACE FUNCTION "DBO"."FUNCTON1"("INPUT_NUMBER" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    --testingascac
    -- Check if the input number is even or odd
    CASE WHEN MOD(input_number,10) <> 0 THEN ''Odd'' ELSE ''Even'' END
  ';