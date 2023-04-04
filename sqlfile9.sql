CREATE TABLE regions (
   region_id INT (11) UNSIGNED NOT NULL,
   region_name VARCHAR(25),
   PRIMARY KEY (region_id)
   );
   
   CREATE TABLE countries (
   country_id CHAR(2) NOT NULL,
   country_name VARCHAR(40),
   region_id INT (11) UNSIGNED NOT NULL,
   PRIMARY KEY (country_id)
);

CREATE TABLE locations (
   location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
   street_address VARCHAR(40),
   postal_code VARCHAR(12),
   city VARCHAR(30) NOT NULL,
   state_province VARCHAR(25),
   country_id CHAR(2) NOT NULL,
   PRIMARY KEY (location_id)
   );
   
   CREATE TABLE departments (
   department_id INT (11) UNSIGNED NOT NULL,
   department_name VARCHAR(30) NOT NULL,
   manager_id INT (11) UNSIGNED,
   location_id INT (11) UNSIGNED,
   PRIMARY KEY (department_id)
   );
   
   CREATE TABLE jobs (
   job_id VARCHAR(10) NOT NULL,
   job_title VARCHAR(35) NOT NULL,
   min_salary DECIMAL(8, 0) UNSIGNED,
   max_salary DECIMAL(8, 0) UNSIGNED,
   PRIMARY KEY (job_id)
   );
   
   CREATE TABLE employees (
   employee_id INT (11) UNSIGNED NOT NULL,
   first_name VARCHAR(20),
   last_name VARCHAR(25) NOT NULL,
   email VARCHAR(25) NOT NULL,
   phone_number VARCHAR(20),
   hire_date DATE NOT NULL,
   job_id VARCHAR(10) NOT NULL,
   salary DECIMAL(8, 2) NOT NULL,
   commission_pct DECIMAL(2, 2),
   manager_id INT (11) UNSIGNED,
   department_id INT (11) UNSIGNED,
   PRIMARY KEY (employee_id)
   );
   
   CREATE TABLE job_history (
   employee_id INT (11) UNSIGNED NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   job_id VARCHAR(10) NOT NULL,
   department_id INT (11) UNSIGNED NOT NULL
   );
   
   CREATE TABLE job_grades (
   grade_level VARCHAR(3),  
    lowest_sal  DECIMAL(8, 0),  
    highest_sal DECIMAL(8, 0)
    );
    
    insert into regions values(1,'Europe');
    insert into regions values(2,'Americas');
    insert into regions values(3,'Asia');
    insert into regions values(4,'Middle East and Africa');
    
    select * from regions;
    
    commit;
    
    insert into countries values('IT','Italy',1);
    insert into countries values('JP','Japan',3);
    insert into countries values('US','United State of America',2);
    insert into countries values('CA','Canada',2);
    insert into countries values('CN','China',3);
    insert into countries values('IN','India',3);
    insert into countries values('AU','Austrailia',3);
    INSERT INTO countries VALUES ('ZW','Zimbabwe',4);
	INSERT INTO countries VALUES ('SG','Singapore',3);
	INSERT INTO countries VALUES ('UK','United Kingdom',1);
	INSERT INTO countries VALUES ('FR','France',1);
	INSERT INTO countries VALUES ('DE','Germany',1);
	INSERT INTO countries VALUES ('ZM','Zambia',4);
	INSERT INTO countries VALUES ('EG','Egypt',4);
	INSERT INTO countries VALUES ('BR','Brazil',2);
	INSERT INTO countries VALUES ('CH','Switzerland',1);
	INSERT INTO countries VALUES ('NL','Netherlands',1);
	INSERT INTO countries VALUES ('MX','Mexico',2);
	INSERT INTO countries VALUES ('KW','Kuwait',4);
	INSERT INTO countries VALUES ('IL','Israel',4);
	INSERT INTO countries VALUES ('DK','Denmark',1);
	INSERT INTO countries VALUES ('HK','HongKong',3);
	INSERT INTO countries VALUES ('NG','Nigeria',4);
	INSERT INTO countries VALUES ('AR','Argentina',2);
	INSERT INTO countries VALUES ('BE','Belgium',1);
    
    INSERT INTO locations VALUES (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
	INSERT INTO locations VALUES (1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP');
	INSERT INTO locations VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
	INSERT INTO locations VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
	INSERT INTO locations VALUES (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
	INSERT INTO locations VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
	INSERT INTO locations VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
	INSERT INTO locations VALUES (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
	INSERT INTO locations VALUES (2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN');
	INSERT INTO locations VALUES (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
	INSERT INTO locations VALUES (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
	INSERT INTO locations VALUES (2300,'198 Clementi North','540198','Singapore',NULL,'SG');
	INSERT INTO locations VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
	INSERT INTO locations VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
	INSERT INTO locations VALUES (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
	INSERT INTO locations VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
	INSERT INTO locations VALUES (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
	INSERT INTO locations VALUES (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
	INSERT INTO locations VALUES (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
	INSERT INTO locations VALUES (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
	INSERT INTO locations VALUES (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
    
    INSERT INTO departments VALUES (10,'Administration',200,1700);
	INSERT INTO departments VALUES (20,'Marketing',201,1800);
	INSERT INTO departments VALUES (30,'Purchasing',114,1700);
	INSERT INTO departments VALUES (40,'Human Resources',203,2400);
	INSERT INTO departments VALUES (50,'Shipping',121,1500);
	INSERT INTO departments VALUES (60,'IT',103,1400);
	INSERT INTO departments VALUES (70,'Public Relations',204,2700);
	INSERT INTO departments VALUES (80,'Sales',145,2500);
	INSERT INTO departments VALUES (90,'Executive',100,1700);
	INSERT INTO departments VALUES (100,'Finance',108,1700);
	INSERT INTO departments VALUES (110,'Accounting',205,1700);
	INSERT INTO departments VALUES (120,'Treasury',NULL,1700);
	INSERT INTO departments VALUES (130,'Corporate Tax',NULL,1700);
	INSERT INTO departments VALUES (140,'Control And Credit',NULL,1700);
	INSERT INTO departments VALUES (150,'Shareholder Services',NULL,1700);
	INSERT INTO departments VALUES (160,'Benefits',NULL,1700);
	INSERT INTO departments VALUES (170,'Manufacturing',NULL,1700);
	INSERT INTO departments VALUES (180,'Construction',NULL,1700);
	INSERT INTO departments VALUES (190,'Contracting',NULL,1700);
	INSERT INTO departments VALUES (200,'Operations',NULL,1700);
	INSERT INTO departments VALUES (210,'IT Support',NULL,1700);
	INSERT INTO departments VALUES (220, 'NOC',NULL,1700);
	INSERT INTO departments VALUES (230,'IT Helpdesk',NULL,1700);
	INSERT INTO departments VALUES (240,'Government Sales',NULL,1700);
	INSERT INTO departments VALUES (250,'Retail Sales',NULL,1700);
	INSERT INTO departments VALUES (260,'Recruiting',NULL,1700);
	INSERT INTO departments VALUES (270,'Payroll',NULL,1700); 
    
    INSERT INTO jobs VALUES ('AD_PRES','President',20000,40000);
	INSERT INTO jobs VALUES ('AD_VP','Administration Vice President',15000,30000);
	INSERT INTO jobs VALUES ('AD_ASST','Administration Assistant',3000,6000);
	INSERT INTO jobs VALUES ('FI_MGR','Finance Manager',8200,16000);
	INSERT INTO jobs VALUES ('FI_ACCOUNT','Accountant',4200,9000);
	INSERT INTO jobs VALUES ('AC_MGR','Accounting Manager',8200,16000);
	INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
	INSERT INTO jobs VALUES ('SA_MAN','Sales Manager',10000,20000);
	INSERT INTO jobs VALUES ('SA_REP','Sales Representative',6000,12000);
	INSERT INTO jobs VALUES ('PU_MAN','Purchasing Manager',8000,15000);
	INSERT INTO jobs VALUES ('PU_CLERK','Purchasing Clerk',2500,5500);
	INSERT INTO jobs VALUES ('ST_MAN','Stock Manager',5500,8500);
	INSERT INTO jobs VALUES ('ST_CLERK','Stock Clerk',2000,5000);
	INSERT INTO jobs VALUES ('SH_CLERK','Shipping Clerk',2500,5500);
	INSERT INTO jobs VALUES ('IT_PROG','Programmer',4000,10000);
	INSERT INTO jobs VALUES ('MK_MAN','Marketing Manager',9000, 15000);
	INSERT INTO jobs VALUES ('MK_REP','Marketing Representative',4000,9000);
	INSERT INTO jobs VALUES ('HR_REP','Human Resources Representative',4000,9000);
	INSERT INTO jobs VALUES ('PR_REP','Public Relations Representative',4500,10500);
    
    INSERT INTO employees
    VALUES (100,'Steven','King','SKING','515.123.4567',STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),
   'AD_PRES',24000,NULL,NULL,90);
INSERT INTO employees
VALUES (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),
   'AD_VP',17000,NULL,100, 90 );

INSERT INTO employees
VALUES (102,'Lex','De Haan','LDEHAAN','515.123.4569',STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),
   'AD_VP',17000, NULL, 100, 90);

INSERT INTO employees
VALUES (103,'Alexander','Hunold','AHUNOLD','590.423.4567',STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),
   'IT_PROG', 9000, NULL, 102, 60 );

INSERT INTO employees
VALUES ( 104,'Bruce','Ernst','BERNST','590.423.4568',STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),
   'IT_PROG',6000,NULL,103,60);

INSERT INTO employees
VALUES (105,'David','Austin', 'DAUSTIN','590.423.4569',STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),
   'IT_PROG', 4800, NULL, 103, 60);

INSERT INTO employees
VALUES ( 106,'Valli','Pataballa','VPATABAL', '590.423.4560', STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),
   'IT_PROG', 4800, NULL, 103, 60 );

INSERT INTO employees
VALUES ( 107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
   'IT_PROG', 4200, NULL, 103, 60 );

INSERT INTO employees
VALUES ( 108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),
   'FI_MGR', 12000, NULL, 101, 100 );

INSERT INTO employees
VALUES ( 109,'Daniel','Faviet','DFAVIET','515.124.4169',STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),
   'FI_ACCOUNT', 9000, NULL, 108,100);

INSERT INTO employees
VALUES ( 110,'John','Chen','JCHEN','515.124.4269', STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),
   'FI_ACCOUNT', 8200, NULL, 108, 100 );

INSERT INTO employees
VALUES ( 111,'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),
   'FI_ACCOUNT', 7700, NULL, 108, 100);

INSERT INTO employees
VALUES ( 112,'Jose Manuel','Urman', 'JMURMAN','515.124.4469',STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),
   'FI_ACCOUNT',7800,NULL, 108, 100 );

INSERT INTO employees
VALUES ( 113, 'Luis','Popp','LPOPP','515.124.4567',STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),
   'FI_ACCOUNT',6900, NULL, 108, 100);

INSERT INTO employees
VALUES ( 114, 'Den','Raphaely','DRAPHEAL','515.127.4561', STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),
   'PU_MAN',11000, NULL, 100, 30);

