-- 1. INNER JOIN Query: Get student names and the courses they are enrolled in
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- 2. LEFT JOIN Query: Get all professors and the courses they teach
SELECT p.first_name, p.last_name, c.course_name
FROM Professors p
LEFT JOIN Courses c ON p.professor_id = c.professor_id;

-- 3. UPDATE Query: Update the grade for a specific student in a course
UPDATE Enrollments
SET grade = 'A'
WHERE student_id = 1 AND course_id = 101;

-- 4. DELETE Query: Delete enrollments where students have failed (grade 'F')
DELETE FROM Enrollments
WHERE grade = 'F';

-- 5. Aggregation Query: Get the average grade count by course, only for courses with more than 3 students enrolled
SELECT c.course_name, COUNT(e.student_id) AS student_count, AVG(CASE WHEN e.grade = 'A' THEN 1 ELSE 0 END) AS avg_A_grade
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 3;

-- 6. Subquery: Get the names of students who have enrolled in courses taught by the top professor with the most courses
SELECT s.first_name, s.last_name
FROM Students s
WHERE s.student_id IN (
    SELECT e.student_id
    FROM Enrollments e
    JOIN Courses c ON e.course_id = c.course_id
    WHERE c.professor_id = (
        SELECT professor_id
        FROM Courses
        GROUP BY professor_id
        ORDER BY COUNT(course_id) DESC
        LIMIT 1
    )
);
