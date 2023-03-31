--sal(월급)의 합계 구하기
select sum(sal) from emp;

--데이터 개수 구하기
--count(*):모든 레코드 개수 구하기
select count(*) from emp;
select count(ename) from emp;
--count(): null이 아닌 데이터 개수만 구함.
select count(comm) from emp;

--월급 많이 받는 사람의 데이터
select max(sal) from emp;
--부서번호가 10번인 사원의 최대 급여
select max(sal) from emp where deptno=10;
--부서번호가 20인 사원의 입사일 중 제일 최근 입사일
select max(hiredate) from emp where deptno=20; 
--월급 적게 받는 사람의 데이터
select min(sal) from emp;
--부서번호가 20인 사원의 입사일 중 제일 오래된 입사일
select min(hiredate) from emp where deptno=20; 
--부서번호가 30인 사원들의 평균 급여 출력
select avg(sal) from emp where deptno=30;

--부서번호가 10인 데이터의 월급의 평균 구하기
select avg(sal), '10' as deptno from emp where deptno=10
union all
select avg(sal), '20' as deptno from emp where deptno=20
union all
select avg(sal), '30' as deptno from emp where deptno=30;

--group by : 같은 값끼리 그룹으로 묶어줌 (위의 예제 단축버전)
select avg(sal),deptno from emp
group by deptno;

--그룹기준(1차:부서번호,2차:직업) group by
--정렬기준(1차:부서번호,2차:직업) order by
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

--emp테이블에서 deptno,job,평균월급 검색
--평균 월급이 2000이상인 데이터만 부서별, 직업별로 그룹 설정
--부서기준, 직업기준으로 오름차순 정렬
select deptno, job, avg(sal)
    from emp
    group by deptno, job
        having avg(sal) >= 2000 --having은 무조건 group by뒤
    order by deptno, job;
    
--emp테이블에서 월급이 3000이하인 데이터만
--deptno,job,평균월급 검색
--평균 월급이 2000이상인 데이터만 부서별, 직업별로 그룹 설정
--where절이 함께 사용
select deptno, job, avg(sal)
    from emp
    where sal <= 3000
    group by deptno, job
        having avg(sal) >= 2000
    order by deptno, job;
    
-- roll up:그룹별 결과를 출력하고 ,마지막 총 합계 데이터 출력
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
    from emp
group by rollup(deptno, job)
order by deptno, job;

--grouping sets
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job)
order by deptno, job;

--grouping: rollup 이나 cube랑만 같이 쓸수있다.
select deptno, job, count(*), max(sal), sum(sal), avg(sal),
    grouping(deptno),grouping(job)
from emp
group by cube(deptno, job)
order by deptno,job;

--listagg 교재207p
--within group은 listagg, rank, dense_rank와 함께 사용
--집계 대상의 데이터의 정렬을 지정함
select deptno,
    listagg(ename,',')
   within group(order by ename asc) as enames
   from emp
   group by deptno;
 
--pivot 교재208p
--부서번호가 10,20,30중에 속하는 데이터에서
--월급이 가장 많은 데이터만 골라서 표시(부서번호를 열로)  
select *from
    (select deptno, job, sal from emp)
    pivot(max(sal)
        for deptno in (10, 20, 30))
    order by job;