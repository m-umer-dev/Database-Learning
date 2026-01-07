SELECT name from student WHERE dep_id NOT IN (
select dep_id FROM department
);