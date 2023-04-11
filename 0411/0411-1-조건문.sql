--���ǹ�
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A����');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B����');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C����');
    ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D����');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F����');
    END IF;
    END;
    /
  
--CASE��
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
        END CASE;
        END;
--FOR��
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| V_NUM);
        V_NUM := V_NUM + 1;
        --V_NUM���� 4���� Ŀ���� LOOP��������
        EXIT WHEN V_NUM > 4;
    END LOOP;
    END;
    
--WHILE LOOP
DECLARE
V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : '|| V_NUM);
        V_NUM := V_NUM + 1;
        END LOOP;
        END;
    
BEGIN
    FOR I IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� I�� �� : '|| I);
        END LOOP;
        END;
        
BEGIN
    FOR I IN 0..4 LOOP
        CONTINUE WHEN MOD(I,2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� I�� ��:'|| I);
        END LOOP;
        END;
        
--444P ��������
--1��
BEGIN
    FOR I IN 1..10 LOOP
    CONTINUE WHEN MOD(I,2)=0;
        DBMS_OUTPUT.PUT_LINE('���� I�� ��:'|| I);
        END LOOP;
        END;
--2��
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 10;
BEGIN
    CASE V_DEPTNO
        WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('�μ��̸�:ACCOUNTING');
        WHEN 20 THEN
        DBMS_OUTPUT.PUT_LINE('�μ��̸�:RESEARCH');
        WHEN 30 THEN
        DBMS_OUTPUT.PUT_LINE('�μ��̸�:SALES');
        WHEN 40 THEN
        DBMS_OUTPUT.PUT_LINE('�μ��̸�:OPERATIONS');
        ELSE
        DBMS_OUTPUT.PUT_LINE('�μ��̸�:N/A');
    END CASE;
    END;