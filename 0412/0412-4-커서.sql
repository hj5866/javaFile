--462p
DECLARE
    --커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    --명시적 커서 선언(Declaration)
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
        
BEGIN
    --커서열기
    OPEN c1;
    --커서롭루터 읽어온 데이터 사용(FETCH)
    FETCH c1 INTO V_DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO:'||V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME:'||V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC:'||V_DEPT_ROW.LOC);
    --커서닫기
    CLOSE c1;
END;