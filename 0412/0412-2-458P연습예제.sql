DECLARE
--emp테이블의 자료형을 가져와서 itab_emp배열 생성
TYPE ITAB_EMP IS TABLE OF emp%ROWTYPE
--배열의 인덱스는 정수형으로 선언
    INDEX BY PLS_INTEGER;
--itab_emp배열을 자료형으로 하는 emp_arr배열 선언   
    emp_arr ITAB_EMP;
--인덱스 변수 선언하고 0으로 초기화
    idx PLS_INTEGER := 0;
BEGIN
 FOR i IN(SELECT*FROM emp) LOOP
 
    idx := idx + 1;
    
    emp_arr(idx).empno := i.empno;
    emp_arr(idx).ename := i.ename;
    emp_arr(idx).mgr:= i.mgr;
    emp_arr(idx).job:= i.job;
    emp_arr(idx).hiredate:= i.hiredate;
    emp_arr(idx).sal:= i.sal;
    emp_arr(idx).comm:= i.comm;
    emp_arr(idx).deptno:= i.deptno;
   
    DBMS_OUTPUT.PUT_LINE(
    emp_arr(idx).empno||':'||
    emp_arr(idx).ename ||':'||
    emp_arr(idx).job ||':'||
    emp_arr(idx).mgr||':'||
    emp_arr(idx).hiredate||':'||
    emp_arr(idx).sal||':'||
    emp_arr(idx).comm||':'||
    emp_arr(idx).deptno);
    
    END LOOP;
    
END;
