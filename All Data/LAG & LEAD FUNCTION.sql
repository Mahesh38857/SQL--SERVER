-- LAG & LEAD:-

 -- LAG(colname,int) OVER (ORDER BY ---)            =>  returns previous row value
 -- LEAD(colname,int) OVER (ORDER BY ---)          =>  returns next row value

-- DISPLAY PREVIOUS ROW VALUE 
SELECT EMPNO,ENAME,SAL,
LAG(SAL,1) OVER (ORDER BY EMPNO ASC) AS PREV_SAL
FROM EMP



CREATE TABLE POPULATION
(
YEAR INT,
POPULATION NUMERIC 
)

INSERT INTO POPULATION VALUES (2020,1328024498),
(2021,1402617695), (2022,1425423212), (2023,1438069596), (2024,1450935791)

SELECT * FROM POPULATION 


-- DISPLAY YEAR POPULATION GROWTH ?

-- GROWTH = CURRENT YEAR POPULATION - PREVIOUS YEAR POPULATION 
SELECT YEAR , POPULATION ,
POPULATION - LAG(POPULATION,1) OVER (ORDER BY YEAR ASC) AS GROWTH FROM POPULATION 

-- DISPLAY YEAR POPULATION GROWTH PERCENTAGE ?
PCT =  ((current year population - prev year population ) / (prev year population)) * 100

SELECT  year , population , 
   population - LAG(population,1) OVER (ORDER BY year ASC) as growth ,
   ((population - LAG(population,1) OVER (ORDER BY year ASC))/(LAG(population,1) OVER (ORDER BY year ASC)))*100 as pct
  FROM population


 
