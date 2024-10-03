CREATE DATABASE UNI;

USE UNI;

CREATE TABLE STUDENT(
	student_id int primary key,
	Name varchar(30),
	department varchar(20),
	mark_1 int,
	mark_2 int
);

INSERT INTO STUDENT(student_id,Name,department,mark_1,mark_2) VALUES
(101, 'Joseph', 'CS', 9, 8),
(136, 'Heisenberg', 'CHEMISTRY', 10, 10),
(166, 'karl', 'DOT', 6, 8),
(122, 'Lana', 'CS', 9, 9),
(156, 'Justin', 'PSRT', 9, 6);


CREATE TABLE hostel_details(
	std_id int primary key,
	stud_name varchar(30),
	block char,
	room_no int
);

INSERT INTO hostel_details (std_id, stud_name, block, room_no) VALUES
(101, 'Joseph', 'A', 22),
(102, 'Monica', 'C', 19),
(136, 'Heisenberg', 'D', 65),
(166, 'karl', 'B', 12),
(122, 'Lana', 'B', 88),
(156, 'Justin', 'A', 21);


--displaying both student and hostel_details table
SELECT * FROM STUDENT;
SELECT * FROM hostel_details;

--renaming hostel_details to hostel
ALTER TABLE hostel_details RENAME TO hostel;