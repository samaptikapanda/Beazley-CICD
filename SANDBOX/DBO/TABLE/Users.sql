create or replace TABLE "DBO"."Users" (
	ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	NAME VARCHAR(100) NOT NULL,
	PREFERENCES VARIANT,
	CREATED_AT TIMESTAMP_NTZ(9),
	"Age" NUMBER(38,0)
);