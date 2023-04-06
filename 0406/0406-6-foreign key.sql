--foreign key:���� �ٸ� ���̺� �� ���踦 �����ϴµ� ����ϴ� ���� ����
--���������� ������ ���� �ٸ� ���̺��� Ư�� ������ �����ϰڴٴ� �ǹ̷� ����
--�ܷ�Ű,�ܺ�Ű ��� �θ���

--emp���̺�� dept���̺��� ���� ���� ����
select owner, constraint_name, constraint_type, table_name, R_owner, R_constraint_name
from user_constraints
where table_name in('EMP','DEPT');

--foreign key�� �����ϴ� ���� �������� �ʴ� ������ �Է½�(����)
--dept ���̺��� deptno�� 50�� �������� �ʴ´�.
insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','CLERK','7788',to_date('2017/04/30','YYYY/MM/DD'),1200,null,50);

--���̺� ����
create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dename varchar2(14),
    loc    varchar2(13));
    desc dept_fk;
   

create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key,
    ename varchar2(10),
    job   varchar2(9),
    mgr   number(4),
    hiredate date,
    sal   number(7,2),
    comm  number(7,2),
    deptno number(2) constraint empfk_deptno_fk references dept_fk (deptno));
    desc emp_fk;

--emp_fk ���̺� ������ ����(deptno �����Ͱ� ���� ���̺� ��� ����)    
insert into emp_fk
values(9999,'TEST_NMAME','TEST_JOB',null,to_date('2001/01/01','YYYY/MM/DD'),3000,null,10);

--dept_fk���̺� �μ���ȣ 10 ����
insert into dept_fk
values(10,'TEST_DNAME','TEST_LOC');
select*from dept_fk;

--�������� ���������� ����
insert into emp_fk
values(9999,'TEST_NMAME','TEST_JOB',null,to_date('2001/01/01','YYYY/MM/DD'),3000,null,10);
select*from emp_fk;

--������ ����(����):deptno���� �����ϴ� �����Ͱ� �����ϱ� ����
--����387p ������ �����ϴ� ��� ����
delete from dept_fk where deptno = 10;