SELECT *
FROM Location;

SELECT *
FROM Location
WHERE Precinct = 'East';

SELECT *
FROM Instance
ORDER BY Occurred_date_time;

SELECT DISTINCT Subject_ID
FROM Subject
ORDER BY Subject_ID DESC;

SELECT *
FROM Location
LIMIT 2
OFFSET 0;