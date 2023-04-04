-- 절대값 
select abs(-78), abs(+78) -- 가상테이블에 만들어짐
from dual; 
-- 반올림
select round(44.875,-1) 
from dual;

-- 함수 연산
-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값 
select custid '고객번호', round(sum(saleprice)/count(*),-2) '평균금액'
from orders
group by custid; 

select round(14335645.4555,-3) from dual;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경 
select bookid, replace(bookname,'야구','농구')bookname, publisher, price from book; -- 실제 값 안바뀜! 
commit;
select * from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수 조회 
select bookname '제목', char_length(bookname) '문자수', length(bookname) '바이트수'
from book where publisher='굿스포츠';

-- 고객 중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 조회
select substr(name,1,1) '성', count(*) '인원' 
from customer group by substr(name,1,1);

select substr('abcdefg',3,4) from dual;

-- 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정날짜 조회
select orderid '주문번호', orderdate '주문일', 
adddate(orderdate, interval 10 day) '확정' from orders;

-- 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 조회 
-- 단, 주문일은 '%y%m%d' 형태로 표시
-- str_to_date(날짜(str형),'%y-%m-%d')
select orderid '주문번호', orderdate '주문일', custid '고객번호', bookid '도서번호'
from orders where orderdate='2014-07-07'; 

select orderid '주문번호', str_to_date(orderdate,'%Y-%m-%d') '주문일', custid '고객번호', bookid '도서번호'
from orders where orderdate=date_format('20140707','%Y%m%d'); -- 날짜를 문자로 바꿔서   

-- DBMS 시스템상의 오늘 날짜 반환 sysdate
select sysdate();
select sysdate(),date_format(sysdate(),'%y/%m/%d %M %h:%s') 'sysdate_1';

create table Mybook(
bookid int,
price int
);

insert into Mybook values(1,10000);
insert into Mybook values(2,30000);
insert into Mybook values(3,null);

select * from Mybook;

-- null 값에 대한 연산 ==> null
select price+100 from Mybook where bookid=3;

select sum(price),avg(price),count(*),count(price) from Mybook; -- count(*): 3 /count(price):2 (null안셈)

select sum(price),avg(price),count(*)from Mybook where bookid>4; -- count는 없으면 null(x) 0(0) 으로 출력됨

-- =같다 <>같지않다 
-- null과 공백''은 다른거 
select * from Mybook where price is null;
select * from Mybook where price = '';
select * from Mybook where price is not null;
select * from Mybook where price <> '';

-- 이름,전화번호가 포함된 고객목록 조회, 단 전화번호가 없는 고객은 '연락처없음'으로 표시
select name '이름', ifnull(phone, '연락처없음') '전화번호' from customer;

-- 
set @seq:=0; -- seq라는 변수에 0을 대입해라
select (@seq:=@seq+1) '순번',custid,name,phone from customer where @seq <2; 

-- practice
select * from book;

-- set @rnum:=0;
select *, @rnum:=@rnum+1 as rownum 
from book,(select @rnum:=0) r 
where @rnum<5;

select *, @rnum:=@rnum+1 as rownum 
from book,(select @rnum:=1) r 
where @rnum<=5 order by price; -- where조건이 안먹음

select *, @rnum:=@rnum+1 as rownum
from (select * from book order by price) b,
	  (select @rnum:=0) r 
      where @rnum<5; -- 정렬 조건 먹힘!
      
-- subquery
-- 마당서점의 고객별 판매액을 조회(고객이름과 고객별 판매액을 출력)
-- select와 from 사이에 select문 추가 가능
select (select name 
		from customer cs 
        where cs.custid=od.custid ) 'name', sum(saleprice) 'total'
from orders od 
group by od.custid;

-- orders 테이블에 각 주문에 맞는 도서이름 조회
alter table orders add column bname varchar(40) after bookid;
update orders o 
set bname = (select bookname from book b where b.bookid=o.bookid);

select * from orders;

