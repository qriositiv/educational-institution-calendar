USE school_calendar;

-- 8. Academic Calendar
CREATE TABLE Academic_Calendar (
    calendar_id INT AUTO_INCREMENT PRIMARY KEY,
    academic_year VARCHAR(20) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    CONSTRAINT chk_calendar_dates
        CHECK (end_date > start_date)
);

