CREATE TABLE practice.student(
	id int,
    name varchar(50),
    address varchar(50),
    email varchar(50),
    avg float
);
DROP TABLE practice.student;
CREATE TABLE practice.student2 as 
SELECT id, name, avg 
FROM practice.student;
ALTER TABLE practice.student 
ADD sex varchar(20), ADD dob DATE;
ALTER TABLE practice.student
DROP COLUMN sex;
ALTER TABLE practice.student 
MODIFY COLUMN  email varchar(60);
ALTER TABLE practice.student 
CHANGE  email EMAIL varchar(60);