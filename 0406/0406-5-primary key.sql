--primary key 테이블 생성
create table table_pk(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    desc table_pk;
    
--제약조건 확인하기 
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'TABLE_PK%';

select*from user_constraints;

--primary key를 통해 자동 생성된 index확인하기
select index_name, table_owner, table_name
from user_indexes where table_name like 'TABLE_PK%';

--제약조건의 이름 직접 지정하며 테이블 생성하기
create table table_pk2(
    login_id varchar2(20) constraint tblpk2_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblpk2_lgnpw_nn not null,
    tel varchar2(20));
    desc table_pk2; 

--테이블에 데이터 입력    
insert into table_pk(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-5678');

select*from table_pk;

--primary key는 중복허용 X(에러)
insert into table_pk(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-5678');

--primary key는 null값 허용 X
insert into table_pk(login_id,login_pwd,tel)
values(null,'PWD01','010-1234-5678');