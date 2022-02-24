-- occupations database
-- created at: 2/22/2022
-- author: Erik Sundblad

CREATE DATABASE occupations;

\c occupations

DROP TABLE IF EXISTS Occupations;

-- TODO: create table Occupations
CREATE TABLE OCCUPATIONS(
	Code VARCHAR(30) PRIMARY KEY,
	Occupation VARCHAR(300),
	JobFamily VARCHAR(300));
-- TODO: populate table Occupations
	\COPY occupations (code, occupation, jobfamily) FROM 'C:\Users\13039\Documents\GitHub\Spring_2022\DatabaseSystems\hwk_05_occupations\occupations.csv' DELIMITER ',' CSV HEADER;
-- TODO: a) the total number of occupations (expect 1016).
	SELECT COUNT(*) FROM occupations;
-- TODO: b) a list of all job families in alphabetical order (expect 23).
	SELECT DISTINCT jobfamily FROM occupations ORDER BY jobfamily;
-- TODO: c) the total number of job families (expect 23)
	SELECT COUNT(DISTINCT(jobfamily)) FROM occupations;
-- TODO: d) the total number of occupations per job family in alphabetical order of job family.
	SELECT jobfamily, COUNT(*) FROM occupations GROUP BY jobfamily ORDER BY jobfamily;
-- TODO: e) the number of occupations in the "Computer and Mathematical" job family (expect 38)
	SELECT COUNT(*) FROM occupations WHERE jobfamily = 'Computer and Mathematical';
-- TODO: f) an alphabetical list of occupations in the "Computer and Mathematical" job family.
	 SELECT occupation FROM occupations WHERE jobfamily = 'Computer and Mathematical' ORDER BY occupation;
-- TODO: g) an alphabetical list of occupations in the "Computer and Mathematical" job family that begins with the word "Database"
	SELECT occupation FROM occupations WHERE jobfamily = 'Computer and Mathematical' and occupation LIKE 'Database %' ORDER BY occupation;
