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

insert into bookcategory(name) values('�����');
insert into bookcategory(name) values('��ѧ');
insert into bookcategory(name) values('����');
insert into bookcategory(name) values('Ӣ��');

insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web�͸�����ѧ','����','��е��ҵ������','2013-6-1',49,1,'�ѽ�','j1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web�͸�����ѧ','����','��е��ҵ������','2013-5-1',49,1,'�ɽ�','j2.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('java web��������','��־��','�廪��ѧ������','2013-6-1',50,1,'�ɽ�','j3.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('��ѧ֮��','�ܿ�ѷ','�����ʵ������','2014-7-1',50,1,'�ɽ�','s1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('Ӣ��ʻ�ʸ�','������','��е��ҵ������','2013-6-1',49,1,'�ɽ�','e1.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('20�챳���ļ����Ĵʻ�','�¶���','��е��ҵ������','2013-6-1',49,1,'�ɽ�','e2.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('�ļ�������','������','��е��ҵ������','2013-6-1',49,1,'�ɽ�','e3.jpg');
insert into book(name,author,pubs,pubdate,price,bcid,state,picpath) values('����ѧԭ��','����Ƽ','��е��ҵ������','2013-6-1',49,1,'�ɽ�','g1.jpg');


insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('ѧ��',30,0.1,5);
insert into readercategory(name,maxperiod,fineperday,maxborrownumber) values('��ʦ ',60,0.2,8);

insert into reader(name,sex,phone,department,rcid,photopath) values('����','��','11111','��Ϣ����ϵ',1,'hlm003.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('����','Ů','11111','��Ϣ����ϵ',1,'hlm005.jpg');
insert into reader(name,sex,phone,department,rcid,photopath) values('����ʦ','��','11111','��Ϣ����ϵ',2,'hlm007.jpg');

insert into borrow(rid,bid,borrowdate) values(1,1,'2014-1-1');
update book set state='�ѽ�' where id=8;