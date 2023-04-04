use car_sale;

create table salesman(
	sno char(4) primary key, -- 사번
    sname varchar(20) not null, -- 성명
    hire date, -- 입사일
    point int(4), -- 실적 포인트
    branch varchar(20) -- 지점
);

create table car(
	cno char(2) primary key, -- 차량 번호
    cname varchar(20) not null, -- 차명
    cc int(4), -- 배기량
    weight int(5), -- 무게
    outlet varchar(20)
);

create table sale(
	sno char(4) not null, -- 사번
    cno char(2) not null, -- 차량번호
    qty int(3) -- 판매량
);

insert into salesman values('s123','기필호','1998-10-12',200,'인천');
insert into salesman values('s202','김두환','2005-05-03',400,'경기');
insert into salesman values('s134','박성식','2002-03-01',100,'서울');
insert into salesman values('s241','임홍석','2003-06-02',300,'부산');
insert into salesman values('s345','최재현','2004-03-01',200,'광주');
insert into salesman values('s203','김두환2','2005-05-03',400,'경기');

select * from salesman;

insert into car values('c1','소나타',1800,2500,'서울');
insert into car values('c2','소나타',2000,1300,'서울');
insert into car values('c3','레조',1500,1100,'인천');
insert into car values('c4','레조',2000,1200,'인천');
insert into car values('c5','카니발',300,1800,'광주');
insert into car values('c6','SM5',2000,1300,'부산');
insert into car values('c7','SM5',2000,1350,'부산');

select * from car;

insert into sale values('s123','c3',42);
insert into sale values('s123','c4',18);
insert into sale values('s123','c5',10);
insert into sale values('s123','c6',null);
insert into sale values('s202','c1',34);
insert into sale values('s202','c2',14);
insert into sale values('s134','c2',21);
insert into sale values('s241','c2',null);
insert into sale values('s241','c4',31);
insert into sale values('s123','c5',13);

commit;

select * from sale;

-- salesman 테이블의 모든 정보 조회
select *from salesman;

-- 판매된 승용차의 차량 번호를 중복없이 조회
select  distinct cno from sale;

-- 현재 판매중인 모든 차량의 차량명과 중량을 톤으로 환산하여 조회
select cname, weight*0.001 "톤 환산무게" from car;

-- 인천이 출고지인 차량의 차량 번호와 차량명 조회
select cno, cname from car where outlet='인천';

-- 출고지가 부산이고 배기량이 2500cc 이상인 차량의 차량명과 배기량 조회
select cname, cc from car where outlet='부산' and cc>=2500;

-- 영업 사원의 모든 정보를 실적이 낮은 순부터 조회
select * from salesman order by point;

-- 영업 사원의 모든 정보를 실적 순으로 검색하되 실적이 낮은 경우 입사한 순서로 정렬
select * from salesman order by point, hire;

-- 실적이 높은 영업사원 3명의 모든 정보를 실적순으로 조회 
select * from salesman order by point desc limit 3 ;
select * from (select row_number() over(order by point desc) 
as num,sno,sname,hire, point, branch from salesman) salesman where num <=3;

select row_number() over(order by point desc) 
as num,sno,sname,hire, point, branch from salesman;

-- 실적이 2등, 3등, 4등인 영업사원의 모든 정보 조회
-- max(), not in
select * from (select row_number() over(order by point desc) 
as num,sno,sname,hire,point,branch from salesman)salesman 
where point not in ((select max(point) from salesman)) and num<=4;

select * from (select row_number() over(order by point desc) 
as num,sno,sname,hire,point,branch from(select * from salesman 
where point not in (select max(point) from salesman) order by point desc)salesman)
salesman where num<=3;


select * from salesman where point not in (max(point));

-- 전체 영업 사원의 수(테이블의 모든 row 수) count(*),count(column)
select count(point) from salesman;

-- 영업 사원들의 실적 점수의 평균 avg()
select avg(point) from salesman;

-- 영업 사원별로 판매한 전체 차량 개수 sum()
select sno, sum(qty) from sale group by sno;

-- 30대 이상 차량을 판매한 영업사원의 사번 조회
select sno from sale group by sno having sum(qty)>=30;

-- 차량명이 '소'로 시작하는 차량의 모든 정보 조회 
select * from car where cname like '소%';

-- 김씨가 아닌 영업사원의 사번과 이름을 조회 
select sno, sname from salesman where sname not like '김%';

-- 배기량이 널값인 차량의 차량 번호과 차량명 조회
select cno, cname from car where cc is null;
select * from sale where qty is null;

-- 차량 번호 'c4'를 판매한 영업사원의 이름 조회
select s.sname 
from salesman s inner join sale s2 -- salesman을 s로 sale을 s2로 쓰겠다
on s2.sno = s.sno and s2.cno='c4';

-- sm5를 판매한 사원의 이름  
select s.sname
from salesman s inner join sale s2 inner join car s3
on s2.cno=s3.cno and s.sno=s2.sno and s3.cname='SM5';

select s.sname
from salesman s inner join sale s2
on s.sno=s2.sno
join car s3
on s2.cno=s3.cno and s3.cname='SM5';

-- 차량번호 c6인 판매대수를 null에서 30으로 수정 
update sale set qty=30 where cno='c6' and qty is null;
select * from sale;

-- 사번이 's123'인 사원 실적을 100점 증가 set + 
update salesman set point = point+100 where sno='s123';
select * from salesman;

-- 모든 사원의 실적을 100점 감소
update salesman set point = point -100;
select * from salesman;
rollback;

-- 사번이 's134'인 사원의 레코드 삭제
delete from salesman where sno='s134';

commit;

-- 부산에서 출고되는 모든 차량의 레코드 삭제
delete from car where outlet='부산';
select * from car;

-- 사원 테이블의 모든 정보 삭제
delete from salesman;

