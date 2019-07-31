--Data Engineering
--Drop any existing tables
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS depts;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;

--create a new schema for new tables
create schema ph_emp;

--create tables for with primary key and foreign keys
--import csv files (data) into corresponding tables
CREATE TABLE ph_emp.employee (
emp_no int not null primary key,
birth_date date not null,
first_name varchar(100) not null,
last_name varchar(100) not null,
gender char(1) not null,
hire_date date not null
);


CREATE TABLE ph_emp.depts(
dept_no varchar(50) not null primary key,
dept_name varchar(50) not null
);

CREATE TABLE ph_emp.dept_manager(
dept_no varchar(50) not null references ph_emp.depts(dept_no),
emp_no int not null references ph_emp.employee(emp_no),
from_date date not null,
to_date date not null
);


CREATE TABLE ph_emp.dept_emp(
emp_no int not null references ph_emp.employee(emp_no),
dept_no varchar(50) not null references ph_emp.depts(dept_no),	
from_date date not null,
to_date date not null
);

CREATE TABLE ph_emp.salary(
emp_no int not null references ph_emp.employee(emp_no) ,
salary numeric not null,
from_date date not null,
to_date date not null
);


CREATE TABLE ph_emp.title (
emp_no int not null references ph_emp.employee(emp_no),
title varchar(100) not null,
from_date date not null,
to_date date not null
);

--Run query for ERD creation
SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');



--Run queries to test data importation for accuracy
SELECT emp_no, birth_date FROM ph_emp.employee
SELECT COUNT (*) FROM ph_emp.employee
--30024

SELECT * FROM ph_emp.depts

SELECT * FROM ph_emp.dept_manager

SELECT * FROM ph_emp.salary
SELECT COUNT (*) from ph_emp.salary
--300024

SELECT COUNT (*) FROM ph_emp.title
--443308

SELECT * FROM ph_emp.title

