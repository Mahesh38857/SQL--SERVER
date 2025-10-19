use DB7AM

create table student
(
sid tinyint,
sname varchar(10),
s1 tinyint,
s2 tinyint,
s3 tinyint
)

insert into student values(1,'A',80,90,70),
(2,'B',30,60,40),
(3,'C',60,20,30),
(4,'D',10,20,30)

select*from student

# List of Student Passed
select * from student 
where s1>35 and s2>35 and s3>35

--list of students who are failed ?
SELECT *
 FROM student
 WHERE s1<35 OR  s2<35  OR s3<35 

 --list of students who are failed exactly in 1 subject ?
     SELECT *
     FROM student
     WHERE  (s1<35 AND  s2>=35 AND s3>=35)
                     OR
                     (s1>=35  AND s2<35 AND s3>=35)
                     OR
                     (s1>=35 AND s2>=35 AND s3<35)

-- list of students who are failed exactly in 2 subjects ?
SELECT *
 FROM student
 WHERE        (s1<35 AND s2<35 AND s3>=35)
                      OR
	     (s1<35 AND s2>=35 AND s3<35)
	      OR 
	     (s1>=35 AND s2<35 AND s3<35)


--list of students who are failed in all 3 subjects ?
SELECT *
FROM student
WHERE s1<35 AND s2<35 AND s3<35 
















select * from student

select * from student 
where s1>=35 and s2>=35 and s3>=35

# Fail in any one subject
select * from student 
where s1<=35 or  s2<=35 or s3<=35


-- DISPLAY SNO , TOTAL , AVG , RESULT ?
CREATE TABLE STUD
(
SNO INT,
SNAME VARCHAR(10),
S1 INT,
S2 INT,
S3 INT
)

SELECT * FROM STUD

__INSERT VALUES:
INSERT INTO STUD VALUES(1,'A',80,90,70),
(2,'B',50,60,40),(3,'C',60,70,30)

-- DISPLAY SNO , TOTAL , AVG , RESULT ?
SELECT SNO ,
    S1+S2+S3 AS TOTAL,
    (S1+S2+S3)/3.0 AS AVG,
    CASE    
    WHEN S1>= 35 AND S2>=35 AND S3>=35 THEN 'PASS'
    ELSE 'FAIL'
END AS RESULT FROM STUD


