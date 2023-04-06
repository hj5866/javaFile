--1번
--1-1
create table empidx as select*from emp;
drop table empidx;
--1-2
create index idx_empidx_empno on empidx(empno);
--1-3
select*from user_ind_columns;

select*from empidx;

--2번
--or replace:대체 가능해야 한다.
create or replace view empidx_over15k
as(select empno,ename,job,deptno,sal,nvl2(comm,'O','X')as comm from empidx where sal > 1500);

select*from empidx_over15k;
drop view empidx_over15k;

--3번

--deptseq 테이블 생성(dept테이블의 구조와 레코드 복사)
create table deptseq 
   as select * from dept;
select * from deptseq;

--시퀀스 생성(증가값:1, 시작값:1, 최대값:99,최소값:1)
create sequence seq_dept
    increment by 1
    start with 1
    maxvalue 99
    minvalue 1
    nocycle
    nocache;
    
--시퀀스 확인
select * from user_sequences;

--시퀀스 삭제
drop sequence seq_dept;

--deptseq테이블에 seq_dept시퀀스를 적용하여 데이터 입력
insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'DATABASE','SEOUL');

insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'WEB','BUSAN');

insert into deptseq (deptno,dname,loc)
values (seq_dept.nextval,'MOBILE','ILSAN');

--시퀀스의 현재 값(currval) 확인
select seq_dept.currval from dual;

--deptseq테이블의 모든 정보 표시
select * from deptseq;

--레코드 삭제
delete from deptseq where deptno=0;


