create or replace secure materialized view "DBO".PRO(
	UNITS_SOLD,
	SALE_PRICE,
	GROSS_SALES,
	COUNTRY,
	PRODUCT
) as( select
	UNITS_SOLD ,
	SALE_PRICE ,
	GROSS_SALES ,
	COUNTRY ,
	PRODUCT  from "PRODUCT_SMLTRGT"
);