create Database UnivercitiesDB;
use UnivercitiesDB;

CREATE TABLE UNIVERSITY (
  universityId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  uniname varchar(50) NOT NULL,
  city varchar(50) NOT NULL
);

INSERT INTO UNIVERSITY (uniname, city) VALUES 
('LNU', 'Luhansk'),
('VNU', 'Vinnitsa'),
('KNAD', 'Kharkov');

CREATE TABLE Faculties (
  facultiesId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  facname varchar(50) NOT NULL,
  universityId integer,
  FOREIGN KEY (universityId) REFERENCES UNIVERSITY (universityId)
);

INSERT INTO Faculties (facname, universityId) VALUES 
('Markting', '0002'),
('Computer Science', '0002'),
('Cyber Security', '0001'),
('AI', '0003');

CREATE TABLE Groups (
  groupId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  gropnumber integer NOT NULL,
  facultiesId integer,
  FOREIGN KEY (facultiesId) REFERENCES Faculties (facultiesId)
);

INSERT INTO GROUPS ( gropnumber,  facultiesId) VALUES 
('101', '0002'),
('102', '0002'),
('202', '0003'),
('301', '0002'),
('304', '0001'),
('401', '0003'),
('501', '0002');

SELECT * FROM GROUPS;

CREATE TABLE Students (
  studentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  studname varchar(50),
  surname varchar(50),
  age integer,
  groupId integer,
  FOREIGN KEY (groupId) REFERENCES GROUPS (groupId)
);

INSERT INTO Students (studname, surname, age, groupId) VALUES 
('Ivan', 'Ivasuk', '17', '0002'),
('Dima', 'Kreinof', '18', '0007'),
('Olena', 'Lesnoi', '17', '0003'),
('Igor', 'Peperechko', '21', '0002'),
('Luda', 'Luskiv', '20', '0001');


SELECT * FROM UNIVERSITY;
SELECT * FROM Faculties;
SELECT * FROM Students;


SELECT studname, surname FROM Students;
SELECT * FROM Students WHERE sudname = 'Ivan';
SELECT * FROM GROUPS WHERE groupnamber > '299';


SELECT phone, address FROM USER WHERE name = 'Muzik';
SELECT name FROM USER WHERE name = '%a';
SELECT * FROM ORDER WHERE sum > 2000;
SELECT Count (Id) as TotalOrders FROM ORDER;
SELECT  SUM (sum) as Income FROM ORDER;
SELECT name FROM Workers Where profession = 'QA Tester' Order BY hireDate;
SELECT TOP 5 name FROM Workers Where profession = 'QA Tester' Order BY hireDate DESC;


SELECT * FROM students JOIN groups ON students.id = groups.id
SELECT * FROM students LEFT JOIN groups ON students.id = groups.id
SELECT * FROM students RIGHT JOIN groups ON students.id = groups.id


SELECT * FROM students LEFT JOIN groups ON students.id = groups.id
UNION ALL
SELECT * FROM students RIGHT JOIN groups ON students.id = groups.id WHERE students.id