INSERT INTO employees
VALUES (115,'Alexander','Khoo', 'AKHOO','515.127.4562',STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),
   'PU_CLERK',3100, NULL,114,30 );

INSERT INTO employees
VALUES ( 116,'Shelli','Baida','SBAIDA','515.127.4563',STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),
   'PU_CLERK',2900, NULL,114,30);

INSERT INTO employees
VALUES ( 117,'Sigal','Tobias','STOBIAS','515.127.4564', STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),
   'PU_CLERK', 2800, NULL, 114, 30);

INSERT INTO employees
VALUES ( 118,'Guy','Himuro','GHIMURO','515.127.4565', STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),
   'PU_CLERK', 2600, NULL, 114, 30);

INSERT INTO employees
VALUES (119,'Karen','Colmenares','KCOLMENA','515.127.4566',STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),
   'PU_CLERK', 2500, NULL, 114, 30);

INSERT INTO employees
VALUES (120,'Matthew','Weiss','MWEISS','650.123.1234',STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),
   'ST_MAN',8000, NULL,100,50);

INSERT INTO employees
VALUES (121,'Adam','Fripp','AFRIPP','650.123.2234',STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),
   'ST_MAN', 8200, NULL, 100, 50);

INSERT INTO employees
VALUES (122,'Payam','Kaufling','PKAUFLIN','650.123.3234',STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),
   'ST_MAN',7900,NULL,100,50);

INSERT INTO employees
VALUES (123,'Shanta','Vollman','SVOLLMAN','650.123.4234',STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),
   'ST_MAN', 6500, NULL, 100, 50);

INSERT INTO employees
VALUES (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),
   'ST_MAN',5800, NULL,100,50);

INSERT INTO employees
VALUES (125,'Julia','Nayer','JNAYER','650.124.1214',STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),
   'ST_CLERK',3200,NULL, 120, 50);

INSERT INTO employees
VALUES (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),
   'ST_CLERK',2700, NULL, 120, 50);

INSERT INTO employees
VALUES (127,'James','Landry','JLANDRY','650.124.1334',STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),
   'ST_CLERK', 2400, NULL, 120, 50 );

