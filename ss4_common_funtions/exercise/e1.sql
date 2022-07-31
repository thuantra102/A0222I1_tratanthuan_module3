USE quanlysinhvien;

select sub.SubId, sub.SubName, max(sub.credit) as max_credit
from `subject` sub;

select sub.subid, sub.subname , max(m.mark) as max_mark
from `subject` sub join mark m 
on sub.subid = m.SubId;



select s.StudentId, s.StudentName,  avg(m.mark) as `avg` 
from student s join mark m 
using(studentid)
group by s.StudentId
order by s.StudentId desc;

