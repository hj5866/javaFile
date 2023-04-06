--����327p����~
select*from dictionary;
select table_name from user_tables;
select owner, table_name from all_tables;
--dba�� ������ ��� ���� �Ұ�
select *from dba_tables;
select * from user_indexes;
select*from user_ind_columns;

--�����Ǵ� �ε����̸�:idx_emp_sal
--�ε��� ������ �� ������ �Ǵ� ���̺��(�÷�):on emp(sal)
--�ε���:å���� ����
create index idx_emp_sal on emp(sal);
select*from user_ind_columns;
--�ε��� ����
drop index idx_emp_sal;
--view �����ϱ�
create view vw_emp20
as (select empno, ename, job, deptno from emp where deptno = 20);

select*from vw_emp20;
--������ ���� ����
select*from user_views;
--view����
drop view vw_emp20;

--rownum:�� ��ȣ, emp�� E�� ��� ����
--E.*from: E(emp)���̺��� ��� ���� �˻�
--rownum�� ��Ī�� ����ؾ���
select rownum, E.*from emp E;

--�ؿ� �������� ����ѰŶ� ��������, rownum�� ������ �ȵǾ�����.
select rownum, E.*from emp E order by sal desc;

--�ζ��� ��(�����������)
select rownum, E.*from(select*from emp E order by sal desc) E;

--�ζ��� ��(with�� ���)
--with ��Ī as ��������
--wiht��, ��Ī�� ����� ���..��������=��Ī ���(?)
with E AS (select*from emp order by sal desc) select rownum, E.*from E;

--�ζ��� ��� TOP-N�����ϱ�(�����������)
select rownum, E.*from(select *from emp E order by sal desc) E where rownum <= 3;

--�ζ��� ��� TOP-N�����ϱ�(with�� ���)
with E as(select*from emp order by sal desc) select rownum, E.* from E where rownum <= 3;

--349p ������
create table dept_sequence as select*from dept where 1<>1;
select*from dept_sequence;

create sequence seq_dept_sequence
increment by 10 --10�� ������(������)
start with 10   --���۰�: 10
maxvalue 90     --����: 90
minvalue 0      --�ּҰ�
nocycle         --�ִ밪 ���� �� ���۰����� �ٽ� �ݺ�X
cache 2;        --ĳ�� ���

select*from user_sequences;

--���������
--nextval:�Ϸù�ȣ ����, �����Ҷ����� ���� ����
insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'DATABASE','SEOUL');

select*from dept_sequence order by deptno;

--currval:������ ������ ��ȣ ��ȯ
select seq_dept_sequence.currval from dual;

--������ ����
drop sequence seq_dept_sequence;
drop table dept_sequence;

--------------------------------------------------------------------------------
--������ �ʱ�ȭ
SELECT LAST_NUMBER FROM USER_SEQUENCES  WHERE SEQUENCE_NAME = 'seq_dept_sequence';
 
--�������� ������ ���� (���簪�� 3�ϰ�� -3���� ó��)
ALTER SEQUENCE seq_dept_sequence INCREMENT BY -20;
 
--���������� ��������ŭ�� ó��
SELECT seq_dept_sequence.NEXTVAL FROM DUAL; 

--���簪�� Ȯ���غ���
SELECT seq_dept_sequence.CURRVAL FROM DUAL; 
 
--�������� ������ ���� (���󺹱�)
ALTER SEQUENCE seq_dept_sequence INCREMENT BY 10;

--���Ǿ� 355p
create synonym E for emp;
select*from E;
--�����ϱ�
drop synonym E;