INSERT INTO employees
VALUES (128,'Steven','Markle','SMARKLE','650.124.1434',STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),
   'ST_CLERK',2200, NULL,120,50 );

INSERT INTO employees
VALUES (129, 'Laura', 'Bissot','LBISSOT','650.124.5234',STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
   'ST_CLERK',3300, NULL,121,50);

INSERT INTO employees
VALUES (130,'Mozhe','Atkinson','MATKINSO','650.124.6234',STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),
   'ST_CLERK', 2800, NULL,121,50);

INSERT INTO employees
VALUES (131,'James','Marlow','JAMRLOW','650.124.7234',STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),
   'ST_CLERK',2500, NULL, 121, 50);

INSERT INTO employees
VALUES (132,'TJ','Olson','TJOLSON','650.124.8234',STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),
   'ST_CLERK', 2100, NULL, 121,50);

INSERT INTO employees
VALUES (133,'Jason','Mallin','JMALLIN','650.127.1934', STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),
   'ST_CLERK',3300,NULL, 122, 50 );

INSERT INTO employees
VALUES (134,'Michael','Rogers','MROGERS','650.127.1834',STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),
   'ST_CLERK', 2900, NULL, 122, 50);

INSERT INTO employees
VALUES (135,'Ki','Gee','KGEE','650.127.1734',STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),
   'ST_CLERK',2400,NULL,122,50);

INSERT INTO employees
VALUES (136,'Hazel','Philtanker','HPHILTAN','650.127.1634',STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),
   'ST_CLERK',2200,NULL,122,50);

INSERT INTO employees
VALUES (137, 'Renske','Ladwig','RLADWIG','650.121.1234',STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),
   'ST_CLERK',3600,NULL,123,50);

INSERT INTO employees
VALUES (138,'Stephen','Stiles','SSTILES','650.121.2034',STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),
   'ST_CLERK',3200,NULL,123, 50);

INSERT INTO employees
VALUES (139,'John','Seo','JSEO','650.121.2019', STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),
   'ST_CLERK', 2700, NULL, 123, 50);

INSERT INTO employees
VALUES (140,'Joshua','Patel','JPATEL','650.121.1834',STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),
   'ST_CLERK',2500, NULL, 123, 50 );

INSERT INTO employees
VALUES ( 141, 'Trenna','Rajs','TRAJS','650.121.8009', STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),
   'ST_CLERK', 3500, NULL, 124,50);

INSERT INTO employees
VALUES (142,'Curtis','Davies','CDAVIES','650.121.2994',STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),
   'ST_CLERK',3100,NULL, 124, 50);

INSERT INTO employees
VALUES (143,'Randall','Matos','RMATOS','650.121.2874',STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),
   'ST_CLERK',2600, NULL, 124, 50);

INSERT INTO employees
VALUES ( 144,'Peter','Vargas','PVARGAS','650.121.2004',STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),
   'ST_CLERK', 2500, NULL, 124, 50 );

INSERT INTO employees
VALUES (145,'John','Russell','JRUSSEL','011.44.1344.429268',STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),  
 'SA_MAN', 14000, .4, 100, 80);

INSERT INTO employees
VALUES (
   146,
   'Karen',
   'Partners',
   'KPARTNER',
   '011.44.1344.467268',
   STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),
   'SA_MAN',
   13500,
   .3,
   100,
   80
   );

INSERT INTO employees
VALUES (
   147,
   'Alberto',
   'Errazuriz',
   'AERRAZUR',
   '011.44.1344.429278',
   STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
   'SA_MAN',
   12000,
   .3,
   100,
   80
   );

INSERT INTO employees
VALUES (
   148,
   'Gerald',
   'Cambrault',
   'GCAMBRAU',
   '011.44.1344.619268',
   STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),
   'SA_MAN',
   11000,
   .3,
   100,
   80
   );

INSERT INTO employees
VALUES (
   149,
   'Eleni',
   'Zlotkey',
   'EZLOTKEY',
   '011.44.1344.429018',
   STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),
   'SA_MAN',
   10500,
   .2,
   100,
   80
   );

INSERT INTO employees
VALUES (
   150,
   'Peter',
   'Tucker',
   'PTUCKER',
   '011.44.1344.129268',
   STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),
   'SA_REP',
   10000,
   .3,
   145,
   80
   );

INSERT INTO employees
VALUES (
   151,
   'David',
   'Bernstein',
   'DBERNSTE',
   '011.44.1344.345268',
   STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),
   'SA_REP',
   9500,
   .25,
   145,
   80
   );

INSERT INTO employees
VALUES (
   152,
   'Peter',
   'Hall',
   'PHALL',
   '011.44.1344.478968',
   STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
   'SA_REP',
   9000,
   .25,
   145,
   80
   );

INSERT INTO employees
VALUES (
   153,
   'Christopher',
   'Olsen',
   'COLSEN',
   '011.44.1344.498718',
   STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),
   'SA_REP',
   8000,
   .2,
   145,
   80
   );

INSERT INTO employees
VALUES (
   154,
   'Nanette',
   'Cambrault',
   'NCAMBRAU',
   '011.44.1344.987668',
   STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),
   'SA_REP',
   7500,
   .2,
   145,
   80
   );

INSERT INTO employees
VALUES (
   155,
   'Oliver',
   'Tuvault',
   'OTUVAULT',
   '011.44.1344.486508',
   STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),
   'SA_REP',
   7000,
   .15,
   145,
   80
   );

INSERT INTO employees
VALUES (
   156,
   'Janette',
   'King',
   'JKING',
   '011.44.1345.429268',
   STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),
   'SA_REP',
   10000,
   .35,
   146,
   80
   );

INSERT INTO employees
VALUES (
   157,
   'Patrick',
   'Sully',
   'PSULLY',
   '011.44.1345.929268',
   STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),
   'SA_REP',
   9500,
   .35,
   146,
   80
   );

INSERT INTO employees
VALUES (
   158,
   'Allan',
   'McEwen',
   'AMCEWEN',
   '011.44.1345.829268',
   STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),
   'SA_REP',
   9000,
   .35,
   146,
   80
   );

INSERT INTO employees
VALUES (
   159,
   'Lindsey',
   'Smith',
   'LSMITH',
   '011.44.1345.729268',
   STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
   'SA_REP',
   8000,
   .3,
   146,
   80
   );

INSERT INTO employees
VALUES (
   160,
   'Louise',
   'Doran',
   'LDORAN',
   '011.44.1345.629268',
   STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),
   'SA_REP',
   7500,
   .3,
   146,
   80
   );

INSERT INTO employees
VALUES (
   161,
   'Sarath',
   'Sewall',
   'SSEWALL',
   '011.44.1345.529268',
   STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),
   'SA_REP',
   7000,
   .25,
   146,
   80
   );

