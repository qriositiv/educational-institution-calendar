-- Run this file from the repository root.
-- MySQL 9+ requires --commands to process nested source commands in batch mode.
-- Example: mysql --commands -u root -p < sql/run_all.sql

source sql/00_database.sql;
source sql/tables/01_teacher.sql;
source sql/tables/02_class.sql;
source sql/tables/03_student.sql;
source sql/tables/04_subject.sql;
source sql/tables/05_classroom.sql;
source sql/tables/06_teacher_subject.sql;
source sql/tables/07_class_subject.sql;
source sql/tables/08_academic_calendar.sql;
source sql/tables/09_teaching_assignment.sql;
source sql/tables/10_lesson.sql;
source sql/tables/11_homework.sql;
source sql/tables/12_assessment.sql;
source sql/tables/13_student_assessment.sql;
source sql/functions/06_get_classroom_free_capacity.sql;
source sql/functions/07_is_classroom_large_enough.sql;
source sql/functions/08_is_teacher_available.sql;
source sql/functions/09_is_class_available.sql;
source sql/procedures/01_get_class_overview.sql;
source sql/procedures/02_check_classroom_capacity.sql;
source sql/procedures/03_check_schedule_slot.sql;
source sql/triggers/01_before_lesson_insert.sql;
source sql/triggers/02_before_lesson_update.sql;
source sql/triggers/03_before_student_assessment_insert.sql;
