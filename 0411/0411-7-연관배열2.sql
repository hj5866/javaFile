--454P �����迭 �ڷ����� ���ڵ� ����ϱ�
DECLARE
    --���ڵ弱��:REC_DEPT
    TYPE REC_DEPT IS RECORD(
    --��������
    deptno DEPT.DEPTNO%TYPE,
    dname DEPT.DNAME%TYPE
    );
    --�����迭 ����, �迭��:ITAB_DEPT ,REC_DEPT�ڷ���
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
    --�迭�� �� ��ȣ�� ��Ÿ���� �ε����� ���������� ����
    INDEX BY PLS_INTEGER;
    
    --ITAB_DEPT�迭�� �ڷ������� �ϴ� DEPT_ARR�迭�� ����
    dept_arr ITAB_DEPT;
    --DEPT_ARR�迭�� �ε��� ���� 0���� �ʱ�ȭ
    idx PLS_INTEGER := 0;
    
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT)LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.DEPTNO;
        dept_arr(idx).dname := i.DNAME;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno||':'|| dept_arr(idx).dname);
END LOOP;
END;
------------------------------------------------------------------------------  
--%ROWTYPE���� ���� �迭 �ڷ��� �����ϱ�
DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN(SELECT*FROM DEPT) LOOP
    --FOR�� ����ɶ����� �ε��� ���ȣ 1�� ����
    idx := idx + 1;
    dept_arr(idx).deptno := i.DEPTNO;
    dept_arr(idx).dname := i.DNAME;
    dept_arr(idx).loc := i.LOC;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno||':'||
    dept_arr(idx).dname ||':'||
    dept_arr(idx).loc);
    
    END LOOP;
END;