-- lab4_extras.sql

-- 1. VIEW to hide sensitive columns
CREATE VIEW IF NOT EXISTS StudentPublicInfo AS
SELECT student_id, first_name, last_name, major, status, enrollment_date
FROM Students;

-- 2. INDEX on a commonly used column
CREATE INDEX IF NOT EXISTS idx_student_id ON Enrollments(student_id);

-- 3. TRANSACTION with ROLLBACK
BEGIN TRANSACTION;
INSERT INTO Students VALUES
(4, 'Test', 'Rollback', '2001-10-10', 'rollback@example.com', '555-0000', 'Temp St', 'History', 'active', '2024-01-01');
UPDATE Students SET major = 'Art' WHERE student_id = 4;
ROLLBACK;

-- Check rollback
SELECT * FROM Students WHERE student_id = 4;

-- 4. TRANSACTION with COMMIT
BEGIN TRANSACTION;
INSERT INTO Students VALUES
(5, 'Test', 'Commit', '2001-10-10', 'commit@example.com', '555-0001', 'Temp St', 'Economics', 'active', '2024-01-01');
UPDATE Students SET major = 'Philosophy' WHERE student_id = 5;
COMMIT;

-- Check commit
SELECT * FROM Students WHERE student_id = 5;

-- 5. COMPLEX QUERY: Join, Subquery, WHERE
SELECT s.first_name || ' ' || s.last_name AS student_name,
       c.course_name,
       e.grade_letter
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id FROM Students WHERE status = 'active'
);
