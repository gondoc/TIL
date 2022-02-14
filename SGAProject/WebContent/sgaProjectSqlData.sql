create table member(
     idx int primary key auto_increment,
     name varchar(10) not null,
     id varchar(20) not null,
     password varchar(50) not null,
     gender boolean not null,
     phone varchar(11) not null,
     email varchar(30) not null,
     birth varchar (6) not null,
     nickName varchar(10) not null,
     question int not null,
     answer varchar(30) not null
);

create table person (
    idx int primary key auto_increment,
    ref int not null,
    height int not null,
    weight int not null,
    result double not null,
    regDate timestamp default now(),
    foreign key(ref) references member(idx)
);

select  * from member;
select  * from person;

insert into member 
(name,id,password,gender,phone,email,birth,nickName,question,answer) values
('최동오','chlehddh',password('1234'),true,'01072318062','chlehddh@naver.com','940520','김곤도',1,'나');

select  * from person;

select 
    id
from
    member 
where idx = 1;

insert  into person (ref,height,weight,result) values
(1,171,65,22.2);

select 
    height,weight,result,regDate
from
    person 
where
    idx=1;

select 
    *
from
    member
where
    idx = 1;

select 
	count(*) 
from 
	member 
where 
	idx=1,
and email = email, 
and phone = phone, 
and name = name;


select nickName from member
		where id = 'chlehddh' and password = password('1234')
		
		
		
select nickname from member
where idx = 1;


delete from person where
ref=1;
		
show variables like 'char%';

select id from member
		where name = '최동오'
		
select id from member
where
email = 'chlehddh@naver.com'
and name = '최동오'
and phone = '01072318062'
		

ALTER DATABASE jspdb CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
		
		
ALTER TABLE member CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;