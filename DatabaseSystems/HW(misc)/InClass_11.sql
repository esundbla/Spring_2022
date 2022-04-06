CREATE DATABASE music;
\c music
CREATE TABLE Albums ( id SERIAL PRIMARY KEY, title VARCHAR NOT NULL, artist VARCHAR NOT NULL, year INT NOT NULL ); CREATE TABLE Tracks ( id INT NOT NULL, num INT NOT NULL, name VARCHAR(30) NOT NULL, PRIMARY KEY (id, num), FOREIGN KEY (id) REFERENCES Albums (id) );CREATE TABLE Albums ( id SERIAL PRIMARY KEY, title VARCHAR NOT NULL, artist VARCHAR NOT NULL, year INT NOT NULL ); CREATE TABLE Tracks ( id INT NOT NULL, num INT NOT NULL, name VARCHAR(30) NOT NULL, PRIMARY KEY (id, num), FOREIGN KEY (id) REFERENCES Albums (id) );

CREATE TABLE Tracks ( id INT NOT NULL, num INT NOT NULL, name VARCHAR(30) NOT NULL, PRIMARY KEY (id, num), FOREIGN KEY (id) REFERENCES Albums (id) );

CREATE FUNCTION check_year (year INT) RETURNS INT
    LANGUAGE plpgsql
    AS $$
        BEGIN
            IF year >= 1950 THEN
                RETURN year;
            ELSE
                RAISE EXCEPTION 'Invalid Year';
            END IF;
        END;
    $$;

INSERT INTO Albums (title, artist, year) VALUES ('Roots', 'Sepultura', check_year(1925));

INSERT INTO Albums (title, artist, year) VALUES ('Roots', 'Sepultura', check_year(1996)); INSERT INTO Albums (title, artist, year) VALUES ('Morbid Visions', 'Sepultura', check_year(1986));

INSERT INTO Tracks VALUES (2, 1, 'Roots Bloody Roots');
INSERT INTO Tracks VALUES (2, 2, 'Attitude'); INSERT INTO Tracks VALUES (2, 3, 'Ratamahatta'); INSERT INTO Tracks VALUES (3, 1, 'Morbid Visions'); INSERT INTO Tracks VALUES (3, 2, 'Mayhem');

CREATE FUNCTION number_albums (album VARCHAR(25)) RETURNS INT
    LANGUAGE plpgsql
    AS $$
    BEGIN
       RETURN COUNT(*) FROM Albums A WHERE A.artist = album LIMIT 1;
    END;
    $$;  

DROP FUNCTION number_albums;

--not working
CREATE FUNCTION album_number_tracks (album VARCHAR(20)) RETURNS INT
    LANGUAGE plpgsql
    AS $$
    BEGIN
        RETURN year, title, COUNT(*) FROM Albums INNER JOIN Tracks ON Albums.id = Tracks.id GROUP BY (title, year);
    END;
    $$;

SELECT year, title, COUNT(*) FROM Albums INNER JOIN Tracks ON Albums.id = Tracks.id GROUP BY (title, year);

DROP FUNCTION album_number_tracks;

SELECT * FROM albums_number_tracks('Sepultura');