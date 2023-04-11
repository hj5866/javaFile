--447p 레코드
DECLARE
--레코드 선언
    TYPE REC_DEPT IS RECORD(
    --deptno변수를 정수형2자리로 선언하고 99대입
    DEPTNO NUMBER(2) NOT NULL := 99,
    --dname 변수를 dept테이블의 dname컬럼의 자료형과 같게 선언
    DNAME DEPT.DNAME%TYPE,
    --loc변수를 dept테이블의 loc컬럼의 자료형과 같게 선언
    LOC DEPT.LOC%TYPE
    );
    --변수 dept_rec를 자료형 레코드형으로 선언
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('DEPTNO :'|| dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME :'|| dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('LOC :'|| dept_rec.loc);
    END;
   
CREATE TABLE DEPT_RECORD
AS SELECT*FROM DEPT;

SELECT*FROM DEPT_RECORD;

