USE quanlysinhvien;
SELECT * 
FROM student s 
WHERE s.StudentName like 'h%';

SELECT * 
FROM class c 
WHERE MONTH(c.StartDate) = 12;

SELECT * 
FROM subject sub
WHERE sub.Credit > 3 and sub.Credit <= 5;

UPDATE student set ClassId = '2' where StudentName  = 'HUNG'; 
select * 
from student s;

select s.StudentName,sub.SubName,  m.Mark 
from student s join mark m on s.StudentId = m.StudentId
join `subject` sub on m.SubId = sub.SubId
order by m.Mark desc , s.StudentName asc;








