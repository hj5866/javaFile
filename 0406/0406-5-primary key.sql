--primary key ���̺� ����
create table table_pk(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    desc table_pk;
    
--�������� Ȯ���ϱ� 
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'TABLE_PK%';

select*from user_constraints;

--primary key�� ���� �ڵ� ������ indexȮ���ϱ�
select index_name, table_owner, table_name
from user_indexes where table_name like 'TABLE_PK%';

--���������� �̸� ���� �����ϸ� ���̺� �����ϱ�
create table table_pk2(
    login_id varchar2(20) constraint tblpk2_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblpk2_lgnpw_nn not null,
    tel varchar2(20));
    desc table_pk2; 

--���̺� ������ �Է�    
insert into table_pk(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-5678');

select*from table_pk;

--primary key�� �ߺ���� X(����)
insert into table_pk(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-5678');

--primary key�� null�� ��� X
insert into table_pk(login_id,login_pwd,tel)
values(null,'PWD01','010-1234-5678');