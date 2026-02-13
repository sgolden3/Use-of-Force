INSERT INTO Instance (ID, Incident_Num, Incident_Type, Occurred_date_time) VALUES
('2015UOF-0957-1325-4972',  '5995',  'Level 1 - Use of Force', '2015-07-09 04:30:00'),
('2020UOF-1310-1097-23017', '57007', 'Level 2 - Use of Force', '2020-07-19 15:35:00'),
('2016UOF-0045-1113-7096',  '9240',  'Level 1 - Use of Force', '2016-01-08 00:13:00'),
('2015UOF-0072-1204-3004',  '3403',  'Level 2 - Use of Force', '2015-01-19 15:00:00'),
('2022UOF-1269-2902-29489', '69858', 'Level 2 - Use of Force', '2022-11-10 06:29:00'),
('2022UOF-0018-2177-26992', '66481', 'Level 1 - Use of Force', '2022-01-05 16:35:00'),
('2015UOF-1321-1306-5300',  '6366',  'Level 2 - Use of Force', '2015-08-03 15:30:00');

INSERT INTO Location (Precinct, Sector, Beat) VALUES
('East',      'EDWARD',  'E2'),
('West',      'DAVID',   'D2'),
('Southwest', 'FRANK',   'F3'),
('West',      'DAVID',   'D3'),
('East',      'CHARLIE', 'C1'),
('Southwest', 'FRANK',   'J3'),
('North',     'JOHN',    'J3');

INSERT INTO Subject (Subject_ID, Subject_Race, Subject_Gender) VALUES
('4936',  'White',                         'Male'),
('23898', 'Nat Hawaiian/Oth Pac Islander','Male'),
('7048',  'Black or African American',    'Male'),
('2984',  'White',                         'Male'),
('30362', 'White',                         'Female'),
('27869', 'White',                         'Female'),
('5261',  'White',                         'Male');

INSERT INTO Officer (Officer_ID) VALUES
('1735'),
('1672'),
('1732'),
('1634'),
('5708'),
('2173'),
('1615');

INSERT INTO Instance_Officer (ID, Officer_ID) VALUES
('2015UOF-0957-1325-4972',  '1735'),
('2020UOF-1310-1097-23017', '1672'),
('2016UOF-0045-1113-7096',  '1732'),
('2015UOF-0072-1204-3004',  '1634'),
('2022UOF-1269-2902-29489', '5708'),
('2022UOF-0018-2177-26992', '2173'),
('2015UOF-1321-1306-5300',  '1615');

INSERT INTO Instance_Subject (ID, Subject_ID) VALUES
('2015UOF-0957-1325-4972',  '4936'),
('2020UOF-1310-1097-23017', '23898'),
('2016UOF-0045-1113-7096',  '7048'),
('2015UOF-0072-1204-3004',  '2984'),
('2022UOF-1269-2902-29489', '30362'),
('2022UOF-0018-2177-26992', '27869'),
('2015UOF-1321-1306-5300',  '5261');