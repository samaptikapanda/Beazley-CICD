create or replace TABLE "DBO"."DimJobTask_V1" (
	"JobItemId" NUMBER(38,0) NOT NULL,
	"JobTaskId" NUMBER(38,0),
	"ProductionTaskId" NUMBER(38,0),
	"JobTaskDescription" VARCHAR(100),
	"JobTaskStatus" VARCHAR(15),
	"JobTaskStatusDateTime" DATE,
	"IsJobTaskNeedingApproval" BOOLEAN,
	"JobTaskCompletedDateTime" DATE,
	"JobTaskOperatorLoginId" NUMBER(38,0),
	"EstimatedDuration" NUMBER(19,4),
	"IsJobTaskQC" BOOLEAN,
	"JobTaskQCStatusFromTaskHistory" VARCHAR(50),
	"JobTaskQCStatusDateTimeFromTaskHistory" DATE,
	"JobTaskQCOperatorLoginIdFromTaskHistory" NUMBER(38,0),
	"TaskCategoryForPlanning" VARCHAR(100),
	"JobTaskStatusFromTaskHistory" VARCHAR(50),
	"JobTaskStatusDateTimeFromTaskHistory" DATE,
	"JobTaskOperatorLoginIdFromTaskHistory" NUMBER(38,0),
	"ProductionTaskGroup" VARCHAR(3),
	"LastUpdatedDate" DATE,
	constraint DIMJOBTASK_V1__UN unique ("JobTaskId", "ProductionTaskId"),
	constraint DIMJOBTASK_V1__PK primary key ("JobItemId")
);