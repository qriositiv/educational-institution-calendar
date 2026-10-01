USE school_calendar;

-- Stable IDs make the function checks deterministic.
START TRANSACTION;

INSERT INTO Teacher (teacher_id, first_name, last_name, email, phone) VALUES
    (1, 'Anna', 'Kowalska', 'anna.kowalska@school.test', '+37060000001'),
    (2, 'Jonas', 'Petraitis', 'jonas.petraitis@school.test', '+37060000002'),
    (3, 'Maria', 'Nowak', 'maria.nowak@school.test', '+37060000003'),
    (4, 'Tomas', 'Jankauskas', 'tomas.jankauskas@school.test', '+37060000004'),
    (5, 'Egle', 'Paulauskaite', 'egle.paulauskaite@school.test', '+37060000005'),
    (6, 'Piotr', 'Wisniewski', 'piotr.wisniewski@school.test', '+37060000006');

INSERT INTO `Class` (class_id, grade, letter, class_teacher_id) VALUES
    (1, 5, 'A', 1),
    (2, 6, 'B', 2),
    (3, 7, 'A', 3),
    (4, 8, 'C', 4),
    (5, 9, 'B', 5);

INSERT INTO Student (student_id, first_name, last_name, birth_date, email, class_id) VALUES
    (1, 'Emilia', 'Zielinska', '2015-03-12', 'emilia.zielinska@student.test', 1),
    (2, 'Matas', 'Kazlauskas', '2015-06-21', 'matas.kazlauskas@student.test', 1),
    (3, 'Sofia', 'Jankauskaite', '2015-09-04', 'sofia.jankauskaite@student.test', 1),
    (4, 'Lukas', 'Balciunas', '2014-01-18', 'lukas.balciunas@student.test', 2),
    (5, 'Ona', 'Vaitkute', '2014-11-30', 'ona.vaitkute@student.test', 2),
    (6, 'Antanas', 'Mockus', '2014-07-08', 'antanas.mockus@student.test', 2),
    (7, 'Ieva', 'Stankeviciute', '2013-02-14', 'ieva.stankeviciute@student.test', 3),
    (8, 'Jakub', 'Kaminski', '2013-08-26', 'jakub.kaminski@student.test', 3),
    (9, 'Greta', 'Urboniene', '2012-05-17', 'greta.urboniene@student.test', 4),
    (10, 'Adam', 'Lewandowski', '2011-10-02', 'adam.lewandowski@student.test', 5),
    (11, 'Paulina', 'Dabrowska', '2015-01-27', 'paulina.dabrowska@student.test', 1),
    (12, 'Dominykas', 'Zukauskas', '2015-12-09', 'dominykas.zukauskas@student.test', 1),
    (13, 'Aiste', 'Butkute', '2014-03-22', 'aiste.butkute@student.test', 2),
    (14, 'Michal', 'Wojcik', '2014-09-13', 'michal.wojcik@student.test', 2),
    (15, 'Kamil', 'Kowalczyk', '2013-04-05', 'kamil.kowalczyk@student.test', 3),
    (16, 'Rugile', 'Maciulyte', '2013-06-19', 'rugile.maciulyte@student.test', 3),
    (17, 'Gabija', 'Navickaite', '2013-11-11', 'gabija.navickaite@student.test', 3),
    (18, 'Karol', 'Mazur', '2012-01-23', 'karol.mazur@student.test', 4),
    (19, 'Monika', 'Krawczyk', '2012-03-08', 'monika.krawczyk@student.test', 4),
    (20, 'Nojus', 'Savickas', '2012-07-29', 'nojus.savickas@student.test', 4),
    (21, 'Ugne', 'Ramanauskaite', '2012-12-16', 'ugne.ramanauskaite@student.test', 4),
    (22, 'Julia', 'Piotrowska', '2011-02-10', 'julia.piotrowska@student.test', 5),
    (23, 'Kajus', 'Baranauskas', '2011-04-28', 'kajus.baranauskas@student.test', 5),
    (24, 'Lena', 'Szymanska', '2011-07-15', 'lena.szymanska@student.test', 5),
    (25, 'Tadas', 'Kavaliauskas', '2011-12-03', 'tadas.kavaliauskas@student.test', 5);

INSERT INTO Subject (subject_id, name, description) VALUES
    (1, 'Mathematics', 'Numbers, algebra, and geometry'),
    (2, 'English', 'English language and literature'),
    (3, 'Physics', 'Introductory physical science'),
    (4, 'History', 'Local and world history'),
    (5, 'Art', 'Visual arts and creative practice'),
    (6, 'Informatics', 'Computing and digital literacy');

INSERT INTO Classroom (classroom_id, room_number, capacity, room_type) VALUES
    (1, '101', 30, 'Standard'),
    (2, '102', 2, 'Small study room'),
    (3, 'LAB-1', 20, 'Science laboratory'),
    (4, '201', 25, 'Standard'),
    (5, 'ART-1', 18, 'Art studio'),
    (6, 'IT-1', 24, 'Computer laboratory');

