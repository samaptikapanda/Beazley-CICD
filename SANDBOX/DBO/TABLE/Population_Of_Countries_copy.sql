create or replace TABLE "DBO"."Population_Of_Countries_copy" (
	"country_id" NUMBER(38,0),
	"country_name" VARCHAR(255),
	"state_name" VARCHAR(255),
	"district_name" VARCHAR(255),
	"country_population_in_millions" NUMBER(38,0),
	"state_population_in_millions" NUMBER(38,0),
	"district_population_in_millions" NUMBER(38,0),
	"population_year" DATE,
	"literacy_rate" NUMBER(5,2),
	"country_currency" VARCHAR(50),
	"unique_number" NUMBER(38,0)
);