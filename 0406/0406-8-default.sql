--default:특정 열에 저장할 값이 지정되지 않은 경우에 기본값(default)지정 가능

--default제약조건 설정하며 테이블 만들기
create table table_default(
    login_id varchar2(20) constraint tblck2_loginid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));
    desc table_default;

--두번째 insert into에서, 패스워드를 지정하지 않아 기본값 1234가 저장된 모습.   
insert into table_default values('TEST_ID',null,'010-1234-5678');
insert into table_default (login_id, tel) values ('TEST_ID2','010-1234-5678');
select*from table_default;