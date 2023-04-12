--472P 예외처리
DECLARE
    --숫자형으로 변수 선언
    V_WRONG NUMBER;
BEGIN
    --DEPT테이블에서 가져온 데이터는 ACCOUNTING으로 문자형임.
    --V_WRONG은 숫자형으로 선언을 해서, 에러가 남.
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO = 10;
--EXCEPTION으로 오류 예외처리
EXCEPTION
    WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('예외처리: 수치 또는 값 오류 발생');
END;