-- 고객번호가 2이하인 고객의 판매액 조회(고객이름과 고객별 판매액 출력)
select cs.name, sum(od.saleprice) '판매액'
from (select custid, name from customer where custid<=2 ) cs, orders od
where cs.custid=od.custid group by cs.custid;

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액 조회
select orderid, saleprice from orders 
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호 조회 
select orderid, custid, saleprice from orders od
where saleprice > (select avg(saleprice) 
					from orders od2 where od.custid = od2.custid );
                    
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액 조회
select sum(saleprice)
from orders
where custid in ( select custid from customer where address like '대한민국%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액 조회 
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid=3);

select orderid, saleprice from orders 
where saleprice > all(select saleprice from orders where custid=3); -- 1대 다 비교

-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액 조회
-- exists : 존재 유무 확인 
select sum(saleprice) 'total'
from orders od
where exists (select * from customer cs 
				where address like '대한민국%'and od.custid=cs.custid);
                
-- view(하나 이상의 테이블을 합하여 만든 가상의 테이블) 
-- 뷰의 장점
-- 자주 사용되는 복잡한 질의를 뷰로 미리 정의해 놓을 수 있음
-- 사용자별로 필요한 데이터만 선별하여 보여줄 수 있고 중요한 질의의 경우 암호화할 수 있음
-- 미리 정의된 뷰를 일반 테이블처럼 사용할 수 있기 때문에 편리하고 사용자가 필요한 정보만 요구에 맞게 가공하여 뷰로 만들어 쓸 수 있음

-- 뷰의 특징
-- 원본 데이터 값에 따라 같이 변함
-- 독립적인 인덱스 생성이 어려움
-- 삽입, 삭제, 갱신 연산에 많은 제약이 따름 

select * from book where bookname like '%축구%';

create view vw_book as select * from book where bookname like '%축구%';

select * from vw_book;

-- 주소에 '대한민국'을 포함한느 고객들로 구성된 뷰를 만들고 조회
-- 뷰의 이름은 vw_customer로 설정
create view vw_customer as select * from customer where address like '%대한민국%';

select * from vw_customer;

-- orders 테이블에 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후
-- '김연아'고객이 구입한 도서의 주문번호, 도서이름, 주문액을 조회
create view vw_orders(orderid, custid,name,bookid,bookname,saleprice,orderdate)
as select  od.orderid, od.custid, cs.name, bk.bookid, bk.bookname, od.saleprice, od.orderdate 
from orders od, customer cs, book bk
where od.custid=cs.custid and od.bookid=bk.bookid;

select orderid, bookname, saleprice from vw_orders where name='김연아';

-- 뷰 vw_customer는 주소가 대한민국인 고객을 보여준다
-- 이 뷰를 영국을 주소로 가진 고객으로 변경 
-- phone 속성은 필요 없으므로 포함시키지 않는다 
create or replace view vw_customer(custid,name,address)
as select custid, name, address from customer 
where address like '%영국%';

select * from vw_customer;

-- 뷰 vw_customer를 삭제
drop view vw_customer;

-- 다음에 해당하는 뷰를 작성하세요
-- 데이터베이스는 마당서점 데이터베이스를 이용한다

-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 
-- 보여주는 highorders뷰를 생성하세요
-- 생성한 뷰를 이용하여 판매될 도서의 이름과 고객의 이름을 출력하는 sql문을 작성하세요 
-- highorder뷰를 변경하고자한다 판매가격 속성을 삭제하는 명령을 실행 삭제 후 확인하는 쿼리 작성 

create view vw_highorders as select book.bookid, bookname, name, publisher, saleprice
from book, customer, orders where orders.custid=customer.custid and orders.bookid=book.bookid
and saleprice>=20000; 

select bookname, name from vw_highorders;

alter view vw_highorders as select book.bookid,bookname,name,publisher from book, customer, orders 
where orders.custid=customer.custid and orders.bookid=book.bookid
and saleprice>=20000; 

select * from vw_highorders;








