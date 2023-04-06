--unique 교재370p
create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel      varchar2(20));
    desc table_unique;
 
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-1234');

--unique 이기 때문에, 중복되면 안되기때문에 에러
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-1234');

--패스워드,tell은 not null만 적용 되어있어서 중복 가능
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_02','PWD01','010-1234-1234');

--아이디에 not null이 설정되어 있지 않아 null이 입력 되었다.
insert into table_unique(login_id,login_pwd,tel)
values(null,'PWD01','010-1234-1234');

--아이디는 unique 이기때문에,중복된 값을 넣으면 안되서 test_id_03으로 수정.
update table_unique set login_id='TEST_ID_03'
where login_id is null;

select*from table_unique;

--유니크 테이블 만들기(constraint 사용)
create table table_unique2(
    login_id varchar2(20) constraint tblunq2_lgnid_unq unique,
    login_pwd varchar2(20) constraint tblunq2_lgnpw_nn not null,
    tel varchar2(20));
    desc table_unique2;    

--unique 제약 조건 확인하기
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'table_unique%';

select*from user_constraints;

--이미 생성한 테이블열에 unique제약조건 추가하기(에러):중복값
alter table table_unique modify(tel unique);

--tel열 값을 모두 null값으로 변경하기
update table_unique set tel=null;

--update set으로 null로 바꾼뒤 nuique로 제약조건 설정함
alter table table_unique modify(tel unique);

--제약조건 이름 직접 지정하기(constraint)
alter table table_unique2 modify(tel constraint tblunq_tel_unq unique);

--제약조건 이름 수정하기(rename constraint)
alter table table_unique2 rename constraint tblunq_tel_unq to tblunq2_tel_unq;

--제약조건 삭제
alter table table_unique2 drop constraint tblunq2_tel_unq;

select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'table_unique%';

select*from table_unique;