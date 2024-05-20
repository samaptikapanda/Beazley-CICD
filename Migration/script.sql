create or replace materialized view "DBO".MATERIALIZED_FLIGHT(
	FLIGHTID,
	FLIGHTNUMBER,
	DEPARTUREDATE,
	DEPARTURECITY,
	DESTINATIONCITY
) as 
SELECT 
    FLIGHTID,
    FLIGHTNUMBER,
    DEPARTUREDATE,
    DEPARTURECITY,
    DESTINATIONCITY
FROM 
    "DBO"."FLIGHT";
-----------------------------------------------------------------------------
