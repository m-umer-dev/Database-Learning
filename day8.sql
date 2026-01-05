CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name TEXT,
    dep_id INTEGER,
    FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);

CREATE TABLE department (
    dep_id INTEGER PRIMARY KEY,
    dep_name TEXT
);

INSERT INTO student VALUES (1,"Ali",1),(2,"Sara",2),(3,"Umer",1);
INSERT INTO student VALUES (4,"Ahmed",NULL);
INSERT INTO department VALUES (1,"IT"),(2,"HR");

SELECT student.name, department.dep_name
FROM student INNER JOIN department 
on student.dep_id = department.dep_id;

SELECT student.name, department.dep_name
FROM student LEFT JOIN department 
on student.dep_id = department.dep_id;