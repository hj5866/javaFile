--462p
DECLARE
    --Ŀ�� �����͸� �Է��� ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    --����� Ŀ�� ����(Declaration)
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
        
BEGIN
    --Ŀ������
    OPEN c1;
    --Ŀ���ӷ��� �о�� ������ ���(FETCH)
    FETCH c1 INTO V_DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO:'||V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME:'||V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC:'||V_DEPT_ROW.LOC);
    --Ŀ���ݱ�
    CLOSE c1;
END;