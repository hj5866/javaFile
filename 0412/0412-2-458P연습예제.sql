DECLARE
--emp���̺��� �ڷ����� �����ͼ� itab_emp�迭 ����
TYPE ITAB_EMP IS TABLE OF emp%ROWTYPE
--�迭�� �ε����� ���������� ����
    INDEX BY PLS_INTEGER;
--itab_emp�迭�� �ڷ������� �ϴ� emp_arr�迭 ����   
    emp_arr ITAB_EMP;
--�ε��� ���� �����ϰ� 0���� �ʱ�ȭ
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
