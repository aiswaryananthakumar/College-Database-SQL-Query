CREATE DATABASE CollegeDataBase;
USE CollegeDataBase;

CREATE TABLE student (student_id BIGINT NOT NULL PRIMARY KEY,student_name VARCHAR(30),department VARCHAR(30));

SHOW CREATE TABLE student;

INSERT INTO student (student_id, student_name, department) VALUES
(101, 'Aiswarya', 'CSE'),
(102, 'Vani', 'EEE'),
(103, 'Akshaya', 'IT'),
(104, 'Sneha', 'MECH'),
(105, 'Sunitha', 'CIVIL'),
(106, 'Sakthi', 'ECE');

SELECT * FROM student;

CREATE TABLE staff (staff_id BIGINT NOT NULL PRIMARY KEY,staff_name VARCHAR(30),staff_department VARCHAR(30));

SHOW CREATE TABLE staff;

INSERT INTO staff (staff_id, staff_name, staff_department) VALUES
(1, 'Dr. Suresh', 'CSE'),
(2, 'Ms. Radhika', 'EEE'),
(3, 'Prof. Karthi', 'IT'),
(4, 'Mr. Ashok', 'MECH'),
(5, 'Dr. Nisha', 'CIVIL');

SELECT * FROM staff;

ALTER TABLE student ADD COLUMN staff_id BIGINT;
ALTER TABLE student ADD CONSTRAINT staff_fk FOREIGN KEY (staff_id) REFERENCES staff(staff_id);

UPDATE student SET staff_id = 1 WHERE department = 'CSE';
UPDATE student SET staff_id = 2 WHERE department = 'EEE';
UPDATE student SET staff_id = 3 WHERE department = 'IT';
UPDATE student SET staff_id = 4 WHERE department = 'MECH';
UPDATE student SET staff_id = 5 WHERE department = 'CIVIL';

CREATE TABLE student2 (student_id BIGINT NOT NULL PRIMARY KEY,student_name VARCHAR(30),department VARCHAR(30));

INSERT INTO student2 (student_id, student_name, department) VALUES
(107, 'Kiran', 'AIDS'),
(108, 'Harshita', 'MECH');

SELECT * FROM student2;

SELECT student.student_id, student.student_name, student.department, 
       student2.student_id AS student2_id, student2.student_name AS student2_name
FROM student
LEFT JOIN student2 ON student.department = student2.department;

SELECT student.student_id, student.student_name, student.department, 
       student2.student_id AS student2_id, student2.student_name AS student2_name
FROM student
RIGHT JOIN student2 ON student.department = student2.department;

SELECT student_id, student_name, department FROM student
UNION
SELECT student_id, student_name, department FROM student2;

SAVEPOINT sp1;

UPDATE student SET student_name = 'Rohan' WHERE student_id = 101;

SAVEPOINT sp2;

UPDATE student SET student_name = 'Arjun' WHERE student_id = 102;

ROLLBACK TO sp1;

START TRANSACTION;

UPDATE student SET student_name = 'Rohan' WHERE student_id = 101;

ROLLBACK;

SELECT * FROM student WHERE student_id IN (101, 102);

COMMIT;

SELECT * FROM student;

SELECT * FROM staff;

SELECT * FROM student2;

SHOW CREATE TABLE student;
SHOW CREATE TABLE staff;
SHOW CREATE TABLE student2;
