--365p ��������
select owner,constraint_name, constraint_type, table_name
from user_constraints;

create table table_notnull2(
    login_id varchar2(20) constraint tblnn2_lgnid_nn not null,
    login_pwd varchar2(20) constraint tblnn2_lgnpw_nn not null,
    tel      varchar(20));
    
    select owner, constraint_name, constraint_type, table_name
    from user_constraints;
    
--tel���� not null���� �߰��ϱ�

--alter table:���̺� ����
alter table table_notnull2 modify(tel not null);

select*from table_notnull2;

insert into table_notnull2 (login_id, login_pwd, tel)
values('doong98','1234','010-5555-4533');

select owner,constraint_name,constraint_type,table_name from user_constraints;

--368p �̹� ������ ���� ���� �̸� �����ϱ�
alter table table_notnull2
rename constraint sys_c0011078 to tblnn2_tel_nn;

--�������� ����
alter table table_notnull2
drop constraint tblnn2_tel_nn;

desc table_notnull2;   






