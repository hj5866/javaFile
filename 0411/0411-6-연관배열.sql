--453p �����迭
DECLARE
    --�����迭 ����, �迭�̸�:itab_ex ,table�̶�� �������� �迭��.
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    --�ε�����:plu_integer(������),�迭���ȣ:(1),(2)...
    INDEX BY PLS_INTEGER;
    --text_arr�迭 ����, �ڷ���:itab_ex
    text_arr ITAB_EX;
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(4) := '4st data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(1) :'|| text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) :'|| text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) :'|| text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) :'|| text_arr(4));
END;