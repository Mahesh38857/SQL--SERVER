--importing data from csv file :- 
CREATE TABLE covid(
DATEID VARCHAR(20),
STATE VARCHAR(50),
TOTALSAMPLES VARCHAR(30),
NEGATIVES VARCHAR(20),
POSITIVES VARCHAR(20)
)

--execute the following command to copy data from file to above table 
BULK INSERT COVID
FROM "D:\Courses&Internship\NIT\SQL\covid_india.csv"
WITH (FORMAT='CSV',FIRSTROW = 2,  FIELDTERMINATOR = ',')

select * from covid



