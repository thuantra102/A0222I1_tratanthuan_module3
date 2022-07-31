USE QuanLySinhVien;

SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

SELECT S.StudentId,S.StudentName, AVG(M.mark) as average
FROM Student S join Mark M on S.StudentId = M.StudentId
group by s.studentid
having average > 9;

SELECT S.StudentId,S.StudentName, AVG(M.mark) as average
FROM Student S join Mark M on S.StudentId = M.StudentId
group by s.studentid
having average >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
