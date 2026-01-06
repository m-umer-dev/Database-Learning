SELECT student.name
FROM student
JOIN department
ON student.dep_id = department.dep_id
WHERE department.dep_name = 'HR';


SELECT student.name
FROM student
LEFT JOIN department
ON student.dep_id = department.dep_id
WHERE department.dep_id IS NULL;