INSERT INTO employees
VALUES (
   162,
   'Clara',
   'Vishney',
   'CVISHNEY',
   '011.44.1346.129268',
   STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),
   'SA_REP',
   10500,
   .25,
   147,
   80
   );

INSERT INTO employees
VALUES (
   163,
   'Danielle',
   'Greene',
   'DGREENE',
   '011.44.1346.229268',
   STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),
   'SA_REP',
   9500,
   .15,
   147,
   80
   );

INSERT INTO employees
VALUES (
   164,
   'Mattea',
   'Marvins',
   'MMARVINS',
   '011.44.1346.329268',
   STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),
   'SA_REP',
   7200,
   .10,
   147,
   80
   );

INSERT INTO employees
VALUES (
   165,
   'David',
   'Lee',
   'DLEE',
   '011.44.1346.529268',
   STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),
   'SA_REP',
   6800,
   .1,
   147,
   80
   );

INSERT INTO employees
VALUES (
   166,
   'Sundar',
   'Ande',
   'SANDE',
   '011.44.1346.629268',
   STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),
   'SA_REP',
   6400,
   .10,
   147,
   80
   );

INSERT INTO employees
VALUES (
   167,
   'Amit',
   'Banda',
   'ABANDA',
   '011.44.1346.729268',
   STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
   'SA_REP',
   6200,
   .10,
   147,
   80
   );

INSERT INTO employees
VALUES (
   168,
   'Lisa',
   'Ozer',
   'LOZER',
   '011.44.1343.929268',
   STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),
   'SA_REP',
   11500,
   .25,
   148,
   80
   );

INSERT INTO employees
VALUES (
   169,
   'Harrison',
   'Bloom',
   'HBLOOM',
   '011.44.1343.829268',
   STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),
   'SA_REP',
   10000,
   .20,
   148,
   80
   );

INSERT INTO employees
VALUES (
   170,
   'Tayler',
   'Fox',
   'TFOX',
   '011.44.1343.729268',
   STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
   'SA_REP',
   9600,
   .20,
   148,
   80
   );

INSERT INTO employees
VALUES (
   171,
   'William',
   'Smith',
   'WSMITH',
   '011.44.1343.629268',
   STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),
   'SA_REP',
   7400,
   .15,
   148,
   80
   );

INSERT INTO employees
VALUES (
   172,
   'Elizabeth',
   'Bates',
   'EBATES',
   '011.44.1343.529268',
   STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),
   'SA_REP',
   7300,
   .15,
   148,
   80
   );

INSERT INTO employees
VALUES (
   173,
   'Sundita',
   'Kumar',
   'SKUMAR',
   '011.44.1343.329268',
   STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
   'SA_REP',
   6100,
   .10,
   148,
   80
   );

INSERT INTO employees
VALUES (
   174,
   'Ellen',
   'Abel',
   'EABEL',
   '011.44.1644.429267',
   STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),
   'SA_REP',
   11000,
   .30,
   149,
   80
   );

INSERT INTO employees
VALUES (
   175,
   'Alyssa',
   'Hutton',
   'AHUTTON',
   '011.44.1644.429266',
   STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),
   'SA_REP',
   8800,
   .25,
   149,
   80
   );

INSERT INTO employees
VALUES (
   176,
   'Jonathon',
   'Taylor',
   'JTAYLOR',
   '011.44.1644.429265',
   STR_TO_DATE('24-MAR-1998', '%d-%M-%Y'),
   'SA_REP',
   8600,
   .20,
   149,
   80
   );

INSERT INTO employees
VALUES (
   177,
   'Jack',
   'Livingston',
   'JLIVINGS',
   '011.44.1644.429264',
   STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),
   'SA_REP',
   8400,
   .20,
   149,
   80
   );

INSERT INTO employees
VALUES (
   178,
   'Kimberely',
   'Grant',
   'KGRANT',
   '011.44.1644.429263',
   STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),
   'SA_REP',
   7000,
   .15,
   149,
   NULL
   );

INSERT INTO employees
VALUES (
   179,
   'Charles',
   'Johnson',
   'CJOHNSON',
   '011.44.1644.429262',
   STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),
   'SA_REP',
   6200,
   .10,
   149,
   80
   );

INSERT INTO employees
VALUES (
   180,
   'Winston',
   'Taylor',
   'WTAYLOR',
   '650.507.9876',
   STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3200,
   NULL,
   120,
   50
   );

INSERT INTO employees
VALUES (
   181,
   'Jean',
   'Fleaur',
   'JFLEAUR',
   '650.507.9877',
   STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3100,
   NULL,
   120,
   50
   );

INSERT INTO employees
VALUES (
   182,
   'Martha',
   'Sullivan',
   'MSULLIVA',
   '650.507.9878',
   STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
   'SH_CLERK',
   2500,
   NULL,
   120,
   50
   );

INSERT INTO employees
VALUES (
   183,
   'Girard',
   'Geoni',
   'GGEONI',
   '650.507.9879',
   STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),
   'SH_CLERK',
   2800,
   NULL,
   120,
   50
   );

INSERT INTO employees
VALUES (
   184,
   'Nandita',
   'Sarchand',
   'NSARCHAN',
   '650.509.1876',
   STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),
   'SH_CLERK',
   4200,
   NULL,
   121,
   50
   );

INSERT INTO employees
VALUES (
   185,
   'Alexis',
   'Bull',
   'ABULL',
   '650.509.2876',
   STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),
   'SH_CLERK',
   4100,
   NULL,
   121,
   50
   );

INSERT INTO employees
VALUES (
   186,
   'Julia',
   'Dellinger',
   'JDELLING',
   '650.509.3876',
   STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3400,
   NULL,
   121,
   50
   );

INSERT INTO employees
VALUES (
   187,
   'Anthony',
   'Cabrio',
   'ACABRIO',
   '650.509.4876',
   STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
   'SH_CLERK',
   3000,
   NULL,
   121,
   50
   );

INSERT INTO employees
VALUES (
   188,
   'Kelly',
   'Chung',
   'KCHUNG',
   '650.505.1876',
   STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),
   'SH_CLERK',
   3800,
   NULL,
   122,
   50
   );

INSERT INTO employees
VALUES (
   189,
   'Jennifer',
   'Dilly',
   'JDILLY',
   '650.505.2876',
   STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),
   'SH_CLERK',
   3600,
   NULL,
   122,
   50
   );

INSERT INTO employees
VALUES (
   190,
   'Timothy',
   'Gates',
   'TGATES',
   '650.505.3876',
   STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),
   'SH_CLERK',
   2900,
   NULL,
   122,
   50
   );

