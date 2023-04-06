--365p 제약조건
select owner,constraint_name, constraint_type, table_name
from user_constraints;

create table table_notnull2(
    login_id varchar2(20) constraint tblnn2_lgnid_nn not null,
    login_pwd varchar2(20) constraint tblnn2_lgnpw_nn not null,
    tel      varchar(20));
    
    select owner, constraint_name, constraint_type, table_name
    from user_constraints;
    
--tel열에 not null조건 추가하기

--alter table:테이블 수정
alter table table_notnull2 modify(tel not null);

select*from table_notnull2;

insert into table_notnull2 (login_id, login_pwd, tel)
values('doong98','1234','010-5555-4533');

select owner,constraint_name,constraint_type,table_name from user_constraints;

--368p 이미 생성된 제약 조건 이름 변경하기
alter table table_notnull2
rename constraint sys_c0011078 to tblnn2_tel_nn;

--제약조건 삭제
alter table table_notnull2
drop constraint tblnn2_tel_nn;

desc table_notnull2;   






