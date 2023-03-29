-- as 사용하면 별칭 붙이기 가능
select ename as 이름, sal as 월급, sal*12+comm as 연봉,comm as 추가급여 from emp;

-- as로 하나만 바꾸고싶으면, 나열 한 뒤 거기에 as를 쓴다 select*from 사이에 쓸 수 없음!
-- desc를 뒤에 붙이면 오름차순 정렬이 가능하다.
select empno,ename,job,mgr hiredate, sal as 월급,comm,deptno 
from emp order by sal desc;

-- order by = 정렬
-- 1차기준:deptno(오름차순), 2차기준: sal(내림차순)
select * from emp order by deptno asc, sal desc;

-- emp테이블의 job열 데이터를 중복없이 출력하기
select distinct job from emp;

-- 92페이지 3-1번
select * from emp;
-- 92페이지 3-2번
select empno as employee_no, ename as employee_name, mgr as manager,
sal as salary, comm as commission, deptno as derartment_no from emp;
-- 92페이지 3-3번 //desc(내림차순) asc(오름차순)
select * from emp order by deptno desc,ename asc;
-- 3문제 합침
select empno as employee_no, ename as employee_name, mgr as manager,
sal as salary, comm as commission, deptno as derartment_no from emp
order by deptno desc, ename asc;

-- where 뒤 조건
select*from emp where deptno=30;
-- 번호가 30이면서 jop이 SALESMAN인것 출력
select*from emp where deptno=30 and job = 'SALESMAN';
-- 번호가 30이거나 jop이 CLERK인것 출력
select*from emp where deptno=30 or job = 'CLERK';

select *from emp where sal*12=36000;
select* from emp where sal >= 3000;
-- 이름의 앞글자의 아스키코드값이 F보다 크거나작은것
select*from emp where ename >= 'F';
-- 문자열은 차례대로 앞글자부터 한글자씩 비교함
select*from emp where ename <= 'FORZ';
-- 이름이 SMITH가 아닌게 아닌것(not)
select*from emp where not ename !='SMITH';

--job의 값이 'MANAGER','SALESMAN','CLERK'인값 출력하기
select*from emp where job in ('MANAGER','SALESMAN','CLERK');
--job의 값이 'MANAGER','SALESMAN','CLERK'이 아닌값 출력하기
select*from emp where job not in ('MANAGER','SALESMAN','CLERK');

-- a값과 b값의 사이:between
select*from emp where sal between 2000 and 3000;
select*from emp where sal not between 2000 and 3000;

--교재111 참조, S로 시작하는 문자열을 출력
select*from emp where ename like 'S%';
--두번째 글자가 L인 문자열 출력
select*from emp where ename like '_L%';

-- is null = 값이 없는것
select*from emp where comm is null;
select*from emp where comm is not null;

select*from emp where sal > null or comm is null;

-- union(합집합)테이블 합치기 교재119p 
select empno,ename,sal,deptno from emp where deptno =10
union
select empno,ename,sal,deptno from emp where deptno =20;
--자료형(데이터타입)이 같다면 union 가능
select empno, ename, deptno from emp where deptno=10
union
select sal, job, deptno from emp where deptno=20;

--다른 테이블 합치기(열 이름은 앞에 작성한 select절의 열 이름을 사용한다)
select empno,ename,job from emp where deptno=30
union
select deptno,dname,loc from dept where deptno=30;
-- union all(중복 데이터도 함께 출력)
select empno,ename,sal,deptno from emp where deptno=10
union all
select empno,ename,sal,deptno from emp where deptno=10;

-- minus(차집합) deptno의 10값을 제외한 값이 출력
select empno,ename,sal,deptno from emp
minus
select empno,ename,sal,deptno from emp where deptno=10;

--intersect(교집합) deptno의 겹치는 10값이 출력
select empno,ename,sal,deptno from emp
intersect
select empno,ename,sal,deptno from emp where deptno=10;
