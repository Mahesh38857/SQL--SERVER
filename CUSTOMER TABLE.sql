use DB7AM

CREATE TABLE cust
(
cid smallint,
name varchar(10),
age tinyint,
city varchar(10),
DOR date
);

SP_HELP cust    # It shows the structure of table.


insert into cust values(100,'Sachin',30,'mum','2025-10-9')

select*from cust

insert into cust values(101,'David',25,'hyd',GETDATE())


-- inserting multipe rows

insert  into cust values(102,'Vijay',35,'hyd','2025-05-10'),
(103,'Sindhu',25,'blr','2018-04-20')


-- inserting Nulls
-- Method1 (Explicit)

insert into cust values (104,'Rahul',40,null,'2021-09-14')


--Method2 (Implicit)

insert into cust (cid,name,city,dor) Values(105,'Kumar','blr','2025-10-10')


-- Displaying the data 
select * from cust


-- Display all customer name and cites?
select name, city from cust

-- Display a customer name , city and age?
select name , city , age from cust

-- Display all data from cust table?
select*from cust

-- Diplay cust details whose name is Rahul?
Select name from cust where cid  = 104

-- Which city Rahul Staying?
Select city from cust where name ='Rahul'

-- List of cust age >30?
select * from cust where age >30

-- List of cust registered after 2020?
select * from cust where dor >'2020-12-31'

-- List of cust registered before 2020?
select * from cust where dor <'2020-01-01'

-- Cust not staying in hyd?
select * from cust where city! = 'hyd'
				OR
select * from cust where city <> 'hyd'

-- Display cust whose id = 100,103,105?
select * from cust where cid in (100,103,105)

-- List of cust staying in hyd,mum,blr?
select * from cust where city in  ('hyd','mum','blr')

-- List of cust not staying in hyd,mum,blr?
select * from cust where city not in  ('hyd','mum','blr')

-- Displaly the cust age betn 30 and 40?
select * from cust where age between 30 and 40         # Here 30 and 40 also included.

-- Cust registered in 2020 year?
select * from cust where  dor  between '2020-01-01' and '2020-12-31'

-- Cust name starts with s.						
select * from cust where name like 's%'

-- name ends with 'd'?
select * from cust where name like '%d'

-- name contains 'a'?
select * from cust where name like '%a%'

-- where 'a' is the 4th char in their name ?
select * from cust where name like '___a%'


-- name contain 5 chars ?
select * from cust where name like '_____'

-- Name Starting with vowels?
select * from cust where name like 'a%' or name like 'e%' or name like 'i%' or name like 'o%' or name like 'u%'
						OR
select * from cust where name like '[aeiou]%'

-- Name starts between 'a' and 'p'?
select * from cust where name like'[a-p]%'

-- cust work registered in april month?  yyyy-mm-dd  # we know only month
select * from cust where dor like '____04__' ##############

select * from cust where dor like '%04%' # here 04 Date , month and year.


-- cust joined in 2021?
select * from cust  where dor between '2021-01-01' and '2021-12-31'

-- customers registered in 1st 9 days of any month any year ?
 SELECT * FROM cust 
 WHERE dor LIKE '________0_'




