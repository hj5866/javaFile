--461P
DECLARE
    --dept���̺��� ��� �÷�Ÿ���� �����ͼ� v_dept_row�� ����
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    --dept���̺��� �μ���ȣ�� 40�� �����Ϳ� ����
    --��� �÷��� �����͸� �����ͼ� v_dept_row�� ����
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO:'|| V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME:'|| V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC:'|| V_DEPT_ROW.LOC);
END;