INSERT INTO employees
VALUES (
   191,
   'Randall',
   'Perkins',
   'RPERKINS',
   '650.505.4876',
   STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),
   'SH_CLERK',
   2500,
   NULL,
   122,
   50
   );

INSERT INTO employees
VALUES (
   192,
   'Sarah',
   'Bell',
   'SBELL',
   '650.501.1876',
   STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),
   'SH_CLERK',
   4000,
   NULL,
   123,
   50
   );

INSERT INTO employees
VALUES (
   193,
   'Britney',
   'Everett',
   'BEVERETT',
   '650.501.2876',
   STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),
   'SH_CLERK',
   3900,
   NULL,
   123,
   50
   );

INSERT INTO employees
VALUES (
   194,
   'Samuel',
   'McCain',
   'SMCCAIN',
   '650.501.3876',
   STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3200,
   NULL,
   123,
   50
   );

INSERT INTO employees
VALUES (
   195,
   'Vance',
   'Jones',
   'VJONES',
   '650.501.4876',
   STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),
   'SH_CLERK',
   2800,
   NULL,
   123,
   50
   );

INSERT INTO employees
VALUES (
   196,
   'Alana',
   'Walsh',
   'AWALSH',
   '650.507.9811',
   STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3100,
   NULL,
   124,
   50
   );

INSERT INTO employees
VALUES (
   197,
   'Kevin',
   'Feeney',
   'KFEENEY',
   '650.507.9822',
   STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),
   'SH_CLERK',
   3000,
   NULL,
   124,
   50
   );

INSERT INTO employees
VALUES (
   198,
   'Donald',
   'OConnell',
   'DOCONNEL',
   '650.507.9833',
   STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
   'SH_CLERK',
   2600,
   NULL,
   124,
   50
   );

INSERT INTO employees
VALUES (
   199,
   'Douglas',
   'Grant',
   'DGRANT',
   '650.507.9844',
   STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),
   'SH_CLERK',
   2600,
   NULL,
   124,
   50
   );

INSERT INTO employees
VALUES (
   200,
   'Jennifer',
   'Whalen',
   'JWHALEN',
   '515.123.4444',
   STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),
   'AD_ASST',
   4400,
   NULL,
   101,
   10
   );

INSERT INTO employees
VALUES (
   201,
   'Michael',
   'Hartstein',
   'MHARTSTE',
   '515.123.5555',
   STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),
   'MK_MAN',
   13000,
   NULL,
   100,
   20
   );

INSERT INTO employees
VALUES (
   202,
   'Pat',
   'Fay',
   'PFAY',
   '603.123.6666',
   STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),
   'MK_REP',
   6000,
   NULL,
   201,
   20
   );

INSERT INTO employees
VALUES (
   203,
   'Susan',
   'Mavris',
   'SMAVRIS',
   '515.123.7777',
   STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
   'HR_REP',
   6500,
   NULL,
   101,
   40
   );

INSERT INTO employees
VALUES (
   204,
   'Hermann',
   'Baer',
   'HBAER',
   '515.123.8888',
   STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
   'PR_REP',
   10000,
   NULL,
   101,
   70
   );

INSERT INTO employees
VALUES (
   205,
   'Shelley',
   'Higgins',
   'SHIGGINS',
   '515.123.8080',
   STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
   'AC_MGR',
   12000,
   NULL,
   101,
   110
   );

INSERT INTO employees
VALUES (
   206,
   'William',
   'Gietz',
   'WGIETZ',
   '51hr5.123.8181',
   STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
   'AC_ACCOUNT',
   8300,
   NULL,
   205,
   110
   );
   
   INSERT INTO job_history
VALUES (
   102,
   STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),
   STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),
   'IT_PROG',
   60
   );

INSERT INTO job_history
VALUES (
   101,
   STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),
   STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),
   'AC_ACCOUNT',
   110
   );

INSERT INTO job_history
VALUES (
   101,
   STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),
   STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),
   'AC_MGR',
   110
   );

INSERT INTO job_history
VALUES (
   201,
   STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),
   STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),
   'MK_REP',
   20
   );

INSERT INTO job_history
VALUES (
   114,
   STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
   STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
   'ST_CLERK',
   50
   );

INSERT INTO job_history
VALUES (
   122,
   STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
   STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
   'ST_CLERK',
   50
   );

INSERT INTO job_history
VALUES (
   200,
   STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),
   STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),
   'AD_ASST',
   90
   );

INSERT INTO job_history
VALUES (
   176,
   STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
   STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
   'SA_REP',
   80
   );

INSERT INTO job_history
VALUES (
   176,
   STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
   STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
   'SA_MAN',
   80
   );

INSERT INTO job_history
VALUES (
   200,
   STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),
   STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
   'AC_ACCOUNT',
   90
   );
   
   INSERT INTO Job_Grades 
VALUES (
   'A', 
    1000, 
    2999
    );
    
INSERT INTO Job_Grades 
VALUES (
   'B', 
    3000, 
    5999
    );
    
INSERT INTO Job_Grades 
VALUES (
   'C', 
    6000, 
    9999
    );
    
INSERT INTO Job_Grades 
VALUES (
   'D', 
    10000, 
    14999
    );
    
INSERT INTO Job_Grades 
VALUES (
   'E', 
    15000, 
    24999
    );
    
