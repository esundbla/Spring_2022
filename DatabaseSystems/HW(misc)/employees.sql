-- employees database
-- created at: <date>
-- author: <your name>

-- TODO: create database employees
CREATE DATABASE employees;
-- TODO: create table departments
Create Table departments( code char(2) primary key , description varchar(100));
-- TODO: populate table departments
INSERT INTO departments (code, description) VALUES ('HR', 'Human resources');
-- TODO: create table employees
CREATE TABLE employees ( id serial primary key, name char(30), salary int, deptCode char(2));
-- TODO: populate table Employees
INSERT INTO employees (name, salary, deptCode) VALUES (('Sam Mai Tai', 50000, 'HR'));
 ('Sam Mai Tai', 50000, 'HR'),
 ('James Brandy', 55000, 'HR'),
 ('Whisky Stauss', 60000, 'HR'),
 ('Romeo Curacau', 65000, 'IT'),
 ('Jose Caipirinha', 65000, 'IT'),
 ('Tony Gin and Tonic', 80000, 'SL'));
-- TODO: a) list all rows in Departments.
SELECT * FROM departments;
-- TODO: b) list only the codes in Departments.
SELECT DISTINCT code FROM Departments;
-- TODO: c) list all rows in Employees.
SELECT * FROM employees;
-- TODO: d) list only the names in Employees in alphabetical order.
SELECT name FROM employees ORDER BY name;
-- TODO: e) list only the names and salaries in Employees, from the highest to the lowest salary.
SELECT name, salary FROM employees ORDER BY salary;
-- TODO: f) list the cartesian product of Employees and Departments.
SELECT * FROM departments NATURAL JOIN employees;
-- TODO: g) do the natural join of Employees and Departments; the result should be exactly the same as the cartesian product; do you know why?
SELECT * FROM departments NATURAL JOIN employees;
-- TODO: i) do an equi join of Employees and Departments matching the rows by Employees.deptCode and Departments.code (hint: use JOIN and the ON clause).
SELECT * FROM departments JOIN employees ON departments.code = employees.deptCode;
-- TODO: j) same as previous query but project name and salary of the employees plus the description of their departments.

-- TODO: k) same as previous query but only the employees that earn less than 60000.

-- TODO: l) same as query ‘i’  but only the employees that earn more than ‘Jose Caipirinha’.

-- TODO: m) list the left outer join of Employees and Departments (use the ON clause to match by department code); how does the result of this query differs from query ‘i’?

-- TODO: n) from query ‘m’, how would you do the left anti-join?

-- TODO: o) show the number of employees per department.

-- TODO: p) same as query ‘o’ but I want to see the description of each department (not just their codes).
