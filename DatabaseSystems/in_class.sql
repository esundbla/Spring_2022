--VIEWS PRACTICE

CREATE TABLE Movies(
    title VARCHAR(30) NOT NULL,
    year INT NOT NULL,
    length INT,
    studio VARCHAR(30) NOT NULL
);

INSERT INTO Movies(title, year, length, studio) VALUES 
    ('Roxanne', 1987, 107, 'Columbia'),
    ('Spider man', 2002, 183, 'Marvel'),
    ('Toy Story', 1995, 81, 'Pixar');

CREATE VIEW PixarMovies AS
    SELECT title, year, studio FROM Movies WHERE studio = 'Pixar';

SELECT * FROM PixarMovies;

INSERT INTO PixarMovies VALUES ('Brave', 2012, 'Pixar');
