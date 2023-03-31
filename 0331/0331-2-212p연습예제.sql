--1��
select deptno,trunc(avg(sal))as AVG_SAL, max(sal)as MAX_SAL, min(sal)as MIN_SAL, count(*) as CNT
from emp
group by deptno;

--2��
select job,count(*)
from emp
group by job
having count(*)>=3;

--3��
--to_char()�� ������� string
--extrack()�� ������� number
select to_char(hiredate,'YYYY') as HIRE_YEAR, deptno, count(*)
from emp
group by to_char(hiredate,'YYYY'),deptno;

--4��
select nvl2(comm,'O','X') as EXIST_COMM,count(*) as cnt
from emp
group by nvl2(comm,'O','X');

--5��
select deptno,to_char(hiredate,'YYYY')as HIRE_TEAR,count(*)as CNT,max(sal)as MAX_SAL,sum(sal)as SUM_SAL,avg(sal)as AVG_SAL
from emp
group by rollup (deptno,to_char(hiredate,'YYYY'));




