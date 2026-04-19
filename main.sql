CREATE TABLE Person (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE Student (
  id INT PRIMARY KEY,
  person_id INT,
  faculty VARCHAR(255),
  department VARCHAR(255),
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Teacher (
  id INT PRIMARY KEY,
  person_id INT,
  faculty VARCHAR(255),
  department VARCHAR(255),
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Lecturer (
  id INT PRIMARY KEY,
  teacher_id INT,
  subject VARCHAR(255),
  FOREIGN KEY (teacher_id) REFERENCES Teacher(id)
);

CREATE TABLE Professor (
  id INT PRIMARY KEY,
  teacher_id INT,
  subject VARCHAR(255),
  FOREIGN KEY (teacher_id) REFERENCES Teacher(id)
);

CREATE TABLE Course (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  credit INT,
  lecturer_id INT,
  professor_id INT,
  FOREIGN KEY (lecturer_id) REFERENCES Lecturer(id),
  FOREIGN KEY (professor_id) REFERENCES Professor(id)
);

CREATE TABLE Enrollment (
  id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id) REFERENCES Student(id),
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

CREATE TABLE Grade (
  id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  grade VARCHAR(255),
  FOREIGN KEY (student_id) REFERENCES Student(id),
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

INSERT INTO Person (id, name, email) VALUES (1, 'John Doe', 'john@example.com');
INSERT INTO Person (id, name, email) VALUES (2, 'Jane Doe', 'jane@example.com');
INSERT INTO Person (id, name, email) VALUES (3, 'Bob Smith', 'bob@example.com');

INSERT INTO Student (id, person_id, faculty, department) VALUES (1, 1, 'Engineering', 'Computer Science');
INSERT INTO Student (id, person_id, faculty, department) VALUES (2, 2, 'Arts', 'English');

INSERT INTO Teacher (id, person_id, faculty, department) VALUES (1, 3, 'Engineering', 'Computer Science');

INSERT INTO Lecturer (id, teacher_id, subject) VALUES (1, 1, 'Programming');
INSERT INTO Professor (id, teacher_id, subject) VALUES (1, 1, 'Data Structures');

INSERT INTO Course (id, name, credit, lecturer_id, professor_id) VALUES (1, 'Introduction to Programming', 3, 1, 1);

INSERT INTO Enrollment (id, student_id, course_id) VALUES (1, 1, 1);
INSERT INTO Enrollment (id, student_id, course_id) VALUES (2, 2, 1);

INSERT INTO Grade (id, student_id, course_id, grade) VALUES (1, 1, 1, 'A');
INSERT INTO Grade (id, student_id, course_id, grade) VALUES (2, 2, 1, 'B');