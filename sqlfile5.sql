create table sungjuk(
	hakbun varchar(4),
    id varchar(20),
    sname varchar(20),
    email varchar(100),
    kor int(3),
    eng int(3),
    mat int(3)
);

select * from sungjuk;

insert into sungjuk values('1','a1','홍길동','kkk@k.com',80,70,90);
insert into sungjuk values('2','b1','이선생','iii@i.com',76,38,89);
insert into sungjuk values('3','c1','양선생','ooo@o.com',90,70,80);
insert into sungjuk values('4','d1','파선생',null,45,20,100);
insert into sungjuk values('5','e1','주선생',null,100,100,100);

-- 학번 역순 출력
select * from sungjuk order by hakbun desc;

select * from (select row_number() over(order by point desc) 
as num,sno,sname,hire, point, branch from salesman) salesman where num <=3;

-- 학번을 역순으로 정렬하고 상위 2명만 출력 
select * from(select row_number() over (order by hakbun desc)
as num, hakbun, id, sname, email, kor, eng, mat from sungjuk) sungjuk where num<3;

-- 이메일이 없는 레코드 출력
select * from sungjuk where email is null;

-- 이메일이 있는 레코드만 출력
select * from sungjuk where email is not null;
select * from sungjuk where email like '%@%';
select * from sungjuk where email not in ('null');

-- 학번이 3~5 사이의 레코드 조회
select * from sungjuk where hakbun between 3 and 5;
select * from sungjuk where hakbun >= 3 and hakbun<=5;

-- 이름에 '선'이 들어가면서 영어 점수가 60점 이상인 레코드 조회
select * from sungjuk where sname like '%선%' and eng >=60;

-- 국어 점수가 80점 이상이면서 수학 점수가 90점 이상인 레코드 조회
select * from sungjuk where kor >=80 and mat >=90;

-- 국어 점수가 90점 이상이거나 이름이 '김'으로 시작하는 레코드 조회
select * from sungjuk where kor>=90 or sname like '김%';

-- 학번이 3번 이상 이면서 영어 점수가 70점 이상인 레코드 조회 
select * from sungjuk where hakbun>=3 and eng>=70 ;

-- 수학 점수만 100점인 필드 중에서 수학 점수만 출력하여 중복 레코드 제거 
select distinct mat from sungjuk where mat =100;

-- 이름이 '생'으로 끝나고 이메일이 없는 레코드 조회 
select * from sungjuk where sname like '%생' and email is null;

-- 복사
create table sungjuk_result as (select * from sungjuk where eng>= 70);
select * from sungjuk_result;

-- 아이디가 e1인 사용자의 이메일 'w@w.com' 국어점수 80점으로 수정
update sungjuk set email='w@w.com', kor=80 where id='e1';

select * from sungjuk;

-- 이름이 파선생 레코드 삭제 
delete from sungjuk where sname='파선생';

commit;
