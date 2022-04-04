--Erik Sundblad 
--Homework 6

--Create temp database
CREATE DATABASE temp;

--Create table Products
CREATE TABLE Products(
    id SERIAL NOT NULL PRIMARY KEY,
    descr VARCHAR(30) NOT NULL,
    price FLOAT NOT NULL,
    cond  VARCHAR(10) NOT NULL DEFAULT ('new')
);

--Create condition set function
CREATE FUNCTION cond_value_set() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
        BEGIN
            IF NEW.cond != 'used' THEN
                NEW.cond = 'new';
            END IF;
            RETURN NEW;
        END;
    $$;


--Create condition trigger
CREATE TRIGGER cond_value
    BEFORE INSERT ON Products
    FOR EACH ROW
    EXECUTE PROCEDURE cond_value_set();

--Inserts
INSERT INTO Products (descr, price, cond) VALUES ('Ninja Sword', 250, 'new');
INSERT INTO Products (descr, price) VALUES ('Dummy', 50);
INSERT INTO Products (descr, price, cond) VALUES ('Fake Blood', 5, 'used');
INSERT INTO Products (descr, price, cond) VALUES ('Rubber Ducky', 1, 'used');
INSERT INTO Products (descr, price, cond) VALUES ('Bathtub Soap', 3, 'used once');
INSERT INTO Products (descr, price) VALUES ('Brazilian Coffee', 5);
INSERT INTO Products (descr, price, cond) VALUES ('Running Shoes', 50, 'fair');

--Show the table
SELECT * FROM Products;