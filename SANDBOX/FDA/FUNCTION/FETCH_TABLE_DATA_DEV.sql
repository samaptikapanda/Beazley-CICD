CREATE OR REPLACE FUNCTION "FDA"."FETCH_TABLE_DATA_DEV"()
RETURNS VARIANT
LANGUAGE JAVASCRIPT
AS '
    var schemaName = 
    var tableName = "SP_EMPDETAILS";
    
    var sqlQuery = `SELECT * FROM "DBO"."SP_EMPDETAILS"`;
    
    var stmt = snowflake.createStatement({sqlText: sqlQuery});
    var resultSet = stmt.execute();
    
    var result = [];
    while (resultSet.next()) {
      var row = {};
      for (var i = 1; i <= resultSet.getColumnCount(); i++) {
        var columnName = resultSet.getColumnName(i);
        row[columnName] = resultSet.getColumnValue(i);
      }
      result.push(row);
    }
    
    return result;
  ';