create or replace TRANSIENT TABLE "DBO".S_EMPLOYEEDETAILS_TRANSIENT (
	EMP_ID NUMBER(38,0) autoincrement start 1 increment 1 noorder,
	EMP_NAME VARCHAR(255),
	AGE NUMBER(38,0),
	CURRENT_ADDRESS VARCHAR(255),
	EMAIL VARCHAR(255),
	BUSINESS VARCHAR(255),
	PHONE VARCHAR(20),
	JOINING_DATE DATE,
	SALARY FLOAT
);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
create or replace TRANSIENT TABLE "DBO".T_PRODUCTS (
	PRODUCT_ID NUMBER(38,0) NOT NULL,
	PRODUCT_NAME VARCHAR(50),
	primary key (PRODUCT_ID)
);
-----------------------------------------------------------------------------
