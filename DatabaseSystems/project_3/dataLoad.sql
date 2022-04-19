--Data Load SQL for project 3
--Erik Sundblad

--Make the Database
--CREATE DATABASE careers;

--Move to DB
--\c careers

--Table Creation
CREATE TABLE Interests (
    abr VARCHAR(30) PRIMARY KEY,
    descr VARCHAR(200)
);

CREATE TABLE Students (
    email VARCHAR(30) PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    major VARCHAR(20),
    graduation VARCHAR(40) NOT NULL
);

CREATE TABLE StudentInterests (
    email VARCHAR(30),
    abr VARCHAR(30),
    PRIMARY KEY (email, abr),
    FOREIGN KEY (email) REFERENCES Students(email),
    FOREIGN Key (abr) REFERENCES Interests(abr)
);

CREATE TABLE Employers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    size INT,
    location VARCHAR(200),
    forprofit BOOLEAN,
    govern BOOLEAN 
);

CREATE TABLE EmployersInterests (
    id INT,
    abr VARCHAR(200),
    PRIMARY KEY (id, abr),
    FOREIGN KEY (id) REFERENCES Employers(id),
    FOREIGN KEY (abr) REFERENCES Interests(abr)
);

--Load Data
INSERT INTO Interests(abr, descr) VALUES 
    ('android', 'Android Development' ),
    ('app', 'Mobile App Development'),
    ('aws', 'Amazon Web Services'),
    ('cloud', 'Cloud Computing'),
    ('cyber', 'Cyber Security'),
    ('db', 'Databases'),
    ('dba', 'Database Administrator'),
    ('edu', 'Education'),
    ('java', 'Java'),
    ('kotlin', 'Kotlin'),
    ('mysql', 'MySQL'),
    ('postgres', 'Postgresql'),
    ('python', 'Python'),
    ('software', 'Software Development'),
    ('sql', 'SQL'),
    ('web', 'Web Development');

INSERT INTO Students(email, name, major, graduation) VALUES 
    ('eastmanv@msudenver.edu', 'Virginia Eastman', 'cs', 'Spring 2022'),
    ('gilbertb@msudenver.edu', 'Barbara Gilber', 'cs', 'Fall 2023'),
    ('zachariasr@msudenver.edu', 'Robert Zacharias', 'cs', 'Spring 2023');

INSERT INTO StudentInterests(email, abr) VALUES 
    ('eastmanv@msudenver.edu', 'cloud'),
    ('eastmanv@msudenver.edu', 'db'),
    ('eastmanv@msudenver.edu', 'java'),
    ('eastmanv@msudenver.edu', 'mysql'),
    ('eastmanv@msudenver.edu', 'sql'),
    ('gilbertb@msudenver.edu', 'db'),
    ('gilbertb@msudenver.edu', 'python'),
    ('gilbertb@msudenver.edu', 'sql'),
    ('zachariasr@msudenver.edu', 'cloud'),
    ('zachariasr@msudenver.edu', 'edu'),
    ('zachariasr@msudenver.edu', 'web');

INSERT INTO Employers(id, name, size, location, forprofit, govern) VALUES
    (101, 'Wonka Inustries', 350, 'Lakewood, CO', TRUE, FALSE),
    (202, 'Cheers Agency', 1000, 'Denver, CO', FALSE, TRUE),
    (303, 'Dominate the world', 5, 'Golden, CO', TRUE, FALSE),
    (404, 'Stingers Org', 212, 'Denver, CO', FALSE, FALSE),
    (505, 'Easy Peasy', 1, 'Littleton, CO', TRUE, FALSE);

INSERT INTO EmployersInterests(id, abr) VALUES
    (101, 'db'),
    (101, 'dba'),
    (101, 'java'),
    (101, 'mysql'),
    (101, 'postgres'),
    (101, 'sql'),
    (202, 'aws'),
    (202, 'cloud'),
    (202, 'python'),
    (202, 'sql'),
    (303, 'cloud'),
    (303, 'cyber'),
    (303, 'java'),
    (303, 'web'),
    (404, 'postgres'),
    (404, 'python'),
    (404, 'sql'),
    (505, 'java');
