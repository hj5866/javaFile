--453p 연관배열
DECLARE
    --연관배열 선언, 배열이름:itab_ex ,table이라고 써있지만 배열임.
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    --인덱스형:plu_integer(정수형),배열방번호:(1),(2)...
    INDEX BY PLS_INTEGER;
    --text_arr배열 선언, 자료형:itab_ex
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