create or replace view "FDA"."RUNU_SFVDimEmployee"(
	"HEXKeyEmployees",
	"EmployeeNumber",
	"EmployeeName",
	"EmployeeFullName",
	"EmailAddress",
	"EmployeeStatus",
	"DepartmentCode",
	"DepartmentName",
	"JobFamilyCode",
	"JobFamilyName",
	"JobSubFamilyCode",
	"JobSubFamilyName",
	"JobTitleShort",
	"JobRoleGroup",
	"JobCode",
	"JobTitle",
	"LoginId",
	"SiteId",
	"SiteLBC",
	"SiteName",
	"CountryISO3",
	"CountryName",
	"RegionCode",
	"RegionName",
	"CompanyCode",
	"CompanyName",
	"PlantCode",
	"PlantName",
	"WorkDate",
	"CensusDate",
	"LoginStatus",
	"WorkDateEarliest"
) as
SELECT		
			"HEXKeyEmployees",
            a."EmployeeNumber",
			a."EmployeeName",
			a."EmployeeFullName",
			a."EmailAddress",     
			 IFNULL(a."EmployeeStatus",'XXXXX') AS "EmployeeStatus",  
			a."DepartmentCode",
			a."DepartmentName",
			a."JobFamilyCode",
			a."JobFamilyName",
			a."JobSubFamilyCode",
			a."JobSubFamilyName",
			a."JobTitleShort",
			a."JobRoleGroup",
			a."JobCode",
			a."JobTitle",
			a."LoginId",
			a."SiteId",
			a."SiteLBC",
			a."SiteName",
			a."CountryISO3",
			a."CountryName",
			a."RegionCode",
			a."RegionName",
			a."CompanyCode",
			a."CompanyName",
			a."PlantCode",
			a."PlantName",
			a."WorkDate",
			a."CensusDate",
			a."LoginStatus",
            IFNULL(C."WorkDateEarliest",'1900-01-01') "WorkDateEarliest" 
FROM		FDA."RUNU_DimEmployee" a
			INNER JOIN (
				SELECT		"EmployeeNumber",
							MAX("WorkDate") "WorkDateLatest"
				FROM		FDA."RUNU_DimEmployee" 
				GROUP BY	"EmployeeNumber"
				)b	ON	a."EmployeeNumber" = b."EmployeeNumber"
					AND a."WorkDate" = b."WorkDateLatest"
			LEFT OUTER JOIN (
				SELECT		"EmployeeNumber",
							MIN("WorkDate") "WorkDateEarliest"	
				FROM		FDA."RUNU_DimEmployee" 
				WHERE "WorkDate" > '19000103'
				GROUP BY	"EmployeeNumber"
				)	C	ON	a."EmployeeNumber" = c."EmployeeNumber"
WHERE		a."EmployeeNumber" IS NOT NULL AND a."EmployeeNumber" != ''		
UNION ALL	
SELECT		 "HEXKeyEmployees",
            a."EmployeeNumber",
			a."EmployeeName",
			a."EmployeeFullName",
			a."EmailAddress",     
			 IFNULL(a."EmployeeStatus",'XXXXX') AS "EmployeeStatus",  
			a."DepartmentCode",
			a."DepartmentName",
			a."JobFamilyCode",
			a."JobFamilyName",
			a."JobSubFamilyCode",
			a."JobSubFamilyName",
			a."JobTitleShort",
			a."JobRoleGroup",
			a."JobCode",
			a."JobTitle",
			a."LoginId",
			a."SiteId",
			a."SiteLBC",
			a."SiteName",
			a."CountryISO3",
			a."CountryName",
			a."RegionCode",
			a."RegionName",
			a."CompanyCode",
			a."CompanyName",
			a."PlantCode",
			a."PlantName",
			a."WorkDate",
			a."CensusDate",
			a."LoginStatus",
			c."WorkDateEarliest"
FROM		FDA."RUNU_DimEmployee" a
			INNER JOIN (
				SELECT		"LoginId",
							MAX("WorkDate") "WorkDateLatest"
				FROM		FDA."RUNU_DimEmployee" 
				GROUP BY	"LoginId"
				)		b	ON	a."LoginId" = b."LoginId"
							AND a."WorkDate" = b."WorkDateLatest"
			LEFT OUTER JOIN (
				SELECT		"EmployeeNumber",
							MIN("WorkDate") "WorkDateEarliest"
				FROM		FDA."RUNU_DimEmployee" 
				GROUP BY	"EmployeeNumber"
				) c	ON	a."EmployeeNumber" = c."EmployeeNumber"
WHERE		a."EmployeeNumber" IS NULL OR a."EmployeeNumber" = '';
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "FDA"."RUNU_Proc_DimBudgetCategory"("PARAM" VARCHAR(100), "IN_MODE" VARCHAR(100))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
COMMENT='Create Date: 2023-04-17  Author: Performalytic Team'
EXECUTE AS CALLER
AS '
BEGIN
IF(IN_MODE = ''FULL'')
THEN
BEGIN
   TRUNCATE TABLE FDA."RUNU_DimBudgetCategory";

    INSERT INTO FDA."RUNU_DimBudgetCategory"
 (
     "HEXKeyBudgetCategory"
    ,"Pillar"
    ,"Category"
    ,"BudgetCategory"
 )

 SELECT
     sha2(CONCAT(ifnull("Pillar",''0''),''-'',ifnull("Category",''0'')))
    ,"Pillar"
    ,"Category"
    ,"BudgetCategory"
 FROM  FDA."RUNU_StgTransFromMDSBudgetCategory";
END;

ELSE 
BEGIN

merge into FDA."RUNU_DimBudgetCategory" target
    using FDA."RUNU_StgTransFromMDSBudgetCategory" source
    on (CONCAT(target."Pillar",''-'',target."Category")) = (CONCAT(source."Pillar",''-'',source."Category"))

    when matched
	then
	    update set
				 target."BudgetCategory"  = source."BudgetCategory"

	when not matched
	then
	insert
(
     "HEXKeyBudgetCategory"
    ,"Pillar"
    ,"Category"
    ,"BudgetCategory"
)
values
    (
     sha2(CONCAT(ifnull(source."Pillar",''0''),''-'',ifnull(source."Category",''0'')))
    ,"Pillar"
    ,"Category"
    ,"BudgetCategory"
     );
       
END;
END IF;
    RETURN ''Succeeded'';
END;
';
-----------------------------------------------------------------------------