INSERT INTO Job_Grades 
VALUES (
   'F', 
    25000, 
    40000
    );
    
    select * from job_grades; 
    
    commit;
    
    -- 모든 사원은 직속 상사 및 직속 직원을 갖는다. 단 최상위 또는 최하위 직원은 직속 상사 및 직원이 없다.
    -- 소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총 수를 조회
    select *from employees 
    where employee_id not in (select manager_id from employees);
    
    select count(distinct manager_id) "count manager" from employees;
    
    -- 각 사원의 소속된 부서별로 급여합계, 급여평균, 급여 최대값, 급여 최소값을 집계하고자 한다
    -- 계산된 출력값은 6자리와 세 자리 구분기호, $표시와 함께 출력하고 부서번호의 오름차순 정렬함
    -- 단 부서에 소속되지 않은 사원에 대한 정보는 제외한다.
    select sum(salary), avg(salary), max(salary), min(salary) from employees 
    where exists(select department_id from employees) 
    group by department_id order by department_id;
    
    select department_id,
		concat('$',lpad(format(sum(salary),0),7,'0')) as 'sum salary',
        concat('$',lpad(format(avg(salary),0),7,'0')) as 'sum salary',
        concat('$',lpad(format(max(salary),0),7,'0')) as 'sum salary',
        concat('$',lpad(format(min(salary),0),7,'0')) as 'sum salary'
	from employees
    where department_id is not null
    group by department_id order by department_id;
    -- format(컬럼, 0): 천단위 콤마
    -- lpad(값, 자리수, 빈공간채울문자)
    -- concat(): 여러문자열 하나로 합치기 
    
    -- 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 업무, 급여 평균을 조회
    -- 단 업무에 사원(clerk)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 조회
    select job_id, round(avg(salary),0)
    from employees
    where job_id not like '%CLERK'
    group by job_id
    having avg(salary)>10000
    order by avg(salary) desc;
    
    -- 사원정보(employee)테이블에서 사원번호, 이름, 급여, 업무, 입사일,상사의 사원번호 조회
    -- 이때, 성과 이름을 연결하여 name이라는 별칭으로 조회
    select employee_id, concat(first_name,' ',last_name) 'name',
    salary, job_id, hire_date, manager_id
    from employees;
    
    -- 사원정보(employee)테이블에서 사원의 성과 이름은 name, 업무는 job, 급여는 salary,
    -- 연봉은 $100 보너스를 추가하여 계산값은 increased Ann_Salary, 급여에 $100보너스를 추가하여
    -- 계산한 연봉은 'Increased Salary'라는 별칭으로 조회 
	select concat(first_name,' ',last_name) 'name', job_id 'job', salary,
    salary*12+100 'increased Ann_Salary', 12*(salary+100) 'increased salary'
    from employees;
    

-- 각 사원의 소속된 부서별로 급여합계,급여 평균,급여 최대값,급여 최소값을 집계하고자 한다
-- 계산된 출력값은 6자리와 세 자리 구분기호,$ 표시와 함께 출력하고 부서번호의 오름차순 정렬함
-- 단 부서에 소속되지 않은 사원에 대한 정보는 제외한다
select department_id,
      concat('$',lpad(format(sum(salary),0),11,'0')) as "Sum Salary",
      concat('$',lpad(format(avg(salary),3),11,'0')) as "Avg Salary",
      concat('$',lpad(format(max(salary),0),11,'0')) as "Max Salary",
      concat('$',lpad(format(min(salary),0),11,'0')) as "Min Salary"
from Employees
where department_id is not null
group by department_id;

-- 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 업무,급여 평균을 조회
-- 단 업무에 사원(clerk)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 조회
select job_id,avg(salary) as "Avg Salary"
from Employees
where job_id not like '%clerk%'
group by job_id
having avg(salary) > 10000
order by avg(salary) desc;


-- 사원정보(employee) 테이블에서 모든 사원의 이름(last_name)과 연봉을
-- "이름: 1Year Salary=$연봉"형식으로 출력하고 "1 Year Salary"라는 별칭을 붙여 조회

-- Employees테이블에서 부서별로 담당하는 업무를 한 번씩만 조회
select distinct department_id,job_id
from Employees;
-- 사원정보(employee)테이블에서 급여가 $7,000~$10,000 범위 이외인 사원의 성과 이름(Name으로 별칭)
-- 급여를 급여가 작은 순서로 조회

-- 모든 사원은 직속 상사 및 직속 직원을 갖는다 단, 최상위 또는 최하위 직원은 직속 상사
-- 및 직원이 없다. 소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총 수를 조회

-- 사원정보(employee) 테이블에서 사원의 이름(last_name) 중에 'e'및'o'글자가 포함된
-- 사원을 조회 별칭은 'e and o Name'으로 조회
select last_name as 'e and o Name'
from employees
where last_name like '%e%o' and last_name like '%o%';

-- 현재 날짜 타입을 날짜 함수를 통해 확인하고 1995년 05월 20일부터 1996년 05월 20일 사이에
-- 고용된 사원들의 성과 이름(Name으로 별칭)
select str_to_date('20230330021230','%Y%m%d%h%i%s');
-- %Y : 4자리년도 %y:2자리연도 %H:00~23 %h:00~12
select sysdate();
select first_name, 

-- 모든 사원은 직속 상사 및 직속 직원을 갖는다 단 최상위 또는 최하위 직원은 직속상사
-- 및 직원이 없다. 소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총 수를 조회
-- 단 입사일이 빠른 순으로 정렬 

-- 사원정보(employee) 테이블에서 급여(Salary)와 수당을(commission_pct)에 대한 보고서를
-- 작성하려고 한다 수당을 받는 모든 사원의 성과 이름(Name으로 별칭) 급여 업무 수당율을 조회
-- 급여가 큰 순서대로 정렬하되 급여가 같으면 수당율이 큰 순서로 정렬
select concat(first_name,'',last_name) as 'name',salary,job_id,commission_pct
from Employees
where commission_pct is not null
order by salary desc,commission_pct desc;

-- 이번 분기에 60번 IT 부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다
-- 이에 해당 부서의 사원 급여를 12.3% 인상하기로 하였다 60번 IT 부서의 급여를
-- 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성 조회
-- 출력 형식은 사번,이름과 성(Name으로 별칭),급여,인상된 급여(increased Salary로 별칭)순으로 출력

select employee_id,concat(last_name,'',first_name) as "Name",
salary,round(salary*1.123,0), "Increased Salary"
 from employees
 where department_id = 60;
 
 -- 각 이름이 's'로 끝나는 사원들의 이름과 업무를 아래와 같이 출력하고자 한다
 -- 출력 시 성과 이름은 첫 글자가 대문자,업무는 모두 대문자로 출력하고 별칭은 Employee JOBs.로 표시
 -- ex) Signal Tobias is a PU_CLERK
select concat(first_name,' ',last_name,'is a',upper(job_id)) as 'loyee JOBs.'
from employees
-- where first_name like '%s' or last_name like '%s';
where substr(last_name,-1,1)='s';

-- 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다 보고서에 성과 이름(Name으로 별칭)
-- 급여,수당여부에 따른 연봉을 포함하여 출력 수당여부는 수당이 있으면 "Salary+Commision",
-- 수당이 없으면 "Salary only"라고 표시하고 별칭은 적절히 붙인다.
-- 또한 출력 시 연봉이 높은 순으로 정렬한다.
select 
case 
 when commission_pct is not null
 then salary+commission_pct 
else salary
end
from employees;

select concat(first_name,'',last_name) as "name",salary,
(salary*12) + (salary * 12*ifnull(commission_pct,0)) as "Annual Salary"
,if(commission_pct is null,'salary_only','salary+commision') as "Commission How Much?"
from employees
order by salary*12 desc;

-- 모든 사원들 성과 이름(Name으로 별칭),입사일 그리고 입사일이 어떤 요일이엿는지
-- 조회 이때 주(week)의 시작인 일요일부터 출력
select * from employees;

