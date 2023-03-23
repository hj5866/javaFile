-- 데이터베이스 생성
create database cookDB;
use cookdb;
create table userTBL
( userID char(8) not null primary key,
userName varchar(10) not null,
birthYear int not null,
addr char(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mDate date);

create table buyTBL
(num int auto_increment not null primary key,
userID char(8) not null,
prodName char(6) not null,
proupName char(4),
price int not null,
amount smallint not null,
foreign key (userID) references userTBL (userID));
-- foreign key(FK)(외래키):두개의 테이블을 연결할 때 사용 외래키는 부모 테이블의 기본키 값과 동일(참조 무결성 제약조건)