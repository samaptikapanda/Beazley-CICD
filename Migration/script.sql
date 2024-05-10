create or replace sequence "DBO".SEQ1 start with 2 increment by 2 noorder;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TABLE "DBO".CUSTOMER_2LK (
	FNAME VARCHAR(16777216),
	MIDDLENAME VARCHAR(16777216),
	LASTNAME VARCHAR(16777216),
	C_NAME VARCHAR(16777216),
	ADDRESS VARCHAR(16777216),
	CITY VARCHAR(16777216),
	PHONE NUMBER(38,0),
	EMAIL VARCHAR(16777216),
	SSNNEW1 VARCHAR(16777216),
	GENDER VARCHAR(16777216),
	AGE NUMBER(38,0),
	CUSTOMERID VARCHAR(16777216)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace view "DBO".CAL_DATE_VIEW(
	EMP_ID,
	EMP_NAME,
	ADDRESS,
	DATE_OF_BIRTH
) as
SELECT
    EMP_ID,
    EMP_NAME,
	ADDRESS,
    DATE_OF_BIRTH
FROM
    "DBO"."Cal_Date_Range"
    where ADDRESS IN ('Ahmedabad','Nainital','Kolkata');
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO"."Countries_Population_2024" (
	"country_id" NUMBER(38,0),
	"country_name" VARCHAR(255),
	"state_name" VARCHAR(255),
	"district_name" VARCHAR(255),
	"country_population_in_millions" NUMBER(38,0),
	"state_population_in_millions" NUMBER(38,0),
	"district_population_in_millions" NUMBER(38,0),
	"population_year" DATE,
	"literacy_rate" NUMBER(5,2),
	"country_currency" VARCHAR(50),
	unique ("country_id")
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO"."Countries_Population_2026" (
	"country_id" NUMBER(38,0) NOT NULL,
	"country_name" VARCHAR(255),
	"state_name" VARCHAR(255),
	"district_name" VARCHAR(255),
	"country_population_in_millions" NUMBER(38,0),
	"state_population_in_millions" NUMBER(38,0),
	"district_population_in_millions" NUMBER(38,0),
	"population_year" DATE,
	"literacy_rate" NUMBER(5,2),
	"country_currency" VARCHAR(50),
	primary key ("country_id"),
	foreign key ("country_id") references "DBO"."Countries_Population_2025"("country_id")
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION "DBO"."EVEN_OR_ODD"("INPUT_NUMBER" NUMBER(38,0))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
AS '
    -- Check if the input number is even or odd
    CASE WHEN MOD(input_number,10) <> 0 THEN ''Odd'' ELSE ''Even'' END
  ';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "DBO"."INSERTORUPDATEOBJECT"("OBJECTTYPE" VARCHAR(16777216), "OBJECTNAME" VARCHAR(16777216), "KEYNAME" VARCHAR(16777216), "VALUE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var sql_command = ";
var result = ";

// Check if the record already exists
var existing_record = snowflake.execute({sqlText: "SELECT 1 FROM Object_Key_Value_Pair WHERE ObjectType = ? AND ObjectName = ? AND Keyname = ?", binds: [ObjectType, ObjectName, Keyname]});
if (existing_record.next()) {
    // Update the existing record
    sql_command = "UPDATE Object_Key_Value_Pair SET Value = ? WHERE ObjectType = ? AND ObjectName = ? AND Keyname = ?";
} else {
    // Insert a new record
    sql_command = "INSERT INTO Object_Key_Value_Pair (ObjectType, ObjectName, Keyname, Value) VALUES (?, ?, ?, ?)";
}

// Execute the dynamic SQL
var statement = snowflake.createStatement({sqlText: sql_command, binds: [Value, ObjectType, ObjectName, Keyname]});
statement.execute();

return ''Success'';
';
-----------------------------------------------------------------------------
