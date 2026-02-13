CREATE TABLE Location (
	Precinct TEXT,
	Sector TEXT,
	Beat TEXT,
	PRIMARY KEY (Precinct, Sector, Beat)
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

CREATE TABLE Instance_Officer (
   ID TEXT NOT NULL,
   Officer_ID TEXT NOT NULL,
   PRIMARY KEY (ID, Officer_ID),
   FOREIGN KEY (ID) REFERENCES Instance(ID),
   FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID)
);

CREATE TABLE Instance_Subject (
   ID TEXT NOT NULL,
  Subject_ID TEXT NOT NULL,
   PRIMARY KEY (ID, Subject_ID),
   FOREIGN KEY (ID) REFERENCES Instance(ID),
   FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);