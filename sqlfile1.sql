create table sql_db.member(
	name varchar(10),
    userid varchar(10),
    pwd varchar(10),
    email varchar(20),
    phone char(13),
    admin int(1) default 0,
    primary key(userid)
);

insert into sql_db.member(name,userid,pwd,email,phone,admin)
value('이소미','somi','1234','gmd@naver.com','010-2362-5157',0);

insert into sql_db.member(name,userid,pwd,email,phone,admin)
value('하상오','sang12','1234','ha12@naver.com','010-5629-8888',1);

insert into sql_db.member(name,userid,pwd,email,phone,admin)
value('김윤승','light','1234','youn1004@naver.com','010-9999-8282',0);

insert into sql_db.member
value('김윤승2','light2','1234','youn2004@naver.com','010-9999-8283',0);

select*from sql_db.member;
select name from sql_db.member;

drop table sql_db.member;

rollback;

commit;

-- 아이디가 'somi'인 것만 조회
select * from member where userid='somi';
-- 관리자인 것만 조회 admin=1
select * from member where admin=1;
-- 아이디가 'somi'인 레코드의 폰 번호 변경
update member set phone='010-1155-5678' where userid='somi';
-- userid='somi' 삭제
delete from member where userid='somi';

select *from member;

-- 제약조건 
create table customer(
id int(4) primary key,
name varchar(10) not null,
address varchar(5) unique,
age int(3) check(age>=30)
);

insert into customer value(100,'홍길동','서울',40);
insert into customer value(101,'이순신',null,50);
delete from customer;
select*from customer;

commit;