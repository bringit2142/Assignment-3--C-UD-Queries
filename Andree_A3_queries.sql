USE ischool_v2;

/* Question 1 */
DROP TABLE IF EXISTS courses_copy;
CREATE TABLE courses_copy AS
SELECT *
FROM courses;

DROP TABLE IF EXISTS course_sections_copy;
CREATE TABLE course_sections_copy AS 
SELECT * 
FROM course_sections;

INSERT INTO courses_copy
	(course_id, course_code, course_number, course_description,
		course_syllabus, course_prereq, credits)
    VALUES(83, 'INST', '408M', 'Data Analytics and Decision Making Methods',
		NULL, NULL, 3);
SELECT * 
FROM courses_copy;

INSERT INTO course_sections_copy
	(section_id, section_number, semester, year, meeting_days, start_time, end_time,
		course_id, instructor_id, delivery_id, format_id, location_id)
	VALUES(179, '0101', 'Fall', 2022, 'Th', '15:30:00', '16:45:00', 83, 132466096, 1, 1, 34);
SELECT * 
FROM course_sections_copy;

/*Question 2*/
SET SQL_SAFE_UPDATES = 0;
UPDATE course_sections_copy
	SET delivery_id = 2
    WHERE section_id = 179;
    
SELECT CONCAT(course_code, ' ', course_number) AS course_name, section_id, delivery_type
FROM courses_copy
JOIN course_sections_copy
	USING(course_id)
JOIN delivery
	USING(delivery_id)
WHERE delivery_type = 'Blended Learning'
ORDER BY course_name;


/*Question 3*/
DELETE FROM course_sections_copy
WHERE section_id >= 164 AND section_id <=169;
SELECT * FROM course_sections_copy;


