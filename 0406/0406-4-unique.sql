--unique ����370p
create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel      varchar2(20));
    desc table_unique;
 
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-1234');

--unique �̱� ������, �ߺ��Ǹ� �ȵǱ⶧���� ����
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_01','PWD01','010-1234-1234');

--�н�����,tell�� not null�� ���� �Ǿ��־ �ߺ� ����
insert into table_unique(login_id,login_pwd,tel)
values('TEST_ID_02','PWD01','010-1234-1234');

--���̵� not null�� �����Ǿ� ���� �ʾ� null�� �Է� �Ǿ���.
insert into table_unique(login_id,login_pwd,tel)
values(null,'PWD01','010-1234-1234');

--���̵�� unique �̱⶧����,�ߺ��� ���� ������ �ȵǼ� test_id_03���� ����.
update table_unique set login_id='TEST_ID_03'
where login_id is null;

select*from table_unique;

--����ũ ���̺� �����(constraint ���)
create table table_unique2(
    login_id varchar2(20) constraint tblunq2_lgnid_unq unique,
    login_pwd varchar2(20) constraint tblunq2_lgnpw_nn not null,
    tel varchar2(20));
    desc table_unique2;    

--unique ���� ���� Ȯ���ϱ�
select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'table_unique%';

select*from user_constraints;

--�̹� ������ ���̺��� unique�������� �߰��ϱ�(����):�ߺ���
alter table table_unique modify(tel unique);

--tel�� ���� ��� null������ �����ϱ�
update table_unique set tel=null;

--update set���� null�� �ٲ۵� nuique�� �������� ������
alter table table_unique modify(tel unique);

--�������� �̸� ���� �����ϱ�(constraint)
alter table table_unique2 modify(tel constraint tblunq_tel_unq unique);

--�������� �̸� �����ϱ�(rename constraint)
alter table table_unique2 rename constraint tblunq_tel_unq to tblunq2_tel_unq;

--�������� ����
alter table table_unique2 drop constraint tblunq2_tel_unq;

select owner, constraint_name, constraint_type, table_name
from user_constraints where table_name like 'table_unique%';

select*from table_unique;