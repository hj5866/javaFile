--447p ���ڵ�
DECLARE
--���ڵ� ����
    TYPE REC_DEPT IS RECORD(
    --deptno������ ������2�ڸ��� �����ϰ� 99����
    DEPTNO NUMBER(2) NOT NULL := 99,
    --dname ������ dept���̺��� dname�÷��� �ڷ����� ���� ����
    DNAME DEPT.DNAME%TYPE,
    --loc������ dept���̺��� loc�÷��� �ڷ����� ���� ����
    LOC DEPT.LOC%TYPE
    );
    --���� dept_rec�� �ڷ��� ���ڵ������� ����
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

