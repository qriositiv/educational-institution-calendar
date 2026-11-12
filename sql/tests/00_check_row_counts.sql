USE school_calendar;

-- Verify the exact composition of the deterministic demonstration dataset.
SELECT
    table_name,
    expected_count,
    actual_count,
    IF(actual_count = expected_count, 'PASS', 'FAIL') AS result
FROM (
    SELECT 'Teacher' AS table_name, 6 AS expected_count, COUNT(*) AS actual_count FROM Teacher
    UNION ALL SELECT 'Class', 5, COUNT(*) FROM `Class`
    UNION ALL SELECT 'Student', 25, COUNT(*) FROM Student
    UNION ALL SELECT 'Subject', 6, COUNT(*) FROM Subject
    UNION ALL SELECT 'Classroom', 6, COUNT(*) FROM Classroom
    UNION ALL SELECT 'Teacher_Subject', 6, COUNT(*) FROM Teacher_Subject
    UNION ALL SELECT 'Class_Subject', 8, COUNT(*) FROM Class_Subject
    UNION ALL SELECT 'Academic_Calendar', 2, COUNT(*) FROM Academic_Calendar
    UNION ALL SELECT 'Teaching_Assignment', 8, COUNT(*) FROM Teaching_Assignment
    UNION ALL SELECT 'Lesson', 9, COUNT(*) FROM Lesson
    UNION ALL SELECT 'Homework', 8, COUNT(*) FROM Homework
    UNION ALL SELECT 'Assessment', 8, COUNT(*) FROM Assessment
    UNION ALL SELECT 'Student_Assessment', 28, COUNT(*) FROM Student_Assessment
) AS table_counts;

