create or replace view "TRANSIENT".TEST_VIEW(
	EMP_ID,
	ID,
	EMP_NAME,
	AGE,
	CURRENT_ADDRESS,
	EMAIL,
	BUSINESS,
	PHONE,
	JOINING_DATE,
	SALARY
) as
SELECT 
    sum(a.EMP_ID) as EMP_ID ,
    count(a.ID) as ID,
    count(a.EMP_NAME) as EMP_NAME ,
    sum(a.AGE) as AGE ,
    count(DISTINCT a.CURRENT_ADDRESS) as CURRENT_ADDRESS ,
    count(DISTINCT a.EMAIL ) as EMAIL ,
    count(DISTINCT a.BUSINESS ) as BUSINESS ,
    max(a.PHONE) as PHONE ,
    min(a.JOINING_DATE) as JOINING_DATE,
    max(a.SALARY) as SALARY 
FROM  "TRANSIENT"."Test_Table" a
 left outer join "TRANSIENT"."Test_Table2"b                    
  on a.ID = b.ID;