create or replace materialized view "TRANSIENT"."mv_product_sales"(
	"product_id",
	TOTAL_SALES,
	NUMBER_OF_SALES
) as
SELECT
    "product_id",
    SUM(amount) AS total_sales,
    COUNT(*) AS number_of_sales
FROM
    "sales"
GROUP BY
    "product_id";