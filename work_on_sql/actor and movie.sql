create table actor(
ano int(5) primary key auto_increment,
aname varchar(10) not null,
age int(3));

create table movie(
mno int(5) primary key auto_increment,
mname varchar(10) not null,
ryear int(5));

create table imdb(
ano int(3),
mno int(3),
fees int(3),
foreign key(ano) references actor(ano),
foreign key(mno) references movie(mno));


insert into actor(aname, age) values
('SRK',57),
('AK',52),
('SK',57),
('DP',40);

insert into movie(mname, ryear) values
('CE',2010),
('KA',1995),
('RR',2009);

insert into imdb values
(1,1,500),
(1,2,100),
(4,1,300),
(2,3,700),
(3,2,120);

select * from actor join imdb
using(ano) join movie
using(mno);

# Display count of actors in which is present in movie
select mname, count(*) as 'Number of Actors'
from actor join imdb
using(ano) join movie
using(mno)
group by mname;

select mname, sum(fees) as 'Total Starcast fees'
from actor join imdb
using(ano) join movie
using(mno)
group by mname;

select ryear, count(Distinct(mname)) 
from movie
join imdb
using(mno)
join actor
using(ano)
group by ryear;

insert into actor(aname, age) values
('TK',40);

select * from actor
left join imdb
using(ano)
left join movie
using(mno);

select * from actor
left join imdb
using(ano)
left join movie
using(mno)
where mname is null;
