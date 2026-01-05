CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name Text,
    age INTEGER,
    marks INTEGER
);

INSERT INTO student VALUES (1,"Ali",22,80),(2,"Sara",21,75),(3,"Umer",22,85),(4,"Hina",21,78),(5,"Bilal",22,70);

SELECT age FROM student GROUP BY age;
SELECT age, COUNT(*) FROM student GROUP BY age;
SELECT age, AVG(marks) FROM student GROUP BY age;

SELECT age, COUNT(*) FROM student GROUP BY age HAVING count(*) > 1;