CREATE DATABASE camp; 

\c camp

CREATE TABLE staff (
    email VARCHAR PRIMARY KEY, 
    name VARCHAR NOT NULL, 
    nickname VARCHAR, 
    role VARCHAR
);

INSERT INTO staff VALUES   
    ('aqua@man.com', 'Aqua Man', 'aqua', 'counselor'), 
    ('cat@woman.com', 'Cat Woman', 'catty', 'counselor'), 
    ('green@lantern.com', 'Green Lantern', 'greenny', 'security'), 
    ('drdestiny@gmail.com', 'Dr. Destiny', null, 'manager'), 
    ('wolverine@gmail.com', 'James Howlett', 'wolverine', 'cook');

-- a. 3 points) TODO: create table cabins

CREATE TABLE cabins (
    name VARCHAR(100) PRIMARY KEY,
    capacity int NOT NULL,
    leader VARCHAR(100),
    FOREIGN KEY(leader) REFERENCES staff (email)
);


-- b. 2 points) TODO: populate table cabins with: 'greenland' 
--(capacity of 15, 'aquaman' is the leader) and 'appalachian' 
--(capacity of 23, 'catwoman' is the leader)

INSERT INTO cabins VALUES 
    ('greenland', 15, 'aqua@man.com'),
    ('appalachian', 23, 'cat@woman.com');



-- c. 2 points) TODO: update campers by adding an attribute and 
--a foreign key constraint to represent the relationship between campers and cabins
CREATE TABLE campers (
    id INT PRIMARY KEY, 
    name VARCHAR NOT NULL, 
    dob DATE NOT NULL, 
    gender VARCHAR,
    cabinName VARCHAR,
    FOREIGN KEY (cabinName) REFERENCES cabins (name)
);

INSERT INTO campers VALUES 
    (1, 'Achiles', '2011-01-01', 'male', 'greenland'), 
    (2, 'Apollo', '2011-02-01', 'male', 'greenland'),
    (3, 'Aphrodite', '2011-03-01', 'female', 'appalachian'), 
    (4, 'Isis', '2011-04-01', NULL, 'appalachian');

CREATE TABLE programs (
    name VARCHAR PRIMARY KEY, 
    descr VARCHAR NOT NULL, 
    price DECIMAL(10,2)
);

INSERT INTO programs VALUES 
    ('homestead', 'Our youngest adventurers learn how to make new friends, 
discover self-confidence, and learn independence', 5000), 
    ('outpost', 'Campers experience rewarding trips in the backcountry with the 
guidance and support of counselors', 5500);

-- d. 3 points) TODO: create a table named 'participates' to represent the relationship 
--between campers and programs
CREATE TABLE participates (
    camperID INT,
    programName VARCHAR,
    year INT,
    FOREIGN KEY (camperID) REFERENCES campers (id),
    FOREIGN KEY (programName) REFERENCES programs (name),
    PRIMARY KEY (camperID, programName)
);

-- e. 2 points) TODO: populate table 'participates' making sure that all campers are 
--participating in the 'homestead' program of 2022

INSERT INTO participates VALUES 
    (1, 'homestead', 2022),
    (2, 'homestead', 2022),
    (3, 'homestead', 2022),
    (4, 'homestead', 2022),
    (1, 'outpost', 2022),
    (3, 'outpost', 2022);


CREATE TABLE guardians (
    email VARCHAR PRIMARY KEY, 
    name VARCHAR NOT NULL
);

INSERT INTO guardians VALUES 
    ('peleus@palace.com', 'Peleus'), 
    ('thetis@palace.com', 'Thetis'),
    ('leto@gmail.com', 'Leto'), 
    ('dione@god.com', 'Dione'), 
    ('sky@god.com', 'Sky');

-- f. 3 points) TODO: create a table to represent the relationship between campers and guardians

CREATE TABLE caretakes (
    camperID INT,
    guardianEmail VARCHAR,
    FOREIGN KEY (camperID) REFERENCES campers (id),
    FOREIGN KEY (guardianEmail) REFERENCES guardians (email),
    PRIMARY KEY (camperID, guardianEmail)
);
    

-- g. 3 points) TODO: populate the table making sure that:
-- Peleus and Thetis are both guardians of Achiles
-- Leto is the solo guardian of Apollo
-- Dione is the solo guardian of Aphrodite
-- Sky is the solo guardian of Isis

INSERT INTO caretakes VALUES 
    (1, 'peleus@palace.com'),
    (1, 'thetis@palace.com'),
    (2, 'leto@gmail.com'),
    (3, 'dione@god.com'),
    (4, 'sky@god.com');

SELECT name FROM campers a INNER JOIN participates b on a.id = b.camperID WHERE b.programName = 'homestead' ORDER BY a.name;

SELECT a.name, a.capacity, b.name as Leader FROM cabins a INNER JOIN staff b ON a.leader = b.email ORDER BY a.name;
