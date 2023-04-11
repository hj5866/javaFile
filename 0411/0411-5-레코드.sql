--450p ���ڵ忡 �ٸ� ���ڵ� �����ϱ�
DECLARE
--rec_dept��� �̸��� ���ڵ� ����
    TYPE REC_DEPT IS RECORD(
        --deptno���� ����, �ڷ����� dept���̺��� deptno�� ����
        deptno DEPT.DEPTNO%TYPE,
        --dname���� ����, �ڷ����� dept���̺��� dname �÷��� ����
        dname DEPT.DNAME%TYPE,
        --loc���� ����, �ڷ����� dept���̺��� loc�÷��� ����
        loc DEPT.LOC%TYPE
    );
    --rec_emp��� �̸��� ���ڵ� ����
    TYPE REC_EMP IS RECORD(
        --empno��� ���� ����, emp���̺��� empno�÷��� ���� �ڷ���
        empno EMP.EMPNO%TYPE,
        --ename��� ���� ����, emp���̺��� ename�÷��� ���� �ڷ���
        ename EMP.ENAME%TYPE,
        --rec_dept���ڵ����� �ڷ������� ����ϴ� ���� dinfo ����
        dinfo REC_DEPT
    );
    --emp_rec ����, �ڷ����� rec_emp���ڵ带 ���
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