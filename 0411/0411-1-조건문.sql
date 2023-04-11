--조건문
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
    ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F학점');
    END IF;
    END;
    /
  
--CASE문
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A학점');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B학점');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C학점');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F학점');
        END CASE;
        END;
--FOR문
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| V_NUM);
        V_NUM := V_NUM + 1;
        --V_NUM값이 4보다 커지면 LOOP빠져나감
        EXIT WHEN V_NUM > 4;
    END LOOP;
    END;
    
--WHILE LOOP
DECLARE
V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '|| V_NUM);
        V_NUM := V_NUM + 1;
        END LOOP;
        END;
    
BEGIN
    FOR I IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 I의 값 : '|| I);
        END LOOP;
        END;
        
BEGIN
    FOR I IN 0..4 LOOP
        CONTINUE WHEN MOD(I,2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 I의 값:'|| I);
        END LOOP;
        END;
        
--444P 연습문제
--1번
BEGIN
    FOR I IN 1..10 LOOP
    CONTINUE WHEN MOD(I,2)=0;
        DBMS_OUTPUT.PUT_LINE('현재 I의 값:'|| I);
        END LOOP;
        END;
--2번
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 10;
BEGIN
    CASE V_DEPTNO
        WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('부서이름:ACCOUNTING');
        WHEN 20 THEN
        DBMS_OUTPUT.PUT_LINE('부서이름:RESEARCH');
        WHEN 30 THEN
        DBMS_OUTPUT.PUT_LINE('부서이름:SALES');
        WHEN 40 THEN
        DBMS_OUTPUT.PUT_LINE('부서이름:OPERATIONS');
        ELSE
        DBMS_OUTPUT.PUT_LINE('부서이름:N/A');
    END CASE;
    END;