select concat(first_name,'',last_name) as 'name',hire_date
,case dayofweek(hire_date) 
      when 1 then '일요일'
      when 2 then '월요일'
      when 3 then '화요일'
      when 4 then '수요일'
      when 5 then '목요일'
      when 6 then '금요일'
      when 7 then '토요일'
      end as '입사요일'
from employees;
-- 모든 사원은 직속 상사 및 직속 지원을 갖는다 단 최상위 또는 최하위 직원은 직속 상사
-- 및 직원이 없다.소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원
select concat(first_name,'',last_name) as 'name',
hire_date,date_format(hire_date,'%w') as "Day of the week"
from employees
order by date_format(hire_date,'%w');

-- order by date_format(hire_date,'%w');

select date_format(date_sub(now(),interval 0 day),'%w');
select date_format(now(),'%Y%m%d%H%i%s');
select now();
select curdate();
select dayofweek(curdate());

-- 단 업무에 사원(clerk)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 조회
select job_id,avg(salary) as 'Avg Salary'
 
from employees
where job_id not like '%clerk%'
group by job_id
having avg(salary) > 10000
order by avg(salary) desc;

-- hr스키마에 존재하는 employees,Departments,Location 테이블의 구조를 파악한 후
-- Oxford에 근무하는 사원의 성과 이름(Name으로 별칭),업무,부서명,도시명으로 조회

alter table locations add foreign key(country_id) references countries(country_id);
alter table departments add foreign key(location_id) references locations(location_id);
alter table employees add foreign key(department_id) references departments(department_id);

select * from information_schema.table_constraints where table_name = 'employees';
select * from information_schema.table_constraints where table_name = 'countries'; 
select * from information_schema.table_constraints where table_name = 'departments';

select 'Han-Bit', concat(e.first_name,' ',e.last_name) "Name",
	e.job_id,d.department_name,l.city
    from employees e, departments d, locations l
    where e.department_id=d.department_id
    and d.location_id=l.location_id
    and l.city like 'Oxford';


-- Employees,Departments 테이블의 구조를 파악한 후 사원수가 5명 이상인 부서의 
-- 부서명과 사원수를 조회, 이 때 사원수가 많은 순으로 정렬 

select
department_name, count(e.employee_id)
from employees e, departments d 
where e.department_id=d.department_id 
group by d.department_name
having count(e.employee_id) >= 5 -- 5명이상인 부서
-- order by count(*) desc;
order by count(e.employee_id) desc;



-- 각 사원의 급여에 따른 급여 등급을 보고하려고 한다. 급여 등급은 Job_grades테이블에 표시된다.
-- 해당 테이블의 구조를 살펴본 후 사원의 성과 이름(Name으로 별칭), 업무, 부서명, 입사일, 급여등급을 조회

select concat(e.first_name,' ', e.last_name) 'Name', j.job_title, d.department_name, 
e.hire_date, e.salary,jg.grade_level
from employees e , job_grades jg , departments d ,jobs j
where e.department_id= d.department_id
	and e.job_id=j.job_id
	and e.salary between jg.lowest_sal and jg.highest_sal
order by grade_level;

select * from job_grades;
select * from employees;
select * from jobs;

alter table employees add foreign key(manager_id) references employees(employee_id);
select * from information_schema.table_constraints where table_name='employees';

-- 각 사원과 직속 상사와의 관계를 이용하여 다음과 같은 형식의 보고서를 작성하고자 한다. 
-- 예) 홍길동은 허균에게 보고한다. -> Eleni Zlotkey report to Steven King
-- 어떤 사원이 어떤 상사에게 보고하는지를 위 예를 참고하여 조회
-- 단 보고할 상사가 없는 사원이 있다면 그 정보도 출력하고 상사의 이름은 대문자로 출력  
-- 주의! 이너조인은 공통된 것만 조회되기 때문에 스티븐킹 안나옴!! 
select   
	concat(e.first_name,' ',e.last_name, 'report in',
    upper(concat(ifnull(m.first_name,' '),' ',ifnull(m.last_name,' '))))
	as 'Employee vs Manager'
	from employees e left join employees m
	on e.manager_id=m.employee_id;

select if(e1.manager_id is null,  
	concat(concat(e1.first_name,' ',e1.last_name),' report to nobody')
	,concat(concat(e1.first_name,' ',e1.last_name),' report to ',
	concat(upper(e2.first_name),' ',upper(e2.last_name)))) 'REPORT'
from employees e1 left join employees e2
on e1.manager_id=e2.employee_id;

-- Turker 사원(last_name)보다 급여를 많이 받고 있는 사원의 성과 이름(Name으로 별칭), 업무, 급여를 조회

select concat(first_name,' ',last_name) 'Name', job_id, salary
from employees 
where salary > (select salary from employees where last_name = 'Tucker');

-- 사원의 급여 정보 중 업무별 최소 급여를 받고 있는 사원의 성과 이름(Name으로 별칭), 업무, 급여, 입사일을 조회
select concat(first_name,' ',last_name) 'Name', job_id, salary, hire_date
from employees e1 where salary in 
(select min(salary) from employees e2 where e1.job_id=e2.job_id group by job_id);

-- 잘못된값: 그룹별 최소급여 리스트에 있는 값과 중복되는 급여가 있으면 같이 출력됨! 업무별 2~3명씩 출력됨! 
select concat(first_name," ",last_name) 'Name',job_id,salary,hire_date from employees
where salary in (select min(salary) from employees group by job_id);

select concat(e.first_name," ",e.last_name) 'Name',j.job_title,e.salary,hire_date 
from employees e,jobs j
where e.job_id=j.job_id 
and e.salary in (select min(salary) from employees e2 where e2.job_id=j.job_id group by e2.job_id);

-- 소속 부서의 평균 급여보다 많은 급여를 받는 사원에 대하여 사원의 성과 이름(name으로 별칭)
-- 급여, 부서번호, 업무를 조회 

select concat(e1.first_name," ",e1.last_name) 'Name', salary, department_id, job_id
from employees e1
where salary > (select avg(salary) from employees e2 
				where e1.department_id=e2.department_id group by e2.department_id)
order by department_id ;

-- 사원들의 지역별 근무 현황을 조회하고자 한다. 도시 이름이 영문 'o'로 시작하는 지역에 살고 잇는 사번, 이름, 업무, 입사일을 조회
select employee_id, concat(first_name," ",last_name) 'Name', job_id, hire_date, city
from employees e, departments d ,locations l 
where d.location_id=l.location_id and e.department_id=d.department_id and l.city like 'O%';

select employee_id, concat(first_name," ",last_name) 'Name', job_id, hire_date
from employees
where department_id in(
					select department_id
                    from departments
                    where location_id in(
								select location_id
                                from locations
                                where city like 'O%'));
select * from employees;
select * from locations;
select * from departments;

