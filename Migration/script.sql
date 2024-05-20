CREATE OR REPLACE PROCEDURE "TRANSIENT"."CURSOR_Demo"("EMPNAME" VARCHAR(50))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
begin
 LET res RESULTSET := (select EMPNAME from "SNOWFLAKE_TEST"."DEV"."STGTEST"  where EXPERIANCE >5);
 LET item_cursor CURSOR for res;
 LET all_people VARCHAR := '''';
 For v_item_cursor in item_cursor do
 all_people :=v_item_cursor.EMPNAME;
 INSERT INTO  "SNOWFLAKE_TEST"."DEV"."TEMPR"  (EMPNAME) values(:all_people);

 END FOR;
  INSERT INTO  "SNOWFLAKE_TEST"."DEV"."TEMPR02" 
   (EMPID,
   EMPNAME,
   EMPADDRESS,
   EXPERIANCE,
   SALRY,
   BLOODGROUP
   )
   SELECT 
   a.EMPID,
   a.EMPNAME,
   a.EMPADDRESS,
   a.EXPERIANCE,
   a.SALRY,
   a.BLOODGROUP
   FROM "SNOWFLAKE_TEST"."DEV"."STGTEST" as a,
   "SNOWFLAKE_TEST"."DEV"."TEMPR" as b
   where a.EMPNAME = b.EMPNAME;
end
';
-----------------------------------------------------------------------------
