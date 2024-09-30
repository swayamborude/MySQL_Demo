USE emp;

CREATE TABLE `emp` (
  `eno` int(5) NOT NULL AUTO_INCREMENT,
  `ename` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(3) NOT NULL,
  `passport` varchar(10) DEFAULT NULL,
  `workmode` varchar(10) DEFAULT 'wfo',
  `salary` int(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eno`),
  UNIQUE KEY `passport` (`passport`));
  
INSERT INTO `emp` (`eno`, `ename`, `gender`, `age`, `passport`, `workmode`, `salary`, `city`) VALUES
(1, 'Alice', 'f', 23, 'A123456', 'NULL', 882, 'Pune'),
(2, 'Ben', 'm', 25, 'B123456', 'wfo', 992, 'Pune'),
(3, 'Chris', 'm', 25, 'C123456', 'wfo', 992, 'Pune'),
(4, 'Virat', 'm', 32, 'VK123456', 'wfo', 900, 'Delhi'),
(5, 'Neeraj', 'm', 25, 'N123456', 'wfo', 1000, 'Delhi'),
(6, 'Virat', 'f', 32, 'V123456', 'wfo', 1575, 'Jaipur'),
(7, 'Jack', 'm', 25, 'J123456', 'wfh', 1575, 'Jaipur'),
(8, 'Rahul', 'm', 56, 'R123456', 'wfh', 2668, 'Mumbai'),
(9, 'Pushkar', 'm', 25, 'P123456', 'hybrid', 2756, 'Mumbai'),
(10, 'Ritika', 'f', 20, 'RT123456', 'hybrid', 7000, 'Bangalore'),
(11, 'Mohini', 'f', 19, 'M123456', 'hybrid', 7500, 'Bangalore'),
(12, 'Rajesh', 'm', 32, 'RJ123456', 'wfo', 900, 'Delhi');

select gender, avg(salary)
from emp
group by gender;

select city, avg(salary)
from emp
group by city
order by avg (salary) desc;

select city, avg(salary)
from emp
group by city
having avg(salary)>2500
order by avg(salary) desc;

select workmode , avg(age)
from emp
group by workmode;

USE emp;
select * from emp;

select city, max(salary) as 'Maximum Salary'
from emp
group by city
order by max(salary) desc;

select city, max(salary)
from emp
where salary > 1500
group by city;

#Display the name of Employee earning max salary
select ename from emp
where salary=(select max(salary) from emp); 

# Display names of employee whose salary is greater than avg salary
select ename from emp
where salary > (select avg(salary) from emp);

# Display names of male employees whose salaries greater than avg salary of females
 select ename from emp
 where gender like 'f'
 and salary > (select avg (salary) from emp
 where gender like 'm');

select ename from emp
where city not in ('Pune')
and salary > ANY 
(select salary from emp where city like 'Pune');

USE emp;

select ename from emp
where city in ('Pune','Mumbai');

select ename,age,
case
when age between 18 and 19 then 'Teen'
when age between 20 and 30 then 'Youth'
when age between 31 and 40 then 'Mid Age'
else 'Seniors'
end as 'Category'
from emp;

select
case
when age between 18 and 19 then 'Teen'
when age between 20 and 30 then 'Youth'
when age between 31 and 40 then 'Mid Age'
else 'Seniors'
end as Category, count(*)
from emp
group by Category;

USE emp;
select * from emp;

# Select particular columns only Through VIEW Keyword
Create VIEW Gifts As
Select ename, gender, age, city from emp;

select * from Gifts;