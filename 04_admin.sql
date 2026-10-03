-- 04_admin.sql : Part II - Database administration (run as a privileged user, MySQL 8)
USE college;

-- Create user
CREATE USER 'clerk'@'localhost' IDENTIFIED BY 'StrongPass#1';
CREATE USER 'analyst'@'%'       IDENTIFIED BY 'AnotherPass#2';
SELECT User, Host FROM mysql.user;
ALTER USER 'clerk'@'localhost' IDENTIFIED BY 'NewPass#3';
DROP USER IF EXISTS 'analyst'@'%';

-- Create role and grant privileges to it
CREATE ROLE 'reader', 'data_entry', 'course_admin';
GRANT SELECT ON college.* TO 'reader';
GRANT SELECT, INSERT, UPDATE ON college.* TO 'data_entry';
GRANT ALL PRIVILEGES ON college.* TO 'course_admin';
GRANT SELECT (Rollno, Name) ON college.STUDENT TO 'reader';   -- column-level
GRANT 'data_entry' TO 'clerk'@'localhost';
SET DEFAULT ROLE ALL TO 'clerk'@'localhost';
SHOW GRANTS FOR 'clerk'@'localhost' USING 'data_entry';

-- Revoke privileges from a role
REVOKE UPDATE ON college.* FROM 'data_entry';
REVOKE 'data_entry' FROM 'clerk'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'course_admin';
DROP ROLE IF EXISTS 'course_admin';

-- Create index
CREATE INDEX idx_student_name ON STUDENT(Name);
CREATE INDEX idx_course_type  ON COURSE(Coursetype);
CREATE INDEX idx_adm_sid_date ON ADMISSION(SID, Dateofadmission);
-- (COURSE.Cname is already indexed by its UNIQUE constraint, so no extra UNIQUE index is created.)
SHOW INDEX FROM STUDENT;
EXPLAIN SELECT * FROM STUDENT WHERE Name = 'Ankit Sharma';
DROP INDEX idx_student_name ON STUDENT;
