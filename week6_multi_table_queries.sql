-- Shows each level 2 incident with officer and subject details
SELECT 
    i.ID, 
    i.Incident_Type, 
    i.Occurred_date_time, 
    o.Officer_ID, 
    s.Subject_ID, 
    s.Subject_Race, 
    s.Subject_Gender
FROM Instance i
INNER JOIN Instance_Officer io 
    ON i.ID = io.ID
INNER JOIN Officer o 
    ON io.Officer_ID = o.Officer_ID
INNER JOIN Instance_Subject isub 
    ON i.ID = isub.ID
INNER JOIN Subject s 
    ON isub.Subject_ID = s.Subject_ID
WHERE i.Incident_Type = 'Level 2 - Use of Force'
ORDER BY i.Occurred_date_time;

-- Shows all incidents, including missing officer or subject
SELECT i.ID, i.Incident_Type, o.Officer_ID, s.Subject_ID
FROM Instance i
LEFT JOIN Instance_Officer io
	ON i.ID = io.ID
LEFT JOIN Officer o
	on io.Officer_ID = o.Officer_ID
LEFT JOIN Instance_Subject isub
	on i.ID = isub.ID
LEFT JOIN Subject s
	on isub.Subject_ID = s.Subject_ID
ORDER BY i.ID;

-- Count incidents number by subject race
SELECT  s.Subject_Race, COUNT(*) *1
FROM  Instance i
INNER JOIN Instance_Subject isub
	ON i.ID = isub.ID
INNER JOIN Subject s
	ON isub.Subject_ID = s.Subject_ID
GROUP BY s.Subject_Race
ORDER BY COUNT(*)