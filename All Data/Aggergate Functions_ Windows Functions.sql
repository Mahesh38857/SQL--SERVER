-- ANALYTICAL FUNCTIONS / WINDOWS FUNCTIONS 
-- 1 RANK 
-- 2 DENSE_RANK 
-- 3 ROW_NUMBER 
-- 4 LAG
-- 5 LEAD

-- RANK & DENSE RANK :-
   -- Both functions are used to find ranks
   -- Ranking always based on one or more columns for ex sal,hiredate,total marks
   -- For rank  functions data must be stored
	
	-- RANK() OVER (ORDER BY COLNAME ASC / DESC , ---)
	-- DENSE_RANK() OVER (ORDER BY COLNAME ASC / DESC, ----)

-- DISPLAY RANKS OF THE EMPLOYEES BASED ON THE SALARY HIGHEST PAID EMPLOYEE SHOULD GET FIRST RANK ?
SELECT EMPNO,ENAME,SAL , 
RANK() OVER (ORDER BY SAL DESC) AS RANK FROM EMP
				OR 
SELECT  EMPNO , ENAME ,SAL,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANK FROM EMP

-- FIND RANKS OF THE EMPLOYYES BASED ON SAL IF SALARIES ARE SAME THEN RANKING SHOULD BE BASED ON HIREDATE?
SELECT EMPNO,ENAME,SAL,
DENSE_RANK() OVER (ORDER BY SAL DESC ,HIREDATE ASC ) AS RANK FROM EMP




-- AGGEREGATE FUNCTIONS :-
	-- These functions process multiple rows and returns one value

	-- 1 MAX
	-- 2 MIN 
	-- 3 SUM
	-- 4 AVG
	-- 5 COUNT

-- MAX():
	-- Returns maximum value

SELECT MAX(SAL) FROM EMP 
SELECT MAX(HIREDATE) FROM EMP
SELECT MAX(ENAME) FROM EMP
SELECT MAX(LEN(ENAME)) FROM EMP



-- MIN():
	-- Returns minimum value

SELECT MIN(SAL) FROM EMP 
SELECT MIN(HIREDATE) FROM EMP
SELECT MIN(ENAME) FROM EMP



--SUM():
	-- Returns total

SELECT SUM (SAL) FROM EMP

-- DISPLAY TOTAL SALARIES PAID TO MANAGERS ?
SELECT SUM (SAL) FROM EMP WHERE JOB = 'MANAGER'

-- DISPLAY TOTAL SALARY INCLUDING COMM ?
SELECT SUM(SAL+COMM) FROM EMP

 SELECT SUM(sal+ ISNULL(comm,0)) FROM EMP



-- AVG():
	-- Reurns average value

SELECT AVG (SAL) FROM EMP
SELECT FLOOR(AVG(SAL)) FROM EMP 
SELECT CEILING(AVG(SAL)) FROM EMP 


-- NOTE:
	-- SUM , AVG Can not be applied on char,date columns and can be applied only on on numeric columns


-- COUNT():
	-- Returns no of values in a column
	
SELECT COUNT(empno) FROM emp 
SELECT COUNT(comm) FROM emp 



-- COUNT(*):
	-- Returns number of rows in a table

SELECT COUNT(*) FROM  EMP 

-- DISPLAY NO OF ROWS IN EMP TABLE ?
SELECT COUNT (EMPNO) FROM EMP

SELECT COUNT(1) FROM EMP

-- NO OF EMPLOYEES JOINED IN 1981 ?
SELECT COUNT(1) FROM EMP   
WHERE YEAR(HIREDATE) = 1981 

-- NO OF EMPLYEES JOINED ON SUNDAY ?
SELECT COUNT(1) FROM EMP 
WHERE DATENAME(DW,HIREDATE) = 'SUNDAY'

SELECT * FROM EMP

-- NO OF EMPLOYEES WORKING  FOR EACH DEPT ?
SELECT COUNT(CASE DEPTNO
		WHEN 10 THEN EMPNO
END) AS [10],
COUNT(CASE DEPTNO 
		WHEN 20 THEN EMPNO 
END) AS [30],
COUNT(CASE DEPTNO 
		WHEN 30 THEN EMPNO
END )AS [30]
FROM EMP


--NOTE:
	-- Aggeragate function not allowed in where clause 
	-- They are allowed only in select,having clauses


-- FIND NAME OF THE EMPLOYEE EARNING MAX SALARY ?
SELECT ENAME 
FROM EMP 
WHERE SAL = (SELECT MAX(SAL) FROM EMP)


-- NAME OF THE EMPLOYEE HAVING MAX EXPERIENCE ?
SELECT ENAME 
FROM EMP 
WHERE HIREDATE = (SELECT MIN (HIREDATE) FROM EMP)




-- HOW TO USE AGGREGATE FUNCTIONS AS ANALYTICAL FUNCTIONS:-

-- Analytical functions returns one value for each but aggregate functions returns one value from group of rows.
-- We can also use aggeragate functions as analytiacl function to calculate sum,avg,count for each rows.

			-- SUM(colname)  OVER (ORDER BY -----)
            -- AVG(colname) OVER  (ORDER BY ---)
            -- COUNT(colname) OVER (ORDER BY ---)
-- EX: 
CREATE TABLE SALE
(
 ID INT,
 SDATE DATE,
 AMT  MONEY
 )
 INSERT INTO SALE VALUES(1,'2025-01-01',100),
   (2,'2025-01-02',120),
   (3,'2025-01-03',130),
   (4,'2025-01-04',115),
   (5,'2025-01-05',140)

SELECT * FROM SALE

-- RUNNING TOTAL

	-- DISPLAY ID SDATE AMT RUNNING_TOATAL ?
 SELECT ID,SDATE,AMT,
            SUM(AMT) OVER (ORDER BY SDATE ASC) AS RUNNING_TOTAL
 FROM SALE


 -- PREVIOUS DAY SALE 
	--  DISPLAY  ID   SDATE    AMT     PREV_DAY_AMT       DIFFERENCE  ?
	SELECT ID , SDATE , AMT,
	LAG (AMT,1) OVER (ORDER BY SDATE ASC) AS PREV_DAY_AMT,
	AMT - LAG(AMT,1) OVER (ORDER BY SDATE ASC ) AS DIFFERENCE
	FROM SALE

-- PERCENTAFE CANGE CALCULATION :
	-- pct  =  (difference / previous_day_amt) * 100
WITH S AS
(
    SELECT 
        id,
        sdate,
        amt,
        LAG(amt,1) OVER (ORDER BY sdate ASC) AS prev_day_amt,
        amt - LAG(amt,1) OVER (ORDER BY sdate ASC) AS difference
    FROM sale
)
SELECT * FROM S;


-- DAY MOVING AVERAGE :
SELECT ID,SDATE,AMT,
AVG(AMT) OVER (ORDER BY SDATE ASC
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS MOVING_AVG
FROM SALE

