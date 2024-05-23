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