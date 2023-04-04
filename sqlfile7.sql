create table Book(
bookid integer primary key,
bookname varchar(40),
publisher varchar(40),
price integer
);

create table Customer(
custid integer primary key,
name varchar(40),
address varchar(50),
phone varchar(20)
);

create table Orders(
orderid integer primary key,
custid integer,
bookid int,
saleprice int,
orderdate date,
foreign key(custid) references Customer(custid), -- 참조, 주로 primary key를 참조함
foreign key(bookid) references Book(bookid)
);

commit;

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));

select * from Book;
select * from Customer; 
select * from Orders;

commit;

-- 데이터 정의어(DDL) : create, alter, drop
-- 데이터 조작어(DML) : select, insert, delete, update
-- 데이터 제어서(DCL) : grant, revoke 
-- CRUD(create(insert), read(select), update, delete)

-- 김연아 고객의 전화번호 조회
select name, phone from customer where name='김연아';

-- 모든 도서의 이름과 가격 조회
select bookname, price from book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회
select * from book;

-- 도서 테이블에 있는 모든 출판사를 조회
select publisher from book;

-- 중복 제거 
select distinct publisher from book;

-- 연산자 
-- 관계연산자: =,<>(다르다),<,<=,>,>=
-- between 범위 
-- in(...) / not in(...) 여러가지 선택
-- like / not like 
-- is null, is not null
-- 논리연산자: and, or, not

-- 가격이 20000원 미만인 도서 조회
select * from book where price<20000;

-- 가격이 10000원 이상 20000원 이하인 도서 조회
select * from book where price between 10000 and 20000;
select * from book where price >=10000 and price <=20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서 조회
select * from book where publisher='굿스포츠'or publisher='대한미디어';
-- 해당되는 여러 특정값이 있을 경우 in
select * from book where publisher in('굿스포츠','대한미디어');

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서 조회
select * from book where not( publisher='굿스포츠' or publisher='대한미디어');
select * from book where publisher not in('굿스포츠','대한미디어');

-- '축구의 역사'를 출간한 출판사 조회
select bookname, publisher from book where bookname = '축구의 역사';
select bookname, publisher from book where bookname like '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사 조회  
select bookname, publisher from book where bookname like '%축구%';

-- 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서를 조회
select * from book where bookname like '_구%';

-- 와일드 문자
-- + : 문자열을 연결
-- % : 0개 이상의 문자열과 일치
-- [] : 1개의 문자와 일치 : '[0-5]%' : 0-5사이 숫자로 시작하는 문자열 
-- [^] : 1개의 문자와 불일치 : '[^0-5]%' : 0-5사이 숫자로 시작하지 않는 문자열
-- _ : 특정 위치의 1개의 문자와 일치 

-- 축구에 관한 도서 중 가격이 20000원 이상인 도서를 조회
select * from book where bookname like '%축구%' and price >=20000;


-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 조회
select * from book where publisher in('굿스포츠' ,'대한미디어');

-- 도서를 이름순으로 조회 
select * from book order by bookname ;

-- 도서를 가격순을 조회하고, 가격이 같으면 이름순으로 조회
select * from book order by price, bookname;

-- 도서를 가격의 내림차순으로 조회 만약 가격이 같다면 출판사의 오름차순으로 조회 
select * from book order by price desc, publisher;

-- 고객이 주문한 도서의 총 판매액을 조회 
select sum(saleprice) as '총매출' from orders; -- as 별칭 

-- 2번 김연아 고객이 주문한 도서의 총 판매액을 조회
select custid,sum(saleprice) from orders where custid=2;

-- 고객이 주문한 도서의 총 판매액,평균값,최저가,최고가를 조회
select sum(saleprice) total, round(avg(saleprice)) Average, min(saleprice) Min, max(saleprice) Max
from orders;

-- 마당서점의 도서 판매 건수를 조회 
select count(*) as '도서판매 건수' from orders; 

-- 고객별로 주문한 도서의 총 수량과 총 판매액을 조회
select custid, count(*) '도서수량', sum(saleprice) '도서수량 총판매액' from orders group by custid;

select any_value(orderid),any_value(custid),any_value(custid),any_value(bookid),any_value(saleprice)
,any_value(orderdate) from orders order by custid;

select c.custid '고객ID', c.name '이름',  count(o.saleprice) '총수량', sum(o.saleprice) '총판매액' 
from orders o join customer c on o.custid=c.custid group by c.custid order by sum(o.saleprice) desc ;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량 조회
-- 단, 두권 이상 구매한 고객만 조회
-- having <검색 조건> 뒤에는 sum, avg, max, min count 집계함수가 와야한다.
select custid, count(*) from orders where saleprice>=8000 
group by custid having count(*) >=2; 

-- group by로 해당컬럼으로 묶은 후 select에는 group by에서 사용한 컬럼과 집계함수만 올 수 있다.
select custid, sum(saleprice) from orders group by custid;

select * from customer,orders where customer.custid=orders.custid; -- join과 동일
select * from customer c join orders o on c.custid=o.custid ;

-- 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬조회
select * from customer,orders where customer.custid=orders.custid order by orders.custid;
select * from customer c join orders o on c.custid=o.custid order by o.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 조회
select name, saleprice from customer,orders where customer.custid=orders.custid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬 조회
select name, sum(saleprice) from customer,orders where customer.custid=orders.custid
group by name order by name; 

