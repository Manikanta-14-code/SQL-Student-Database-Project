/* -----------------------------------------------------
   STUDENT DATABASE PROJECT
   Description: SQL project demonstrating basic queries,
   joins, and database relationships.
----------------------------------------------------- */

-------------------------------------------------------
--create database
-------------------------------------------------------
create database student_db;

-- -----------------------------------------------------
-- USE DATABASE
-- -----------------------------------------------------

USE student_db;

-- -----------------------------------------------------
-- CREATE TABLES
-- -----------------------------------------------------

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(50),
    city VARCHAR(50)
);

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration INT
);

-- Subjects Table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Enrollments Table
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Marks Table
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- -----------------------------------------------------
-- INSERT DATA INTO TABLES
-- -----------------------------------------------------

-- Students Data
INSERT INTO students VALUES
(1,'Ravi','Male','Hyderabad'),
(2,'Sita','Female','Vijayawada'),
(3,'Arjun','Male','Guntur'),
(4,'Priya','Female','Visakhapatnam'),
(5,'Kiran','Male','Tirupati');

-- Courses Data
INSERT INTO courses VALUES
(101,'Computer Science',36),
(102,'Electronics',36),
(103,'Mechanical',48);

-- Subjects Data
INSERT INTO subjects VALUES
(201,'Database Management',101),
(202,'Data Structures',101),
(203,'Digital Electronics',102),
(204,'Microprocessors',102),
(205,'Thermodynamics',103);

-- Enrollments Data
INSERT INTO enrollments VALUES
(1,1,101),
(2,2,101),
(3,3,102),
(4,4,103),
(5,5,101);

-- Marks Data
INSERT INTO marks VALUES
(1,1,201,85),
(2,1,202,78),
(3,2,201,90),
(4,3,203,70),
(5,4,205,88),
(6,5,202,76);

-- -----------------------------------------------------
-- BASIC SELECT QUERIES
-- -----------------------------------------------------

-- 1. Display all students
SELECT * FROM students;

-- 2. Display all courses
SELECT * FROM courses;

-- 3. Display all subjects
SELECT * FROM subjects;

-- 4. Display all enrollments
SELECT * FROM enrollments;

-- 5. Display all marks
SELECT * FROM marks;

-- -----------------------------------------------------
-- FILTERING QUERIES
-- -----------------------------------------------------

-- 6. Display student name and city
SELECT name, city FROM students;

-- 7. Show all female students
SELECT * FROM students
WHERE gender = 'Female';

-- 8. Display students who live in Hyderabad
SELECT * FROM students
WHERE city = 'Hyderabad';

-- 9. Display course name and duration
SELECT course_name, duration
FROM courses;

-- 10. Show all subject names
SELECT subject_name
FROM subjects;

-- 11. Students whose name starts with 'R'
SELECT *
FROM students
WHERE name LIKE 'R%';

-- 12. Students whose city ends with 'am'
SELECT *
FROM students
WHERE city LIKE '%am';

-- 13. Courses with duration greater than 36 months
SELECT course_name, duration
FROM courses
WHERE duration > 36;

-- 14. Display students in alphabetical order
SELECT *
FROM students
ORDER BY name ASC;

-- -----------------------------------------------------
-- JOIN QUERIES
-- -----------------------------------------------------

-- 15. Student name and their course IDs
SELECT s.name, e.course_id
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;

-- 16. Student name and course name
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id;

-- 17. Subjects with their course names
SELECT s.subject_name, c.course_name
FROM subjects s
JOIN courses c
ON s.course_id = c.course_id;

-- 18. Student name and marks
SELECT s.name, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id;

-- 19. Students who scored more than 80 marks
SELECT s.student_id, s.name, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.marks > 80;

-- 20. Student name, subject name, and marks
SELECT s.name, sub.subject_name, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;

-- 21. All subjects of course_id 101
SELECT s.subject_name, c.course_id
FROM subjects s
JOIN courses c
ON s.course_id = c.course_id
WHERE c.course_id = 101;

-- 22. Students enrolled in course_id 101
SELECT s.name, e.course_id
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.course_id = 101;

-- 23. Student name, city, and marks
SELECT s.name, s.city, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id;

-- 24. Student names and subjects studied
SELECT s.name, sub.subject_name
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;
