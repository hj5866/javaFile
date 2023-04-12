--교재 256p
DECLARE
    --연관배열 선언, 배열자료형 이름:itab_ex(가변길이문자열20)
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    --itab_ex의 인덱스를 정수형으로 선언
    INDEX BY PLS_INTEGER;
    --itab_ex배열을 자료형으로 하는 text_arr 배열 선언
    text_arr ITAB_EX;
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2nt data';
    text_arr(3) := '3rt data';
    text_arr(50) := '50st data';
    
    --배열의 갯수:방 4개라서 4임
    DBMS_OUTPUT.PUT_LINE('text_arr.COUNT : ' || text_arr.COUNT);
    --배열의 첫번째 요소:1
    DBMS_OUTPUT.PUT_LINE('text_arr.FIRST : ' || text_arr.FIRST);
    --배열의 마지막요소 :50
    DBMS_OUTPUT.PUT_LINE('text_arr.LAST : ' || text_arr.LAST);
    --50의 바로 앞전 인덱스:3
    DBMS_OUTPUT.PUT_LINE('text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
    --50의 바로 뒤에 있는 인덱스: null
    DBMS_OUTPUT.PUT_LINE('text_arr.NEXT(50) : ' || text_arr.NEXT(50));
END;
