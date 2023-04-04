create table student(
hakbun varchar(8) primary key not null,
name varchar(20),
hcode char(1), -- 학과 코드
hphone varchar(20),
jumin char(14), -- 주민번호 
dongari varchar(20), -- 동아리
janghak varchar(10)
);

insert into student values('19910393','김찬중','1','010-1234-5678','780112-1234567','영화',null);
insert into student values('19910394','이호철','2','010-1234-1112','780112-2234567','영화','수상');
insert into student values('19910395','김도형','3','010-1234-1113','800112-1234567',null,null);
insert into student values('20000394','홍길동','4','010-1234-1114','800708-2234567','탁구','수상');
insert into student values('20001093','김갑돌','4','010-1234-1115','780112-1234567','영화',null);
insert into student values('20001094','김갑순','2','010-1234-1116','000112-3234567','테니스',null);

select * from student;

-- 1:경영학과 2:컴퓨터 공학과 3:수학과 4:영문과 5:DB보안 
create table hakgwa(
hcode char(1), -- 학과 코드
hname varchar(20) -- 학과 이름 
);

drop table hakgwa;

insert into hakgwa values('1','경영학과');
insert into hakgwa values('2','컴퓨터 공학과');
insert into hakgwa values('3','수학과');
insert into hakgwa values('4','영문과');
insert into hakgwa values('5','DB보안');

select * from hakgwa;

create table sungjuk(
hakbun varchar(8),
kor int(3),
mat int(3),
eng int(3)
);

insert into sungjuk values('19910393',80 ,90 ,100);
insert into sungjuk values('19910394',70 ,55 ,80);
insert into sungjuk values('19910395',98 ,90 ,90);
insert into sungjuk values('20000394',70 ,90 ,100);
insert into sungjuk values('19993094',100 ,95 ,100);
insert into sungjuk values('20001093',99 ,78 ,100);
insert into sungjuk values('20001094',null ,null ,null);

select * from sungjuk;

commit;

-- 1. 장학금을 한 번도 안 받은 학생 조회
select * from student where janghak is null;

-- 2. 동아리가 있는 학생들의 목록을 조회
select * from student where dongari is not null;

-- 3. 최근의 학번 순으로 정렬 조회(학번, 이름, 주민번호) 
select hakbun "학번", name "이름", jumin "주민번호" from student order by hakbun desc; 

-- 4. 주민번호로 성별을 조회 case when(조건) then ...  when(조건2) then... else end //[PL(programing laungage)/SQL]
-- substr(대상,시작위치,몇개): str의 일부분
select hakbun "학번", name "이름", jumin "주민번호",
case 
when substr(jumin,8,1) = 1 or substr(jumin,8,1) = 1 
then '남자' 
else '여자' 
end as "성별"
from student;

-- 5. 2000년대 학번 학생들의 모든 정보를 조회
select * from student where substr(hakbun,1,1)=2;
select * from student where hakbun like '2%';

-- 6. 주민번호를 이용하여 현재의 나이 조회 case when then else end, in, substr, extract
select *,
case 
when substr(jumin,8,1) in ('1','2')
then extract(year from now())-(1900+substr(jumin,1,2))+1
else extract(year from now())-(2000+substr(jumin,1,2))+1
end as "나이"
from student;

-- 7. 동아리가 '영화'동아리만 조회 
select * from (select dongari from student where dongari ='영화')student;
select * from (select * from student where dongari ='영화')student;

-- 8. 70년대에 태어난 사람들 모두 조회
select * from student where substr(jumin,1,1)=7;
select * from student where substr(jumin,1,2) between 70 and 79;

-- 9. 학번 이름 학과 조회
select s.hakbun as '학번', s.name '이름', h.hname '학과'
from student s left join hakgwa h on s.hcode=h.hcode ;

-- 10. 학번, 이름, 학과, 국어점수, 수학점수, 영어점수를 조회
select s.hakbun as '학번', s.name '이름', h.hname '학과',
	   sj.kor "국어점수", sj.mat "수학점수", sj.eng "영어점수"
from student s left outer join hakgwa h
on s.hcode=h.hcode
left outer join sungjuk sj 
on sj.hakbun=s.hakbun;

-- 11. 복사
create table sungjuk2 as
(select s.hakbun as '학번', s.name '이름',
	   sj.kor "국어점수", sj.mat "수학점수", sj.eng "영어점수"
from student s 
inner join sungjuk sj -- join==inner join
on s.hakbun = sj.hakbun);

select * from sungjuk2;

-- 12. sungjuk2 테이블을 이용해 총점과 평균을 구해봄 -- 복사 시, 컬럼명이 별칭으로 바뀜
select 이름, 국어점수+수학점수+영어점수 '총점' , round((국어점수+수학점수+영어점수)/3) '평균' from sungjuk2;

-- 13. sungjuk2 테이블을 이용해 과목별 총점과 전과목의 총점을 구함
select sum(영어점수) "영어점수 총점",sum(수학점수) "수학점수 총점",sum(국어점수) "국어점수 총점",
	   sum(영어점수+수학점수+국어점수) "전과목 총점" from sungjuk2;
       
-- 14. sungjuk2 테이블에서 영어 점수가 100점 이상인 이름과 학번을 조회
select 이름, 학번 from sungjuk2 where 영어점수>=100;

-- 15. sungjuk2 테이블의 행의 개수를 조회
select count(*) from sungjuk2;

-- 16. sungjuk2 테이블에서 국어 전체 평균보다 높은 점수를 가진 사람의 학번과 이름 조회
select s.hakbun, s.name, sj.국어점수
from student s join sungjuk2 sj
on s.hakbun=sj.학번  
where sj.국어점수>(select avg(국어점수) from sungjuk2);

select 학번, 이름, 국어점수 from sungjuk2 
where 국어점수 > (select avg(국어점수) from sungjuk2);