CREATE OR REPLACE FUNCTION "TRANSIENT"."AB_FUN"("USSD" VARCHAR(200), "ID" NUMBER(38,0))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
  select 
   case
        when ussd like any (''(%)'',''$%'')  then  trim(ussd, ''($)'') 
        else ussd end
';