-- GROUP BY CLAUSE : 
	-- Group by clause is used to group rows based on one or more columns to calculate max,min, sum ,avg, count for each group. For ex to calculate dept wise total sal first group rows based on dept and apply sum function on each dept instead of aapplying on whole table.

	SELECT * FROM EMP 

	--  group by claue is used to convert detailed data into summarized data which is useful for analysis.

-- SYNTAX :

-- SELECT columns
  FROM tabname
  [WHERE cond]
  GROUP BY col1,col2,----
  [HAVING cond]
  [ORDER BY -------]

-- EXCUTION :
 FROM
 WHERE
 GROUP BY
 HAVING
 SELECT
 ORDER BY 

-- EX:
-- DISPLAY DEPT WISE TOTAL SAL ?
SELECT DEPTNO,SUM(SAL) AS TOTSAL
FROM EMP 
GROUP BY DEPTNO

-- JOB WISE SUMMARY I.E MIN SAL,MAX SAL TOTAL SAL, NO OF EMPS?
 SELECT job , MIN(sal) as minsal,
                           MAX(sal) as maxsal,
                           SUM(sal) as totsal,
                           COUNT(*) as cnt
    FROM emp 
    GROUP BY job

-- YEAR WISE NO OF EMPLOYEES JOINED ?
