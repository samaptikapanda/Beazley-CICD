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