select * from customer,orders where customer.custid=orders.custid;

-- 고객의 이름과 고객이 주문한 도서의 이름
select name, bookname from customer,orders,book 
where customer.custid=orders.custid and book.bookid=orders.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회
select c.name, b.bookname from orders o join customer c join book b 
on o.custid=c.custid and o.bookid=b.bookid
where o.saleprice=20000;

select name, bookname from customer,orders,book 
where customer.custid=orders.custid and book.bookid=orders.bookid
and saleprice=20000;

-- 도서를 구매하지않은 고객을 포함하여 고객의 이름과 주문한도서의 판매가격 조회 
select c.name, o.saleprice from orders o right join customer c on o.custid=c.custid;

-- 가장 비싼 도서의 이름 조회
select bookname from book where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 조회 
select distinct c.name from orders o left join customer c on o.custid=c.custid;

select name from customer where custid in(select custid from orders);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름 조회
select name, publisher from customer, book, orders 
where customer.custid=orders.custid and orders.bookid=book.bookid and publisher='대한미디어'; 

select name from customer where custid in(select custid from orders
where bookid in (select bookid from book where publisher='대한미디어'));

-- 출판사별로 출판사의 평균도서 가격보다 비싼 도서 조회
select b1.bookname, b1.price, (select round(avg(b2.price)) from book b2 where b1.publisher=b2.publisher) '평균가' 
from book b1 where b1.price > (select avg(b2.price) from book b2 where b1.publisher=b2.publisher);

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름 조회
-- union : 합집합
select name from customer where address like '대한민국%'
union
select name from customer where custid in(select custid from orders);

-- 대한민국에서 거주하는 고객의 이름에서 도서를 주문한 고객의 이름을 빼고 조회
select name from customer where address like '대한민국%' 
and name not in
(select name from customer where custid in(select custid from orders));

-- 대한민국에서 거주하는 고객 중 도서를 주문한 고객의 이름을 조회
select name from customer where custid in(select custid from orders)
and name in
(select name from customer where address like '대한민국%' );

-- 주문이 있는 고객의 이름과 주소를 조회 
-- exists
select name, address from customer cs 
where exists (select * from orders od where cs.custid=od.custid);
-- not exists

/*
create table NewBook(
bookid int,
bookname varchar(20),
publisher varchar(20),
price int,
primary key(bookid)
);

create table NewBook(
bookname varchar(20),
publisher varchar(20),
price int,

primary key(bookname,publisher)
);

create table NewBook(
bookname varchar(20),
publisher varchar(20),
price integer default 10000 check(price>1000)

primary key(bookname,publisher)
);

create table NewOrder(
orderid int,
custid int not null,
bookid int not null,
saleprice int,
orderdate date,
primary key(orderid),

foreign key(userid) references NewCustomer(custid:primary key) on delete cascade
// NewNewCustomer지울때 NewOrder 같이 삭제됨
);

alter: 생성된 테이블의 속성(컬럼)과 속성에 관한 제약을
	   변경하며 기본키 및 외래키를 변경함
add, drop: 속성을 추가하거나 제거
modify: 속성의 기본값을 설정하거나 삭제 

1) NewBook테이블에 varchar(13)의 자료형을 가진 isbn속성을 추가 
	alter table NewBook add isbn varchar(13);
2) NewBook테이블에 isbn속성의 데이터 타입을 integer 형으로 바꿈 
	alter table NewBook modify isbn integer;
3) NewBook테이블에 isbn속성 삭제
	alter table NewBook drop column isbn;
4) NewBook테이블의 bookid속성에 not null 제약조건을 적용 
	alter table NewBook modify bookid integer not null; // int --> notnull로 변경 
5) NewBook테이블의 bookid속성을 기본키로 변경 
	alter table NewBook add primary key(bookid); // add써주기!! 

	alter table 테이블 이름 
		add 속성이름 데이터 타입
        drop column 속성이름
        modify 속성이름 데이터 타입
        modify 속성이름 null | not null
        add primary key 속성이름
        add | drop 제약이름 
        
6) NewBook 테이블 삭제
		drop table NewBook;
*/

-- book 테이블에 추가
insert into book(bookid,bookname,publisher, price) 
values(11,'스포츠 의학','한솔의학서적',90000);

select * from book;

create table Imported_book(
bookid int,
bookname varchar(40),
publisher varchar(40),
price int
);

insert into imported_book values(21,'Zen Golf','Pearson',12000);
insert into imported_book values(22,'Soccer Skills','Human Kinetics',15000);

select * from Imported_book;

commit;

-- imported_book을 book테이블에 모두 삽입
insert into book(bookid, bookname, price, publisher)
select bookid,bookname,price,publisher from imported_book;

select * from book;

update customer set address ='대한민국 부산' where custid=3;

select * from customer;

-- 11번 '스포츠 의학'의 출판사를 imprted_book테이블의 21번 출판사와 동일하게 변경 
update book
set publisher = (select publisher from imported_book where bookid=21)
where bookid =11;

select * from book;

-- book 테이블에서 도서번호가 11인 도서를 삭제
delete from book where bookid=11;


