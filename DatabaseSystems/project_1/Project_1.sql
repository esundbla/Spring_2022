--Author Erik Sundblad
--Project 1

-- TODO: create the courses database
CREATE DATABASE courses;
-- TODO: "open" the database for use
\c courses
-- TODO: (optional) drop all tables
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Sections;
-- TODO: create table instructors
CREATE TABLE Instructors(
    email VARCHAR(50) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    title VARCHAR(20), --can be null
    office VARCHAR(20), --can be null
    hours VARCHAR(20) --can be null
    );
-- TODO: create table courses
CREATE TABLE Courses(
    prefix VARCHAR(3) NOT NULL ,
    number CHAR(4) NOT NULL,
    title VARCHAR(200)NOT NULL ,
    description VARCHAR(300) NOT NULL,
    credits INT NOT NULL,
    prereqs VARCHAR(400), --can be null
    PRIMARY KEY (prefix, number)
    ); 
-- TODO: create table sections
CREATE TABLE Sections(
    crn INT PRIMARY KEY,
    prefix VARCHAR(3),
    number VARCHAR(4),
    FOREIGN KEY (prefix, number) REFERENCES Courses (prefix, number),
    section CHAR(3),
    semester VARCHAR(20),
    year INT,
    instructor VARCHAR(50),
    FOREIGN KEY (instructor) REFERENCES Instructors (email),
    times VARCHAR(30), --can be null
    start DATE, --can be null
    "end" DATE, --can be null
    location VARCHAR(20), --can be null
    campus VARCHAR(20) --can be null
    ); 
-- TODO: manually insert a few instructors
INSERT INTO Instructors (email, name, title, office, hours) VALUES 
    ('cohenbohen@msudenver.edu', 'Blanche Cohen', 'Professor', 'AES285', 'M 08:00AM-09:30AM'),
    ('fzeng@msudenver.edu', 'Fanyu Zeng', 'Afiliate', NULL, 'TR 01:00PM-03:30PM'),
    ('aibrahi8@msudenver.edu', 'Adil Ibrahim', 'Professor', 'AES285', 'MWF 12:00PM-02:30AM'),
    ('rranjidh@msudenver.edu', 'Rajan Ranjidha', 'Doctor', 'AES280', 'TR 03:00PM-05:00PM'),
    ('fjiang@msudenver.edu', 'Jiang Feng', 'Doctor', 'AES280', 'TR 08:00AM-10:00AM'),
    ('tle61@msudenver.edu', 'ThienNgo Le', 'Professor', NULL, 'MW 04:00PM-06:00PM'),
    ('wzhu1@msudnver.edu', 'Weiying Zhu', 'Doctor', NULL, NULL),
    ('codd@msudenver.edu', 'Edgar Codd', 'instructor', NULL, NULL);


-- TODO: manually insert a few courses
INSERT INTO Courses (prefix, number, title, description, credits, prereqs) VALUES
    ('CS', '1030', 'Computer Science Principals', 'Introduce students to the cental ideas of computing', 4, NULL),
    ('CS', '1050', 'Computer Scinece 1', 'Basic programing skills', 4, 'CS 1030 or MTH 1110'),
    ('CS', '1400', 'Computer Organization 1', 'Into to computer architecture', 4, NULL),
    ('CS', '2050', 'Computer Science 2', 'Data Structures', 4, 'CS 1050'),
    ('CS', '2400', 'Computer Organization 2', 'Assembly Language prgraming', 4, 'CS 1400, CS 1050'),
    ('CS', '2240', 'Discrete Structures for CS', 'theoretical math foundation', 4, 'CS2400, MTH 1400'),
    ('PHY', '1105', 'Physics 1', 'Newtonian Physics', 3, 'MTH 1400');


