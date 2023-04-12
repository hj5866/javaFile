--457p ~ 연습예제
--1-1번
CREATE TABLE EMP_RECORD2 AS SELECT*FROM EMP WHERE 1<>1;
select*from emp_record2;
--1-2번
DECLARE
    TYPE REC_EMP IS RECORD(
    EMPNO EMP.EMPNO%TYPE NOT NULL := 1111,
    ENAME EMP.ENAME%TYPE,
    JOB EMP.JOB%TYPE,
    MGR EMP.MGR%TYPE,
    HIREDATE EMP.HIREDATE%TYPE,
    SAL EMP.SAL%TYPE,
    COMM EMP.COMM%TYPE,
    DEPTNO DEPT.DEPTNO%TYPE
    );
    emp_rec REC_EMP;
BEGIN
    emp_rec.empno := 1111;
    emp_rec.ename := 'TEST_USER';
    emp_rec.job := 'TEST_JOB';
    emp_rec.mgr := null;
    emp_rec.hiredate := '18/03/01';
    emp_rec.sal := 3000;
    emp_rec.comm := null;
    emp_rec.deptno := 40;
    
    insert into EMP_RECORD2 values emp_rec;
    
--    DBMS_OUTPUT.PUT_LINE('EMPNO:'||emp_rec.empno);
--    DBMS_OUTPUT.PUT_LINE('ENAME:'||emp_rec.ename);
--    DBMS_OUTPUT.PUT_LINE('JOB:'||emp_rec.job);
--    DBMS_OUTPUT.PUT_LINE('HIREDATE:'||emp_rec.hiredate);
--    DBMS_OUTPUT.PUT_LINE('SAL:'||emp_rec.sal);
--    DBMS_OUTPUT.PUT_LINE('DEPTNO:'||emp_rec.deptno);
    
END;

delete EMP_RECORD2;