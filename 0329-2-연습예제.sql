--교재125p 연습예제
--1번
select*from emp where ename like '%S';
--2번
select empno,ename,job,sal,deptno from emp where job='SALESMAN' and deptno=30;
--3번 집합연산자를 사용하지 않은 방식
select empno,ename,job,sal,deptno from emp where sal>2000 and deptno=20 or deptno=30;
--3번 집합연산자를 사용한 방식
select empno,ename,job,sal,deptno from emp where deptno=20
union
select empno,ename,job,sal,deptno from emp where deptno=30
intersect
select empno,ename,job,sal,deptno from emp where sal>2000;
--4번
select*from emp where not (sal >= 2000 and sal <=3000);
--5번
select ename,empno,sal,deptno from emp where ename like '%E%'and deptno=30 and sal not between 1000 and 2000;
--6번
select*from emp where comm is null and job !='PRESIDENT' and job in('MANAGER','CLERK') and ename not like '__L%';