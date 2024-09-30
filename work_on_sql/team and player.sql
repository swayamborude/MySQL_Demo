Create table team(
tno int(3) primary key,
tname varchar(10) not null unique,
ownername varchar(10),
trophy int(2),
city varchar(10));

alter table team
modify tno int (3) auto_increment;

create table player(
pno int(2) primary key,
pname varchar(10) unique,
age int(2),
runscore int(10),
wicket int(5),
tno int(3),
foreign key(tno) references team(tno));

insert into team(tname, ownername, trophy, city) values
('MI','Ambani',5,'Mumbai'),
('CSK','Srinivasan',4,'Chennai'),
('KKR','SRK',3,'Kolkata');
 
insert into player(pno, pname, age, runscore, wicket, tno) values
(93,'Bumrah',29,100,150,1),
(7,'MSD',41,7000,0,2),
(45,'Rohit',37,5000,0,1),
(33,'Hardik',30,3000,50,1),
(96,'Iyer',33,4000,0,3),
(35,'Rinku',25,1000,5,3),
(8,'Jadeja',35,3500,200,2);

alter table player
modify pno int(2) auto_increment;
 
DELETE FROM team
WHERE tno = 4;
DELETE FROM team
WHERE tno = 5;
DELETE FROM team
WHERE tno = 6;

#Display Common identifier of the both table

select * from team
join player using(tno)
order by tno;

# Display City wise count of player

select city, count(*)
from team 
join player
using (tno)
group by city;

# Add Column in player table which is name is category
alter table player
add category varchar(10) check (category in ('bat', 'bowl', 'ar', 'wk'));

# In category coloumn add values
update player set category = 'bowl'
where pno=93;

DELETE FROM team
WHERE tno IN (7, 8, 9);

#Display Common identifier of the both table
select * from team
join player on team.tno = player.tno;

# Display count of player of categories
select category, count(*) from team
join player on team.tno = player.tno
group by category;

select * from team
join player on team.tno = player.tno;

#Display Avg runscore by categories
select category, avg(runscore) from team
join player on team.tno = player.tno
group by category;

ALTER TABLE team AUTO_INCREMENT = 4;

# Add Two more teams in team table
insert into team(tname, ownername, trophy, city) values
('RCB','U_Spirits',1,'Bengluru'),
('PBKS','P_Zinta',2,'Punjab');

# Insert the values into the previous added teams
insert into player(pno, pname, age, runscore, wicket, tno, category) values
(18,'Virat',28,5500,100,4,'bat'),
(42,'Shikhar',35,6500,50,5,'bat'),
(2,'Arshdeep',28,0,250,5,'bowl'),
(13,'Duplessis',32,6000,50,4,'bat');

insert into team(tname, ownername, trophy, city) values
('GT','CVC',1,'Gujarat'),
('DC','Parth',1,'New_Delhi');

select * from team
left join player on team.tno = player.tno;

# Display these teams that has no player
select tname from team
left join player using (tno)
where pname is null;

insert into player(pno, pname, age, runscore, wicket, category) values
(9,'Rajesh',28,5500,100,'bat'),
(10,'Rakesh',28,5500,100,'bat');

select * from team
right join player
using (tno);

# Display the player name which is not in the any team
select pname from team
right join player
using (tno)
where tname is null;