-- 모든 사원의 소속부서 평균연봉을 계산하여 사원별로 성과 이름(Name으로 별칭), 업무, 급여, 부서번호,
-- 부서 평균연봉(Department Avg Salary로 별칭)을 조회
select concat(e1.first_name,' ',e1.last_name) 'Name', e1.job_id, e1.salary, e1.department_id,
(select round(avg(e2.salary)) from employees e2
where e1.department_id = e2.department_id group by department_id) 'Department Avg Salary'
from employees e1;

-- employees, job_history 테이블을 이용하여 모든 사원의 현재 및 이전의 업무 이력 조회 
-- 중복된 사원정보가 있을 경우 한 번만 표시
 
select employee_id, job_id,department_id from employees
union all -- 모두출력, 중복제거 않함
select employee_id, job_id, department_id from job_history order by employee_id;

select employee_id, job_id from employees
union -- 중복제거
select employee_id, job_id from job_history order by employee_id;

-- employees테이블에 job_id는 사원의 현재 업무를 뜻하고 job_history에 job_id는 사원의 이전 업무 뜻함
-- 이 두 테이블을 교차해 보면 업무가 변경된 사원의 정보도 볼 수 있지만 이전에 한번 했던 같은 업무를 그대로 하고 있는 
-- 사원의 정보도 볼 수 있다. 이전에 한번 했던 같은 업무를 보고 있는 사원의 사번과 업무를 조회
select e.employee_id, e.job_id
from employees e, job_history j
where e.employee_id=j.employee_id and e.job_id=j.job_id;

-- 위 결과를 이용하여 출력된 176번 사원의 업무 이력의 변경 날짜 이력 조회
select employee_id,job_id,null as 'Start Date', null as 'End Date'
from employees
where employee_id=176 
-- order by employee_id;
union
select employee_id,job_id,start_date,end_date
from job_history
where employee_id=176;

-- 우리 회사는 1년에 한번 업무를 변경하여 전체적인 회사 업무를 사원들이 익히도록 하는
-- role change정책을 시행하고 있다. 이번 인사이동 때 아직 업무가 변경된 적 없는 사원들을 
-- 적합한 업무로 이동시키려고 한다. hr 스키마의 사원정보 테이블과 업무이력 정보 테이블을 이용하여
-- 한번도 업무가 변경되지 않은 사원의 사번을 조회 
select employee_id from employees where employee_id 
not in (select employee_id from job_history);

select * from employees; -- 107명
select * from jobs order by job_title;

-- 신규 프로젝트 성공으로 해당하는 각 업무 자들에 대한 급여 인상만을 결정하고
-- 다음과 같이 업무 별 금여 인상에 대해 적용하고자 한다 현재 107명의 사원은
-- 19개의 업무에 소속되 근무 중이다 이 중 5개의 업무 자들에 대한 급여 인상이 
-- 각각 결정되었고 나머지 업무에 대해서는 인상이 동결 되었다 
-- HR_REP 10% MK_REP 12% PR_REP 15% SA_REP 18% IT_PROG 20%  
select employee_id, concat(last_name,' ',first_name) as 'Name', job_id,
salary, case job_id when 'HR_REP' then round(salary*1.10) 
					when 'MK_REP' then round(salary*1.12)
                    when 'PR_REP' then round(salary*1.15)
                    when 'SA_REP' then round(salary*1.18)
                    when 'IT_PROG' then round(salary*1.20) 
                    else salary
                    end 'new salary'
from employees;

-- 2001년부터 2003년까지 입사자들의 급여를 각각 5%, 3%, 1% 인상하여 지분에 따른 배당금으로 지급하고자 한다.
-- 전체 사원들 중 해당 년도에 해당하는 사원들의 급여를 검색하여 적용하고 
-- 입사일자에 따른 오름차순 정렬
select employee_id, concat(last_name,' ',first_name) as 'Name', hire_date, salary,
case extract(year from hire_date) when 1998 then salary*1.05
								when 1997 then salary*1.03
								when 2000 then salary*1.01
                                -- else salary
                                end 'new salary'
from employees order by hire_date;
-- other ways
-- 1) case date_format(hire_date,'%Y') when '2001' 
-- 2) case when hire_date between '1998-01-01' and '1998-12-31' 

select employee_id, concat(last_name,' ',first_name) as 'Name', hire_date, salary,
case when hire_date >= '20000101'
	then salary*1.05
when hire_date between '1998-01-01' and '1998-12-31'
	then salary*1.03
when hire_date between str_to_date('1999-01-01','%Y-%m-%d') and  str_to_date('1999-12-31','%Y-%m-%d')
	then salary*1.01
	-- else salary
	end 'new salary'
from employees order by hire_date;

-- 부서별 급여 합계를 구하고 그 결과를 가지고 다음과 같이 표현하시오
-- sum salary > 100000 이면 'Excellent'
-- sum salary > 50000 이면 'Good'
-- sum salary > 10000 이면 'Medium'
-- sum salary <= 10000 이면 'Well'
select department_id, sum(salary) 'sum_sal', 
case when sum(salary) > 100000 then 'Excellent'
	when sum(salary) > 50000 then 'Good'
	when sum(salary) > 10000 then 'Medium'
	else 'Well' end 'Department Grade Salary'
from employees group by department_id; 

-- 1995년 이전에 입사한 사원 중 업무에 'mgr'이 포함된 사원은 15% 급여를 인상하고
-- 'man'이 포함된 사원은 20% 급여 인상이 정해졌고 또한 1995년부터 근무를 시작한 사원 중 
-- 'man'이 포함된 사원은 25% 급여 인상을 수행하는 쿼리 작성
select employee_id, hire_date, job_id ,salary, 
	case when hire_date < 19950101 and job_id like '%mgr%' then salary*1.15
		 when hire_date < 19950101 and job_id like '%man%' then salary*1.20
	else 
		 case when job_id like '%man%' then salary*1.25 end
	end 'Department Grade Salary'
from employees order by hire_date; 


select employee_id,concat(last_name,' ',first_name) 'Name',hire_date, job_id ,salary, 
	case 
		when hire_date < str_to_date('19950101','%Y%m%d') and job_id like '%mgr%' 
			then salary*1.15
		when hire_date < str_to_date('19950101','%Y%m%d') and job_id like '%man%' 
			then salary*1.20
		when hire_date >= str_to_date('19950101','%Y%m%d') and job_id like '%man%' 
			then salary*1.25 
		else salary
	end 'Department Grade Salary'
from employees order by hire_date; 

select * from employees order by hire_date;

select 
	case 
		when extract(month from hire_date) = 01
        -- date_format(hire_date, '%m') = '01'
        then count(*)
        else 0
	end '1 Month'
from employees
group by hire_date
order by date_format(hire_date,'%m');

