create or replace TRANSIENT TABLE "DBO"."Countries_Population_2026" (
	"country_id" NUMBER(38,0) NOT NULL,
	"country_name" VARCHAR(255),
	"state_name" VARCHAR(255),
	"district_name" VARCHAR(255),
	"country_population_in_millions" NUMBER(38,0),
	"state_population_in_millions" NUMBER(38,0),
	"district_population_in_millions" NUMBER(38,0),
	"population_year" DATE,
	"literacy_rate" NUMBER(5,2),
	"country_currency" VARCHAR(50),
	primary key ("country_id"),
	foreign key ("country_id") references DBO."Countries_Population_2025"(country_id)
);