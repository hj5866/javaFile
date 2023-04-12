--477P
DECLARE
    --숫자형으로 변수 선언
    v_wrong NUMBER;
BEGIN
    --DEPT테이블에서 부서번호가10인 데이터의 부서이름을 가져와서
    --v_wrong에 저장하려고 시도했으나 자료형이 안맞아서 에러남
    SELECT DNAME INTO v_wrong
    FROM DEPT 
    WHERE DEPTNO = 10;
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');
    
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('예외처리:요구보다 많은 행 추출 오류 발생');
    WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('예외처리:수치 또는 값 오류 발생');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외처리:사전 정의 외 오류 발생');
END;