--450p 레코드에 다른 레코드 포함하기
DECLARE
--rec_dept라는 이름의 레코드 선언
    TYPE REC_DEPT IS RECORD(
        --deptno변수 선언, 자료형은 dept테이블의 deptno와 같게
        deptno DEPT.DEPTNO%TYPE,
        --dname변수 선언, 자료형은 dept테이블의 dname 컬럼과 같게
        dname DEPT.DNAME%TYPE,
        --loc변수 선언, 자료형은 dept테이블의 loc컬럼과 같게
        loc DEPT.LOC%TYPE
    );
    --rec_emp라는 이름의 레코드 선언
    TYPE REC_EMP IS RECORD(
        --empno라는 변수 선언, emp테이블의 empno컬럼과 같은 자료형
        empno EMP.EMPNO%TYPE,
        --ename라는 변수 선언, emp테이블의 ename컬럼과 같은 자료형
        ename EMP.ENAME%TYPE,
        --rec_dept레코드형을 자료형으로 사용하는 변수 dinfo 선언
        dinfo REC_DEPT
    );
    --emp_rec 선언, 자료형은 rec_emp레코드를 사용
    emp_rec REC_EMP;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO emp_rec.empno, emp_rec.ename,
    emp_rec.dinfo.deptno,
    emp_rec.dinfo.dname,
    emp_rec.dinfo.loc
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.EMPNO = 7788;
    
    DBMS_OUTPUT.PUT_LINE('EMPNO:'|| emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('ENAME:'|| emp_rec.ename);
    
    DBMS_OUTPUT.PUT_LINE('EMPNO:'|| emp_rec.dinfo.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME:'|| emp_rec.dinfo.dname);
    DBMS_OUTPUT.PUT_LINE('LOC:'|| emp_rec.dinfo.loc);
END;