--���� 256p
DECLARE
    --�����迭 ����, �迭�ڷ��� �̸�:itab_ex(�������̹��ڿ�20)
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    --itab_ex�� �ε����� ���������� ����
    INDEX BY PLS_INTEGER;
    --itab_ex�迭�� �ڷ������� �ϴ� text_arr �迭 ����
    text_arr ITAB_EX;
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2nt data';
    text_arr(3) := '3rt data';
    text_arr(50) := '50st data';
    
    --�迭�� ����:�� 4���� 4��
    DBMS_OUTPUT.PUT_LINE('text_arr.COUNT : ' || text_arr.COUNT);
    --�迭�� ù��° ���:1
    DBMS_OUTPUT.PUT_LINE('text_arr.FIRST : ' || text_arr.FIRST);
    --�迭�� ��������� :50
    DBMS_OUTPUT.PUT_LINE('text_arr.LAST : ' || text_arr.LAST);
    --50�� �ٷ� ���� �ε���:3
    DBMS_OUTPUT.PUT_LINE('text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
    --50�� �ٷ� �ڿ� �ִ� �ε���: null
    DBMS_OUTPUT.PUT_LINE('text_arr.NEXT(50) : ' || text_arr.NEXT(50));
END;
