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