USE work_on_sql;

create table chiefminister(
cmno int(3) primary key auto_increment,
cmname varchar(10) not null,
cmage int(3));

create table state(
sno int(5) primary key auto_increment,
sname varchar(10) not null,
capcity varchar(10),
cmno int(3),
foreign key(cmno) references chiefminister(cmno));

insert into chiefminister (cmname,cmage) values
('Shinde',52),
('Kejariwal',53),
('Sharma',60);

insert into state (sname,capcity,cmno) values
('MH','Mumbai',1),
('Delhi','New Delhi',2),
('RJ','Jaipur',3);

select cmname
from state,chiefminister
where state.cmno=chiefminister.cmno
and sname like 'Delhi';

# Display name of the state governed by the youngest CM
select sname
from state, chiefminister
where state.cmno = chiefminister.cmno
and chiefminister.cmno = (select chiefminister.cmno
from chiefminister
where cmage = ( select min(cmage) 
from chiefminister));

USE work_on_sql;

insert into state (sname,capcity) values
('Gujarat','Ahmedabad'),
('Karnataka','Bengaluru');

#Display Common identifier of the both table
select * from chiefminister
join state using (cmno);

