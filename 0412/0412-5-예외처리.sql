--472P ����ó��
DECLARE
    --���������� ���� ����
    V_WRONG NUMBER;
BEGIN
    --DEPT���̺��� ������ �����ʹ� ACCOUNTING���� ��������.
    --V_WRONG�� ���������� ������ �ؼ�, ������ ��.
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO = 10;
--EXCEPTION���� ���� ����ó��
EXCEPTION
    WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('����ó��: ��ġ �Ǵ� �� ���� �߻�');
END;