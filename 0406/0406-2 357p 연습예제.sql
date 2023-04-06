--1��
--1-1
create table empidx as select*from emp;
drop table empidx;
--1-2
create index idx_empidx_empno on empidx(empno);
--1-3
select*from user_ind_columns;

select*from empidx;

--2��
--or replace:��ü �����ؾ� �Ѵ�.
create or replace view empidx_over15k
as(select empno,ename,job,deptno,sal,nvl2(comm,'O','X')as comm from empidx where sal > 1500);

select*from empidx_over15k;
drop view empidx_over15k;

--3��

--deptseq ���̺� ����(dept���̺��� ������ ���ڵ� ����)
create table deptseq 
   as select * from dept;
select * from deptseq;

--������ ����(������:1, ���۰�:1, �ִ밪:99,�ּҰ�:1)
create sequence seq_dept
    increment by 1
    start with 1
    maxvalue 99
    minvalue 1
    nocycle
    nocache;
    
--������ Ȯ��
select * from user_sequences;

--������ ����
drop sequence seq_dept;

--deptseq���̺� seq_dept�������� �����Ͽ� ������ �Է�
insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'DATABASE','SEOUL');

insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'WEB','BUSAN');

insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'MOBILE','ILSAN');

--�������� ���� ��(currval) Ȯ��
select seq_dept.currval from dual;

--deptseq���̺��� ��� ���� ǥ��
select * from deptseq;

--���ڵ� ����
delete from deptseq where deptno=0;


