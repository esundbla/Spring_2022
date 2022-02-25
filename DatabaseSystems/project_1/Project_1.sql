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
    name VARCHAR(30),
    title VARCHAR(20), --can be null
    office VARCHAR(20), --can be null
    hours VARCHAR(20) --can be null
    );
-- TODO: create table courses
CREATE TABLE Courses(
    prefix VARCHAR(3) UNIQUE NOT NULL,
    number CHAR(4) UNIQUE NOT NULL,
    title VARCHAR(20),
    description VARCHAR(300),
    credits INT,
    prereqs VARCHAR(400) --can be null
    ); 
-- TODO: create table sections
CREATE TABLE Sections(
    crn INT PRIMARY KEY,
    prefix VARCHAR(3),
    FOREIGN KEY (prefix) REFERENCES Courses (prefix),
    number VARCHAR(4),
    FOREIGN KEY (number) REFERENCES Courses (number),
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
    ('danbrown@csu.edu', 'Dan Brown', 'Doctor', 'SCI255', 'M 08:00AM-09:30AM'),
    ('JoeRamos@csu.edu', 'Joe Ramos', 'Professor', 'CYB100', 'TR 01:00PM-03:30PM'),
    ('sarahRamos@csu.edu', 'Sarah Ramos', 'Doctor', 'BIO115', 'MWF 12:00PM-02:30AM');

-- TODO: manually insert a few courses
INSERT INTO Courses (prefix, number, title, description, credits, prereqs) VALUES
    ('BIO', '2125', 'Plant bio', 'Plant Biology two', '3', 'BIO 112'),
    ('CYB', '1005', 'Cyber intro', 'Intro to cyber security', '4', null),
    ('PHY', '1105', 'Physics 1', 'Newtonian Physics', '3', 'Calc I');


-- TODO: manually insert a few sections
INSERT INTO Sections (crn, prefix, number, section, semester, year, instructor, times, start, "end", location, campus) VALUES
    (311190, 'BIO', '2125', '002', 'spring', 2022, 'sarahRamos@csu.edu', 'MWF 08:00AM-09:30AM', '2022-01-15', '2022-05-18', 'BIO 214', 'main'),
    (471191, 'CYB', '1005', '001', 'spring', 2022, 'JoeRamos@csu.edu', 'TR 10:00AM-11:50AM', '2022-01-15', '2022-05-18', null, 'online'),
    (336514, 'PHY', '1105', '004', 'spring', 2022, 'sarahRamos@csu.edu', 'MWF 3:00AM-04:50AM', '2022-01-15', '2022-05-18', 'SCI 214', 'main');
    

-- TODO: the total number of courses (name the count as "total")
 SELECT COUNT(*) AS Total  FROM courses;
-- TODO: a list of all courses prefix, number, and title, sorted by prefix and then number
 SELECT prefix, number, title FROM courses ORDER BY prefix;
-- TODO: an alphabetical list of all instructors in the database
 SELECT name FROM Instructors ORDER BY name;
-- TODO: the prefix, number, section, and (course) title of all courses sections in the database, sorted by prefix, number and section
 SELECT A.prefix, A.number, A.number, B.section FROM Courses A, Sections B WHERE A.prefix = B.prefix ORDER BY A.prefix;
-- TODO: the prefix, number, the number of sections (named as "sections"), and (course) title of all courses sections in the database, sorted by prefix and number

-- TODO: an alphabetical list of the instructors that are teaching CS 1050 or CS 2050 (must avoid showing names repeated)

-- TODO: show an alphabetical list of instructors followed by the number of sections (named as "sections") that they are teaching, sorted in descending order of "sections"

-- TODO: same as before, but limit the output to the top 3 instructors based on the number of sections that they are teaching

-- TODO: show an alphabetical list of the instructor(s) that are NOT currently teaching a section this semester 

-- TODO: show the sections (with the instructor assigned to them) of CS 1050 that are being offered in the spring (2022) on TR 10:00am-11:50am

