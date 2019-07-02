# 1.查询同时存在1课程和2课程的情况
select DISTINCT * from student where id in (SELECT studentId as id from student_course where 
courseId=1 and studentId in (SELECT studentId from student_course where 
courseId=2)) ;

# 2.查询同时存在1课程和2课程的情况
select DISTINCT * from student where id in (SELECT studentId as id from student_course where 
courseId=1 and studentId in (SELECT studentId from student_course where 
courseId=2)) ;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT s.id, s.NAME, AVG(sc.score) from student as s LEFT JOIN student_course as sc on s.id=sc.studentId 
GROUP BY sc.studentId HAVING AVG(sc.score)>=60;



# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT DISTINCT id,NAME,age,sex from student where id not in (
	select DISTINCT studentId from student_course
);

# 5.查询所有有成绩的SQL
SELECT DISTINCT s.id,s.NAME,s.age,s.sex,sc.score from student as s LEFT JOIN student_course as sc
	on s.id=sc.studentId where sc.score is not NULL;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select DISTINCT id,name,age,sex from student where id in (SELECT studentId as id from student_course where 
courseId=1 and studentId in (SELECT studentId from student_course where 
courseId=2)) ;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT  DISTINCT id,name,age,sex from student where id in (
	select studentId from student_course where courseId=1 and score<60 ORDER BY score desc
);

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId,c.`name`,avg(score) from student_course sc LEFT JOIN course c on sc.courseId=c.id GROUP BY courseId ORDER BY AVG(score) DESC, courseId; 

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT DISTINCT s.name as student_name,c.name as course_name,sc.score from student as s LEFT JOIN 
	(student_course as sc LEFT JOIN course as c on c.id= sc.courseId) on s.id=sc.studentId 
	where c.`name`='数学' and sc.score<60;



