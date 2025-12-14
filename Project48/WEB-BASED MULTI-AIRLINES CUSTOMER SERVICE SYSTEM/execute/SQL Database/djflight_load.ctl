LOAD DATA
INTO TABLE ALLIANCE.FLIGHT
REPLACE
FIELDS TERMINATED BY ','
(flightid,
dept_airport,
dept_time,
arr_airport,
arr_time,
aircraft,
duration,
a_first,
a_business,
a_economy,
c_first,
c_business,
c_economy,
mile,
isnextday )