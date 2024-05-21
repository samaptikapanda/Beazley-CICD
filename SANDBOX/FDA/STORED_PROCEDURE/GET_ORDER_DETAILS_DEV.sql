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