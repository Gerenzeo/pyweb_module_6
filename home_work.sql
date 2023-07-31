-- TABLE GROUPS
CREATE TABLE IF NOT EXISTS [groups] (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	name STRING UNIQUE NOT NULL
);
-- TABLE STUDENTS
CREATE TABLE IF NOT EXISTS students (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	group_id REFERENCES [groups] (id)
);
-- TABLE TEACHERS
CREATE TABLE IF NOT EXISTS teachers (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50)	
);
-- TABLE DISCIPLINES
CREATE TABLE IF NOT EXISTS disciplines (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	name VARCHAR(50) UNIQUE,
	teacher_id REFERENCES teachers (id)
);
-- TABLE GRADES
CREATE TABLE IF NOT EXISTS grades (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	discipline_id REFERENCES disciplines (id),
	student_id REFERENCES students (id),
	grade INTEGER,
	date_of DATE
)