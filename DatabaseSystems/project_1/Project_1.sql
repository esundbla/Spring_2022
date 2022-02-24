--Author Erik Sundblad
--Project 1

-- TODO: create the courses database
CREATE DATABASE courses;
-- TODO: "open" the database for use
\c courses
-- TODO: (optional) drop all tables

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
    prefix VARCHAR(3) PRIMARY KEY,
    number CHAR(4) PRIMARY KEY,
    title VARCHAR(20),
    description VARCHAR(300),
    credits INT,
    prereqs VARCHAR(400) --can be null
    ); 
-- TODO: create table sections
CREATE TABLE Sections(
    crn INT PRIMARY KEY,
    prefix VARCHAR(3) RELATES Courses.prefix,
    number CHAR(4) RELATES Course.number,
    section CHAR(3),
    semester VARCHAR(20),
    year INT,
    instructor VARCHAR(50) RELATES Instructors.email,
    times VARCHAR(12), --can be null
    start DATE, --can be null
    end Date, --can be null
    location VARCHAR(20), --can be null
    campus VARCHAR(20) --can be null
    ); 
-- TODO: manually insert a few instructors

-- TODO: manually insert a few courses

-- TODO: manually insert a few sections

-- TODO: the total number of courses (name the count as "total")

-- TODO: a list of all courses prefix, number, and title, sorted by prefix and then number

-- TODO: an alphabetical list of all instructors in the database

-- TODO: the prefix, number, section, and (course) title of all courses sections in the database, sorted by prefix, number and section

-- TODO: the prefix, number, the number of sections (named as "sections"), and (course) title of all courses sections in the database, sorted by prefix and number

-- TODO: an alphabetical list of the instructors that are teaching CS 1050 or CS 2050 (must avoid showing names repeated)

-- TODO: show an alphabetical list of instructors followed by the number of sections (named as "sections") that they are teaching, sorted in descending order of "sections"

-- TODO: same as before, but limit the output to the top 3 instructors based on the number of sections that they are teaching

-- TODO: show an alphabetical list of the instructor(s) that are NOT currently teaching a section this semester 

-- TODO: show the sections (with the instructor assigned to them) of CS 1050 that are being offered in the spring (2022) on TR 10:00am-11:50am

