create or replace sequence "FDA"."Part1" start with 100 increment by 1 noorder;
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
CREATE OR REPLACE FUNCTION "FDA"."Part3"("ORDER_AMOUNT" NUMBER(10,2), "TAX_RATE" NUMBER(5,2))
RETURNS NUMBER(10,2)
LANGUAGE SQL
AS '
   order_amount * (1 + tax_rate)
';
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
    "Part2"
    WHERE order_id >5;
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
