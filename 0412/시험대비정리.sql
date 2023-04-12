--테이블 구조만 복사하는 질의어
CREATE TABLE EMP_RECORD2 AS SELECT*FROM EMP WHERE 1<>1;

--시험 정리
--DISTINCT 디스팅트 : 중복 제거 //교재
SELECT DISTINCT 컬럼 FROM 테이블

--BETWEEN A AND B
--급여가 2000~3000사이인 사원 데이터를 조회해야 한다면?
select * from emp where sal between 2000 and 3000;

--대소문자 바꿔주는 문자 함수
--upper : 문자 데이터를 모두 대문자로 변환
--lower : 문자 데이터를 모두 소문자로 변환
--initcap : 첫글자를 대문자로 , 나머지 문자를 소문자로
select ename,upper(name),lower(ename),initcap(ename) from emp;
--예)사원 이름이 'SCOTT'인 데이터 찾기
select*from emp where upper(ename) = upper('scott');
--예)사원 이름에 'SCOTT'단어를 포함한 데이터 찾기
select*from emp where upper(ename) like upper('%scott%');

--문자열 일부를 추출하는 SUBSTR
select job, substr(job,1,2), substr(job, 3,2), substr(job, 5) from emp;
-- substr(job,1,2)의 의미: 예를들어 clerk의 첫번째 글자부터 두글자 출력 // cl
-- substr(job,3,2)의 의미: 예를들어 clerk의 세번째 글자부터 두글자 출력 // le
-- substr(job, 5)의 의미: 예를들어 clerk의 다섯번째 글자부터 끝까지 출력 // k

--특정문자를 다른문자로 바꾸는 replace
select '010-1234-5678' as replace_before,
replace('010-1234-5678', '-', ' ') -- 010 1234 5678
replace('010-1234-5678', '-') -- 01012345678
from dual;

--조건 where, having 차이
--where : 조회할 행을 선별하는 조건식
--having : 출력 그룹을 제한하는 조건식
--emp테이블의 붑서별 직책의 평균급여가 500이상인 사원들의 부서번호,직책,부서별 직책의 평균급여 출력
select deptno,job,avg(sal)as 평균급여
from emp
group by deptno,job
having avg(sal) >= 500;

--insert into 서브쿼리를 이용해 데이터 추가 교재275P

--update set: 데이터 수정하기
--전체수정 : dept_temp2의 loc컬럼을 seoul로 전부 수정
update dept_temp2 set loc ='SEOUL';
--일부분수정: where 절을 이용한다. DEPTNO가 40인 dname,loc를 수정.
update dept_temp2 set dname = 'DATABASE', LOC= 'SEOUL'
WHERE DEPTNO = 40;
--수정 되돌리기
rollback;
--서브쿼리로 데이터 수정하기 교재280p

--alter:테이블 변경 317p
--emp참조한 테이블 만듦
create table emp_alter as select * from emp;
select * from emp_alter;

--ADD:열 추가
alter table emp_alter add hp varchar2(20);

--RENAME:열 이름 변경
alter table emp_alter rename column hp to TEL;
select * from emp_alter;

--열의 자료형 변경
alter table emp_alter 
modify empno number(5);
desc emp_alter; --구조 확인

--열 삭제
alter table emp_alter --테이블
drop column tel; --컬럼
select*from emp_alter;

--테이블 이름 변경하기
rename emp_alter to emp_rename;

--내부조인
--요리사 이름이 백종원,테츠야,스티브인 데이터에 해당하는 레코드 출력
--출력형식:아이디,음식명,음식점,음식점분류번호,요리사
select F.아이디,F.음식명,F.음식점,F.음식점분류번호,S.요리사
from food F ,store S
where F.음식점분류번호=S.음식점분류번호
and 요리사 in('백종원','테츠야','스티브');


--food테이블에서 가격이 10000~20000 사이인 데이터 출력
--출력형식:아이디,음식점,가격,요리사
select F.아이디,F.음식점,F.가격,S.요리사
from food F, store S
where F.음식점분류번호=S.음식점분류번호
and F.가격 between 10000 and 20000
order by 가격;

--외부조인

--store테이블에 food테이블을 외부조인하기
--음식점분류번호 컬럼 이용, store테이블과 food테이블의 모든 컬럼 출력
select*
from store S left outer join food F on(S.음식점분류번호=F.음식점분류번호);

--left join과 right join의 결과가 다른이유는,
--dept테이블에만,deptno 40번이 있기 때문에
--이 코드에서 left outer join을 해야 dept테이블이 기준이 된다.
--결과물에서 deptno을 기준으로 두 테이블이 join되었기 때문에,
--조건식에서 E.deptno=D.deptno가 된것.ㄴ
select D.deptno,D.dname,E.empno,E.ename,E.job,E.sal
from dept D left outer join emp E
--emp테이블의 부서번호와, dept테이블의 부서번호가 같으면,
on(E.DEPTNO=D.DEPTNO)
order by D.deptno,E.ename;

--제약조건 추가하기
create table food(
    아이디 number(2) constraint food_id primary key,
    음식명 varchar2(20) constraint food_name unique,
    음식종류 varchar2(10),
    음식점 varchar2(20) constraint food_store not null,
    전화번호 varchar2(13) constraint food_tel not null,
    이메일 varchar2(20),
    음식점분류번호 number(4) constraint food_store_num not null
    );
    desc food;
 --foreign key 설정하는 방법   
deptno number(2) constraint empfk_deptno_fk references dept_fk (deptno));


ALL > 1,2,3,4,5 -- 최댓값
ALL < 1,2,3,4,5 -- 최솟값

ANY > 1,2,3,4,5-- 최솟값
ANY < 1,2,3,4,5-- 최댓값

1 -> 2,3,4, <- 5 -- ANY
<- 1,......,5 -> -- ALL

--다중행 서브쿼리 255P
SELECT * FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL ASC;
800                             2950 3000 5000
    950 1250 1250 1500 1600 2850

부서번호가 30인 사원의 최대 급여보다 높은 급여를 가진 사원의 모든 정보를 출력하세요.
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
부서번호가 30인 사원의 최소 급여보다 낮은 급여를 가진 사원의 모든 정보를 출력하세요.
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);
 
부서번호가 30인 사원의 최대 급여보다 낮은 급여를 가진 사원의 모든 정보를 출력하세요.
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);
부서번호가 30인 사원의 최소 급여보다 높은 급여를 가진 사원의 모든 정보를 출력하세요.
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--다중열 서브쿼리 258p
select*from emp where (deptno,sal) in (select deptno, max(sal) from emp group by deptno);
--emp 테이블에서 부서번호별 최대급여를 출력해주세요.