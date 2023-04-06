--교재327p부터~
select*from dictionary;
select table_name from user_tables;
select owner, table_name from all_tables;
--dba는 권한이 없어서 열람 불가
select *from dba_tables;
select * from user_indexes;
select*from user_ind_columns;

--생성되는 인덱스이름:idx_emp_sal
--인덱스 생성할 때 기준이 되는 테이블명(컬럼):on emp(sal)
--인덱스:책갈피 개념
create index idx_emp_sal on emp(sal);
select*from user_ind_columns;
--인덱스 삭제
drop index idx_emp_sal;
--view 생성하기
create view vw_emp20
as (select empno, ename, job, deptno from emp where deptno = 20);

select*from vw_emp20;
--데이터 사전 보기
select*from user_views;
--view삭제
drop view vw_emp20;

--rownum:행 번호, emp를 E로 약어 지정
--E.*from: E(emp)테이블의 모든 정보 검색
--rownum은 약칭을 사용해야함
select rownum, E.*from emp E;

--밑에 서브쿼리 사용한거랑 차이점은, rownum이 정렬이 안되어있음.
select rownum, E.*from emp E order by sal desc;

--인라인 뷰(서브쿼리사용)
select rownum, E.*from(select*from emp E order by sal desc) E;

--인라인 뷰(with절 사용)
--with 별칭 as 서브쿼리
--wiht는, 별칭을 만들어 사용..서브쿼리=별칭 취급(?)
with E AS (select*from emp order by sal desc) select rownum, E.*from E;

--인라인 뷰로 TOP-N추출하기(서브쿼리사용)
select rownum, E.*from(select *from emp E order by sal desc) E where rownum <= 3;

--인라인 뷰로 TOP-N추출하기(with절 사용)
with E as(select*from emp order by sal desc) select rownum, E.* from E where rownum <= 3;

--349p 시퀀스
create table dept_sequence as select*from dept where 1<>1;
select*from dept_sequence;

create sequence seq_dept_sequence
increment by 10 --10씩 증가함(증가값)
start with 10   --시작값: 10
maxvalue 90     --끝값: 90
minvalue 0      --최소값
nocycle         --최대값 도달 시 시작값부터 다시 반복X
cache 2;        --캐시 사용

select*from user_sequences;

--시퀀스사용
--nextval:일련번호 생성, 실행할때마다 값이 증가
insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'DATABASE','SEOUL');

select*from dept_sequence order by deptno;

--currval:마지막 생성된 번호 반환
select seq_dept_sequence.currval from dual;

--시퀀스 삭제
drop sequence seq_dept_sequence;
drop table dept_sequence;

--------------------------------------------------------------------------------
--시퀀스 초기화
SELECT LAST_NUMBER FROM USER_SEQUENCES  WHERE SEQUENCE_NAME = 'seq_dept_sequence';
 
--시퀀스의 증가값 변동 (현재값이 3일경우 -3으로 처리)
ALTER SEQUENCE seq_dept_sequence INCREMENT BY -20;
 
--다음값으로 증가값만큼의 처리
SELECT seq_dept_sequence.NEXTVAL FROM DUAL; 

--현재값을 확인해본다
SELECT seq_dept_sequence.CURRVAL FROM DUAL; 
 
--시퀀스의 증가값 변동 (원상복구)
ALTER SEQUENCE seq_dept_sequence INCREMENT BY 10;

--동의어 355p
create synonym E for emp;
select*from E;
--삭제하기
drop synonym E;