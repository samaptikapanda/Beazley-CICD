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