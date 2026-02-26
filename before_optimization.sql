--Select specific race involved in an incident
SELECT *
FROM Instance AS i
WHERE i.ID IN(
    SELECT i.ID
    FROM Instance_Subject AS isub
    JOIN Subject AS s
        ON isub.Subject_ID = s.Subject_ID
    WHERE s.Subject_Race = 'White'
)	
ORDER BY i.Occurred_date_time;

--List all the officers, the incident number, and the type of incident they were involved in
SELECT io.Officer_ID, i.Incident_Num, i.Incident_Type
FROM Instance_Officer AS io
JOIN Instance i
	ON io.ID = i.ID;

--Combine instance subject, instance officer, and instance number
SELECT isu.Subject_ID, io.Officer_ID, io.ID
FROM Instance_Subject AS isu
JOIN Instance_Officer io
	ON isu.ID = io.ID;