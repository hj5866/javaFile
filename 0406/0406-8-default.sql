--default:Ư�� ���� ������ ���� �������� ���� ��쿡 �⺻��(default)���� ����

--default�������� �����ϸ� ���̺� �����
create table table_default(
    login_id varchar2(20) constraint tblck2_loginid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));
    desc table_default;

--�ι�° insert into����, �н����带 �������� �ʾ� �⺻�� 1234�� ����� ���.   
insert into table_default values('TEST_ID',null,'010-1234-5678');
insert into table_default (login_id, tel) values ('TEST_ID2','010-1234-5678');
select*from table_default;