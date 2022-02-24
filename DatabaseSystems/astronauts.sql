-- astronauts database
-- created at: <date>
-- author: <your name>

CREATE DATABASE astronauts;

-- MySQL
--- USE astronauts;
\c astronauts

DROP TABLE IF EXISTS Astronauts;

-- TODO: create table Astronauts
-- MySQL
-- CREATE TABLE Astronauts (
--   id          INTEGER PRIMARY KEY AUTO_INCREMENT,
--   lastName    VARCHAR(20),
--   firstName   VARCHAR(20),
--   suffix      VARCHAR(5),
--   gender      CHAR(1),
--   birth       DATE,
--   city        VARCHAR(20),
--   state       VARCHAR(20),
--   country     VARCHAR(15),
--   status      VARCHAR(10),
--   daysInSpace INTEGER,
--   flights     INTEGER );
CREATE TABLE Astronauts (
  id          SERIAL PRIMARY KEY,
  lastName    VARCHAR(20),
  firstName   VARCHAR(20),
  suffix      VARCHAR(5),
  gender      CHAR(1),
  birth       DATE,
  city        VARCHAR(20),
  state       VARCHAR(20),
  country     VARCHAR(15),
  status      VARCHAR(10),
  daysInSpace INTEGER,
  flights     INTEGER );

-- TODO: populate table Astronauts
-- MySQL
-- LOAD DATA INFILE '/Users/tmota/devel/teach/__22SCS3810_PDS/activities/activity_06_astronauts/astronauts.csv' INTO TABLE Astronauts FIELDS TERMINATED BY ',' IGNORE 1 ROWS (lastName, firstName, suffix, gender, birth, city, state, country, status, daysInSpace, flights);
\COPY Astronauts (lastName,firstName,suffix,gender,birth,city,state,country,status,daysInSpace,flights) FROM '/Users/tmota/devel/teach/__22SCS3810_PDS/activities/activity_06_astronauts/astronauts.csv' DELIMITER ',' CSV HEADER;

-- TODO: a) the total number of astronauts.

-- TODO: b) the total number of American astronauts.

-- TODO: c) the list of nationalities of all astronauts in alphabetical order.

-- TODO: d) all astronaut names ordered by last name (use the format Last Name, First Name, Suffix to display the names).

-- TODO: e) the total number of astronauts by gender.

-- TODO: f) the total number of female astronauts that are still active.

-- TODO: g) the total number of American female astronauts that are still active.

-- TODO: h) the list of all American female astronauts that are still active ordered by last name (use the same name format used in d).

-- TODO: i) the list of Chinese astronauts, displaying only their names and ages (use the same name format used in d).

-- TODO: j) the total number of astronauts by country.

-- TODO: k) the total number of American astronauts per state ordered by the totals in descendent order.

-- TODO: l) the total number of astronauts by statuses (i.e., active or retired).

-- TODO: m) name and age of all non-American astronauts in alphabetical order (use the same name format used in d).

-- TODO: n) the average age of all American astronauts that are still active.
