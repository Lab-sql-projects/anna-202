-- lab4_schema.sql

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Professors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Enrollments;

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth_date TEXT,
    email TEXT UNIQUE,
    phone TEXT,
    address TEXT,
    major TEXT,
    status TEXT,
    enrollment_date TEXT
);

CREATE TABLE Professors (
    professor_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department TEXT,
    email TEXT UNIQUE
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INTEGER,
    professor_id INTEGER,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

CREATE TABLE Enrollments (
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT,
    grade_letter TEXT CHECK (grade_letter IN ('A', 'B', 'C', 'D', 'F')),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample Students
INSERT INTO Students VALUES
(1, 'Alice', 'Johnson', '2000-05-10', 'alice@example.com', '555-1111', '123 Main St', 'CS', 'active', '2022-08-15'),
(2, 'Bob', 'Smith', '1999-07-22', 'bob@example.com', '555-2222', '456 Maple Rd', 'Math', 'active', '2022-08-15'),
(3, 'Carol', 'Lee', '2001-09-30', 'carol@example.com', '555-3333', '789 Oak Ave', 'Physics', 'inactive', '2021-08-15');

-- Insert sample Professors
INSERT INTO Professors VALUES
(1, 'Dr.', 'Brown', 'CS', 'brown@university.edu'),
(2, 'Dr.', 'Green', 'Math', 'green@university.edu');

-- Insert sample Courses
INSERT INTO Courses VALUES
(101, 'Algorithms', 3, 1),
(102, 'Calculus', 4, 2);

-- Insert sample Enrollments
INSERT INTO Enrollments VALUES
(1, 101, '90', 'A'),
(2, 102, '80', 'B'),
(3, 101, '70', 'C');
