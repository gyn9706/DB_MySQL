start transaction;
create table sql_db.student(
	stu_id int(4),
    name varchar(10),
    age int(3),
    address varchar(5)
);

insert into sql_db.student value(1,'홍길동',20,'서울');
insert into sql_db.student value(2,'홍길동2',22,'서울');

select * from sql_db.student;

drop table sql_db.student;

use sql_db;

select *from student;

rollback;

commit;

delete from sql_db.student where stu_id=1;
delete from sql_db.student;
