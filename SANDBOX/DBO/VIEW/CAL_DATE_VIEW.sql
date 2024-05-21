create or replace view "DBO".CAL_DATE_VIEW(
	EMP_ID,
	EMP_NAME,
	ADDRESS,
	DATE_OF_BIRTH
) as
SELECT
    EMP_ID,
    EMP_NAME,
	ADDRESS,
    DATE_OF_BIRTH
FROM
    "DBO"."Cal_Date_Range"
    where ADDRESS IN ('Ahmedabad','Nainital','Kolkata');