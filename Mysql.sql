drop database bookdb;
create database bookdb;
use bookdb;

create table userinfo(
	id int primary key auto_increment,
	username varchar(20),
	password varchar(20)
);


create table bookcategory(
	id int primary key auto_increment,
	name varchar(20),
	remark varchar(256)
);

create table book(
	id int primary key auto_increment,
	name varchar(128),
	author varchar(20),
	pubs varchar(64),
	pubdate date,
	price float,
	isbn varchar(20),
	state varchar(4),
	picpath varchar(256),
	remark varchar(256),
	bcid int
);

alter table book add foreign key fk_bc(bcid) references bookcategory(id);

create table readercategory(
	id int primary key auto_increment,
	name varchar(48),
	maxperiod int,
	maxborrownumber int,
	fineperday float,
	remark varchar(256)
);

create table reader(
	id int primary key auto_increment,
	name varchar(20),
	sex varchar(2),
	phone varchar(16),
	department varchar(24),
	photopath varchar(256),
	remark varchar(256),
	rcid int
);

alter table reader add foreign key fk_rc(rcid) references readercategory(id);

create table borrow(
	id int primary key auto_increment,
	rid int,
	bid int,
	borrowdate date,
	returndate date,
	remark varchar(256)
);

alter table borrow add foreign key fk_r(rid) references reader(id);
alter table borrow add foreign key fk_b(bid) references book(id);

create table fine(
	id int primary key auto_increment,
	borrowid int,
	finenumber float,
	remark varchar(256),
	uid int
);

alter table fine add foreign key fk_borrow(borrowid) references borrow(id);
alter table fine add foreign key fk_u(uid) references userinfo(id);

insert into userinfo(username,password) values('aaa','111');

insert into bookcategory(name) values('计算机');
insert into bookcategory(name) values('数学');
insert into bookcategory(name) values('管理');
insert into bookcategory(name) values('英语');

insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web就该这样学','王洋','机械工业出版社','2013-6-1',49,1,'已借','j1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web就该这样学','王洋','机械工业出版社','2013-5-1',49,1,'可借','j2.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web技术整合','张志峰','清华大学出版社','2013-6-1',50,1,'可借','j3.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('数学之旅','杰克逊','人民邮电出版社','2014-7-1',50,1,'可借','s1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('英语词汇词根','域名好','机械工业出版社','2013-6-1',49,1,'可借','e1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('20天背完四级核心词汇','新东方','机械工业出版社','2013-6-1',49,1,'可借','e2.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('四级新题型','王江涛','机械工业出版社','2013-6-1',49,1,'可借','e3.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('管理学原理','王丽萍','机械工业出版社','2013-6-1',49,1,'可借','g1.jpg');


insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('学生',30,0.1,5);
insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('老师 ',60,0.2,8);

insert into reader(name,sex,phone,department,rcid,photopath) values('张三','男','11111','信息工程系',1,'hlm003.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('李四','女','11111','信息工程系',1,'hlm005.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('唐老师','男','11111','信息工程系',2,'hlm007.jpg');

insert into borrow(rid,bid,borrowdate) values(1,1,'2014-1-1');
update book set state='已借' where id=8;