--check제약조건 설정하며 테이블 생성
create table table_check(
    login_id varchar2(20) constraint tblck_loginid_pk primary key,
    login_pwd varchar2(20) constraint tblck_loginpw_ck check(length(login_pwd) >3),
    tel varchar2(20));
    desc table_check;

--check제약 조건은, 데이터의 범위가 정해져있다.
--ex) 비밀번호를 3자리로 입력하면 오류   
insert into table_check 
values ('TEST_ID','1234','010-1234-5678');

--제약조건 확인(C)
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'TABLE_CHECK%';