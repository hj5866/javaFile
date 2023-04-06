--foreign key:서로 다른 테이블 간 관계를 정의하는데 사용하는 제약 조건
--제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조하겠다는 의미로 지정
--외래키,외부키 라고도 부른다

--emp테이블과 dept테이블의 제약 조건 보기
select owner, constraint_name, constraint_type, table_name, R_owner, R_constraint_name
from user_constraints
where table_name in('EMP','DEPT');

--foreign key가 참조하는 열에 존재하지 않는 데이터 입력시(에러)
--dept 테이블의 deptno는 50이 존재하지 않는다.
insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','CLERK','7788',to_date('2017/04/30','YYYY/MM/DD'),1200,null,50);

--테이블 생성
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

--emp_fk 테이블에 데이터 삽입(deptno 데이터가 아직 테이블에 없어서 에러)    
insert into emp_fk
values(9999,'TEST_NMAME','TEST_JOB',null,to_date('2001/01/01','YYYY/MM/DD'),3000,null,10);

--dept_fk테이블에 부서번호 10 삽입
insert into dept_fk
values(10,'TEST_DNAME','TEST_LOC');
select*from dept_fk;

--에러없이 정상적으로 실행
insert into emp_fk
values(9999,'TEST_NMAME','TEST_JOB',null,to_date('2001/01/01','YYYY/MM/DD'),3000,null,10);
select*from emp_fk;

--데이터 삭제(에러):deptno값을 참조하는 데이터가 존재하기 때문
--교재387p 데이터 삭제하는 방법 참조
delete from dept_fk where deptno = 10;