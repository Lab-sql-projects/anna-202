-- Inserting data into Students table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number, enrollment_date)
VALUES (1, 'John', 'Doe', '2000-01-01', 'john.doe@example.com', '123-456-7890', '2022-08-01');

-- Inserting data into Professors table
INSERT INTO Professors (professor_id, first_name, last_name, email, department, hire_date)
VALUES (1, 'Dr. Alice', 'Smith', 'alice.smith@example.com', 'Computer Science', '2010-05-15');

-- Inserting data into Courses table
INSERT INTO Courses (course_id, course_name, department, credits, professor_id)
VALUES (101, 'Intro to Programming', 'Computer Science', 3, 1);

-- Inserting data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade)
VALUES (1, 1, 101, '2022-08-01', 'A');