INSERT INTO Teacher_Subject (teacher_id, subject_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);

INSERT INTO Class_Subject (class_id, subject_id, lessons_per_week) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 1),
    (2, 6, 2),
    (3, 3, 2),
    (3, 4, 2),
    (4, 5, 2),
    (5, 6, 3);

INSERT INTO Academic_Calendar (calendar_id, academic_year, start_date, end_date) VALUES
    (1, '2026/2027', '2026-09-01', '2027-06-18'),
    (2, '2025/2026', '2025-09-01', '2026-06-19');

INSERT INTO Teaching_Assignment
    (assignment_id, teacher_id, class_id, subject_id, calendar_id)
VALUES
    (1, 1, 1, 1, 1),
    (2, 2, 1, 2, 1),
    (3, 3, 2, 3, 1),
    (4, 6, 2, 6, 1),
    (5, 3, 3, 3, 1),
    (6, 4, 3, 4, 1),
    (7, 5, 4, 5, 1),
    (8, 6, 5, 6, 1);

INSERT INTO Lesson
    (lesson_id, assignment_id, classroom_id, day_of_week, start_time, end_time)
VALUES
    (1, 1, 1, 1, '09:00:00', '09:45:00'),
    (2, 1, 1, 3, '09:00:00', '09:45:00'),
    (3, 2, 1, 2, '10:00:00', '10:45:00'),
    (4, 3, 3, 1, '09:00:00', '09:45:00'),
    (5, 4, 6, 2, '11:00:00', '11:45:00'),
    (6, 5, 3, 3, '10:00:00', '10:45:00'),
    (7, 6, 4, 4, '11:00:00', '11:45:00'),
    (8, 7, 5, 5, '12:00:00', '12:45:00'),
    (9, 8, 6, 1, '13:00:00', '13:45:00');

INSERT INTO Homework
    (homework_id, assignment_id, title, description, assigned_at, due_at)
VALUES
    (1, 1, 'Fractions worksheet', 'Complete exercises 1-10', '2026-09-07 10:00:00', '2026-09-10 09:00:00'),
    (2, 2, 'Reading exercise', 'Read chapter 2', '2026-09-08 11:00:00', '2026-09-15 10:00:00'),
    (3, 3, 'Motion examples', 'Find three examples of motion', '2026-09-07 10:00:00', '2026-09-14 09:00:00'),
    (4, 4, 'Binary numbers', 'Convert ten decimal values to binary', '2026-09-09 12:00:00', '2026-09-16 11:00:00'),
    (5, 5, 'Forces worksheet', 'Solve the force diagrams', '2026-09-10 11:00:00', '2026-09-17 10:00:00'),
    (6, 6, 'Historical timeline', 'Prepare a timeline of five events', '2026-09-11 12:00:00', '2026-09-18 11:00:00'),
    (7, 7, 'Colour study', 'Create a primary-colour composition', '2026-09-12 13:00:00', '2026-09-19 12:00:00'),
    (8, 8, 'Algorithm steps', 'Describe an everyday task as an algorithm', '2026-09-13 14:00:00', '2026-09-20 13:00:00');

INSERT INTO Assessment
    (assessment_id, assignment_id, title, assessment_type, description, starts_at, ends_at)
VALUES
    (1, 1, 'Fractions quiz', 'Quiz', 'Short fractions quiz', '2026-09-21 09:00:00', '2026-09-21 09:30:00'),
    (2, 2, 'Vocabulary test', 'Test', 'Chapter 2 vocabulary', '2026-09-22 10:00:00', '2026-09-22 10:45:00'),
    (3, 3, 'Motion lab', 'Practical', 'Measure speed and distance', '2026-09-23 09:00:00', '2026-09-23 10:30:00'),
    (4, 4, 'Computing basics', 'Quiz', 'Binary and hardware concepts', '2026-09-24 11:00:00', '2026-09-24 11:30:00'),
    (5, 5, 'Forces test', 'Test', 'Forces and acceleration', '2026-09-25 10:00:00', '2026-09-25 10:45:00'),
    (6, 6, 'History presentation', 'Presentation', 'Present a selected event', '2026-09-28 11:00:00', '2026-09-28 11:45:00'),
    (7, 7, 'Portfolio review', 'Portfolio', 'Review the first art portfolio', '2026-09-29 12:00:00', '2026-09-29 12:45:00'),
    (8, 8, 'Algorithm exercise', 'Practical', 'Design and test an algorithm', '2026-09-30 13:00:00', '2026-09-30 13:45:00');

INSERT INTO Student_Assessment (student_id, assessment_id) VALUES
    (1, 1), (2, 1), (3, 1),
    (1, 2), (2, 2), (3, 2),
    (4, 3), (5, 3),
    (6, 4), (7, 5),
    (11, 1), (12, 1),
    (13, 3), (14, 3),
    (8, 5), (15, 5), (16, 5), (17, 5),
    (9, 7), (18, 7), (19, 7), (20, 7), (21, 7),
    (10, 8), (22, 8), (23, 8), (24, 8), (25, 8);

COMMIT;
