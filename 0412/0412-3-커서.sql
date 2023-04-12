--461P
DECLARE
    --dept테이블의 모든 컬럼타입을 가져와서 v_dept_row로 선언
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    --dept테이블에서 부서번호가 40인 데이터에 대해
    --모든 컬럼의 데이터를 가져와서 v_dept_row에 저장
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO:'|| V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME:'|| V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC:'|| V_DEPT_ROW.LOC);
END;