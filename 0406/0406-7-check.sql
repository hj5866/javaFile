--check�������� �����ϸ� ���̺� ����
create table table_check(
    login_id varchar2(20) constraint tblck_loginid_pk primary key,
    login_pwd varchar2(20) constraint tblck_loginpw_ck check(length(login_pwd) >3),
    tel varchar2(20));
    desc table_check;

--check���� ������, �������� ������ �������ִ�.
--ex) ��й�ȣ�� 3�ڸ��� �Է��ϸ� ����   
insert into table_check 
values ('TEST_ID','1234','010-1234-5678');

--�������� Ȯ��(C)
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'TABLE_CHECK%';