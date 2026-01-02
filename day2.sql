CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name Text,
    age INTEGER
);

CREATE TABLE course (
    course_id INTEGER PRIMARY KEY,
    course_name Text
);

CREATE TABLE enrollment (
    enroll_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO student VALUES (1,"Ali",26),(2,"Zesshan",29);
INSERT INTO course VALUES (1,"Database"),(2,"AI");
INSERT INTO enrollment VALUES (1,1,1),(2,2,2);

SELECT * FROM student;
SELECT * FROM enrollment;