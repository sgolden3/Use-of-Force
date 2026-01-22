CREATE TABLE Location (
	Precinct TEXT PRIMARY KEY,
	Sector TEXT,
	Beat TEXT
);

CREATE TABLE Instance (
	ID TEXT PRIMARY KEY,
	Incident_Num TEXT,
	Incident_Type TEXT,
	Occurred_date_time DATETIME
);

CREATE TABLE Subject (
	Subject_ID TEXT PRIMARY KEY,
	Subject_Race TEXT,
	Subject_Gender
);

CREATE TABLE Officer (
	Officer_ID TEXT PRIMARY KEY
);
	