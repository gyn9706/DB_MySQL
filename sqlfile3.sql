use sql_db;
create table emp(
emp_id varchar(10) primary key,
ename varchar(10),
salary int(5),
depart varchar(10)
);

select *from emp;

insert into emp value('a111','홍길동',2000,'관리');
insert into emp value('a222','이순신',4000,'개발');
insert into emp value('a333','유관순',3500,'영업');
insert into emp value('a444','강감찬',4500,'개발');
insert into emp value('a555','이성계',5500,'관리');
insert into emp value('a666','나신입',1800,null);

commit;

-- id와 name만 조회
select emp_id, ename from emp; 
-- 전체조회
select *from emp;
-- 연봉
select ename, salary ,salary*12 from emp;
-- 별칭
select ename as 사원명, salary as 월급 from emp;
-- 부서조회
select depart from emp;

-- 중복제거 distinct
select distinct depart from emp;

-- 월급이 3000이상 
select emp_id, ename, salary 
from emp 
where salary>=3000;

-- id='a111'
select emp_id, ename, salary 
from emp 
where emp_id='a111';

-- 급여가 2000~4000까지 between and
select emp_id, ename, salary from sql_db.emp 
where salary between 2000 and 4000;

-- 홍길동과 이순신의 급여를 동시에 조회 
select emp_id, ename, salary from sql_db.emp
where ename in('홍길동','이순신');

-- emp_id가 a111 a222 a333 동시에 조회 
select emp_id, ename, salary from sql_db.emp
where emp_id in('a111','a222','a333');

-- like : 정확하게 일치하는 경우가 아닌 임의의 문자 또는 문자열을 
-- 포함한 데이터를 검색할 때 사용
-- %(퍼센트) : 없거나 여러 개의 문자를 대체한다
-- _(언더바) : 하나의 문자를 대체한다

-- 성이 이로 시작하는 사원 조회
select emp_id, ename, salary from sql_db.emp
where ename like '이%';

-- 사원명 끝자가 순으로 긑나는 사원 조회
select emp_id, ename, salary from sql_db.emp
where ename like '%순';

-- 사원명 끝자가 동이면서 사원명이 3글자 조회
select emp_id, ename, salary from sql_db.emp
where ename like '__동';

-- 연봉이 3000에서 4000까지 제외한 나머지 사원 조회
select emp_id, ename, salary from sql_db.emp
where salary not between 3000 and 4000;

-- 급여를 오름차순으로 조회 order by asc(생략 가능) desc
select * from sql_db.emp
order by salary asc;

-- 부서순으로 정렬하고 부서가 같으면 다시 급여순으로 정렬하는 sql작성
select *from sql_db.emp
order by depart asc, salary desc; 