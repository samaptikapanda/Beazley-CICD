create or replace sequence "FDA"."Part1" start with 100 increment by 1 noorder;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace view "FDA"."Part4"(
	ORDER_ID,
	ORDER_DATE,
	CUSTOMER_ID,
	ORDER_AMOUNT,
	TAX_RATE,
	TOTAL_PRICE_WITH_TAX
) as
SELECT 
    order_id,
    order_date,
    customer_id,
    order_amount,
    tax_rate,
    "Part3"(order_amount, tax_rate) AS total_price_with_tax
FROM 
    "Part2";
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "FDA"."Part2" (
	ORDER_ID NUMBER(38,0) DEFAULT FDA."Part1".NEXTVAL,
	CUSTOMER_ID NUMBER(38,0),
	ORDER_DATE DATE,
	ORDER_AMOUNT NUMBER(10,2),
	TAX_RATE NUMBER(5,4)
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
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
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION "FDA"."Part3"("ORDER_AMOUNT" NUMBER(10,2), "TAX_RATE" NUMBER(5,2))
RETURNS NUMBER(10,2)
LANGUAGE SQL
AS '
   order_amount * (1 + tax_rate)
';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "FDA"."GET_ORDER_DETAILS_DEV"()
RETURNS TABLE ("ORDER_ID" NUMBER(38,0), "ORDER_DATE" DATE, "CUSTOMER_ID" NUMBER(38,0), "ORDER_AMOUNT" NUMBER(38,0), "TAX_RATE" NUMBER(38,0), "TOTAL_PRICE_WITH_TAX" NUMBER(38,0))
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
    cur_result CURSOR FOR
        SELECT 
            order_id,
            order_date,
            customer_id,
            order_amount,
            tax_rate,
            total_price_with_tax
        FROM 
            order_details_with_total_price;
BEGIN
    OPEN cur_result;
    RETURN TABLE(cur_result);
END;
';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "FDA"."Part5"()
RETURNS TABLE ("ORDER_ID" NUMBER(38,0), "ORDER_DATE" DATE, "CUSTOMER_ID" NUMBER(38,0), "ORDER_AMOUNT" NUMBER(38,0), "TAX_RATE" NUMBER(38,0), "TOTAL_PRICE_WITH_TAX" NUMBER(38,0))
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
    cur_result CURSOR FOR
        SELECT 
            order_id,
            order_date,
            customer_id,
            order_amount,
            tax_rate,
            total_price_with_tax
        FROM 
            "Part4";
BEGIN
    OPEN cur_result;
    RETURN TABLE(cur_result);
END;
';
-----------------------------------------------------------------------------
