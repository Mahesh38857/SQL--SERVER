-- PARTITION BY CLAUSE:-
	-- Partition by clause is used to divide the table based on one or more columns 
	-- Use partition by to find ranks with in group 
	-- To find ranks with in dept first divide the table dept wise using partition by clause and apply rank / dense_rank functions on each dept.

SELECT  DEPTNO,ENAME ,SAL,
DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANK FROM EMP


-- DISPLAY TOP 3 MAX SALARIES ?
SELECT SAL,DENSE_RANK() OVER (OREDR BY SAL DESC) AS RANK FROM EMP 
WHERE RANK <=3  =======> -- ERROR


-- NOTE :
		-- Alias can not be used in where clause , to overcome this use CTE (Common Table Expression)


-- DISPLAY TOP 3 MAX SALARIES WITHOUT USING TOP CLAUSE?
WITH E AS 
(SELECT SAL,DENSE_RANK() OVER (ORDER BY SAL DESC ) AS RANK FROM EMP)
SELECT SAL FROM E WHERE RANK <=3

-- DISPLAY 5th MAX SALARY ?
WITH E AS 
(SELECT SAL,DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANK FROM EMP)
SELECT SAL FROM E WHERE RANK=5
