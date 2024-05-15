create or replace TABLE "DBO".PRIMARY_FOREIGN (
	"order_id" NUMBER(38,0) NOT NULL,
	"order_date" DATE NOT NULL,
	"total_amount" NUMBER(10,2) NOT NULL,
	"customer_id" NUMBER(38,0),
	primary key ("order_id"),
	foreign key ("customer_id") references DBO.PRIMARY_FOREIGN(order_id)
);