-- TODO: manually insert a few sections
INSERT INTO Sections (crn, prefix, number, section, semester, year, instructor, times, start, "end", location, campus) VALUES
    (31998, 'CS', '1030', '001', 'spring', 2022, 'cohenbohen@msudenver.edu', 'TR 12:00PM-01:50PM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (31999, 'CS', '1030', '002', 'spring', 2022, 'cohenbohen@msudenver.edu', 'MW 10:00AM-11:50AM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (32000, 'CS', '1030', '003', 'spring', 2022, 'cohenbohen@msudenver.edu', 'MW 04:00PM-05:50PM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (32380, 'CS', '1030', '004', 'spring', 2022, 'fzeng@msudenver.edu', 'TR 06:00PM-07:50PM', '2022-01-15', '2022-05-14', NULL, 'online'),
    (30640, 'CS', '1050', '001', 'spring', 2022, 'aibrahi8@msudenver.edu', 'MW 10:00AM-11:50AM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (30641, 'CS', '1050', '002', 'spring', 2022, 'rranjidh@msudenver.edu', 'MW 12:00PM-01:50PM', '2022-01-15', '2022-05-14', 'AES 220', 'main'),
    (30783, 'CS', '1050', '004', 'spring', 2022, 'fzeng@msudenver.edu', 'MW 06:00PM-07:50PM', '2022-01-15', '2022-05-14', NULL, 'online'),
    (34662, 'CS', '1050', '005', 'spring', 2022, 'cohenbohen@msudenver.edu', 'TR 10:00AM-11:50AM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (31296, 'CS', '1400', '001', 'spring', 2022, 'fjiang@msudenver.edu', 'TR 12:00PM-01:50PM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (34663, 'CS', '1400', '003', 'spring', 2022, 'rranjidh@msudenver.edu', 'MW 04:00PM-05:50PM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (30643, 'CS', '2050', '001', 'spring', 2022, 'aibrahi8@msudenver.edu', 'TR 02:00PM-03:50PM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (30644, 'CS', '2050', '002', 'spring', 2022, 'tle61@msudenver.edu', 'MW 06:00PM-07:50PM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (34664, 'CS', '2050', '003', 'spring', 2022, 'aibrahi8@msudenver.edu', 'MW 02:00PM-03:50PM', '2022-01-15', '2022-05-14', 'AES 285', 'main'),
    (34665, 'CS', '2240', '003', 'spring', 2022, 'tle61@msudenver.edu', 'TR 02:00PM-03:50PM', '2022-01-15', '2022-05-14', 'SSB 207', 'main'),
    (30645, 'CS', '2400', '001', 'spring', 2022, 'rranjidh@msudenver.edu', 'TR 04:00PM-05:50PM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (31107, 'CS', '2400', '002', 'spring', 2022, 'wzhu1@msudnver.edu', 'MW 10:00AM-11:50AM', '2022-01-15', '2022-05-14', 'AES 210', 'main'),
    (33651, 'PHY', '1105', '004', 'spring', 2022, 'wzhu1@msudnver.edu', 'MWF 3:00AM-04:50AM', '2022-01-15', '2022-05-14', 'SCI 214', 'main');
    

-- TODO: the total number of courses (name the count as "total")
 SELECT COUNT(*) AS Total  FROM courses;
-- TODO: a list of all courses prefix, number, and title, sorted by prefix and then number
 SELECT prefix, number, title FROM courses ORDER BY prefix;
-- TODO: an alphabetical list of all instructors in the database
 SELECT name FROM Instructors ORDER BY name;
-- TODO: the prefix, number, section, and (course) title of all courses sections in the database, sorted by prefix, number and section
 SELECT A.prefix, A.number, B.section, A.title FROM Courses A INNER JOIN Sections B ON A.number = B.number ORDER BY A.prefix;
-- TODO: the prefix, number, the number of sections (named as "sections"), and (course) title of all courses sections in the database, sorted by prefix and number
 SELECT A.prefix, A.number, COUNT(*) AS sections, A.title  FROM Courses A INNER JOIN Sections B ON A.number = B.number GROUP BY (A.number, A.prefix) ORDER BY A.prefix;  
-- TODO: an alphabetical list of the instructors that are teaching CS 1050 or CS 2050 (must avoid showing names repeated)
 SELECT DISTINCT A.name as Instructor FROM Instructors A LEFT JOIN sections B ON A.email = B.instructor WHERE B.number = '1050' OR B.number = '2050' ORDER BY A.name;
-- TODO: show an alphabetical list of instructors followed by the number of sections (named as "sections") that they are teaching, sorted in descending order of "sections"
 SELECT A.name, COUNT(*) AS sections FROM Instructors A INNER JOIN sections B ON A.email = B.instructor GROUP BY A.name ORDER BY sections DESC;
-- TODO: same as before, but limit the output to the top 3 instructors based on the number of sections that they are teaching
 SELECT A.name, COUNT(*) AS sections FROM Instructors A INNER JOIN sections B ON A.email = B.instructor GROUP BY A.name ORDER BY sections DESC LIMIT 3;
-- TODO: show an alphabetical list of the instructor(s) that are NOT currently teaching a section this semester 
 SELECT A.name FROM Instructors A LEFT JOIN Sections B ON A.email = B.instructor where B.crn IS NULL ORDER BY A.name; 
-- TODO: show the sections (with the instructor assigned to them) of CS 1050 that are being offered in the spring (2022) on TR 10:00am-11:50am
 SELECT A.prefix, A.number, A.section, B.name FROM Sections A INNER JOIN Instructors B ON A.instructor = B.email WHERE A.number = '1050' and A.semester = 'spring' and A.year = 2022 and A.times = 'TR 10:00AM-11:50AM';
