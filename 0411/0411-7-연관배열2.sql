--454P 연관배열 자료형에 레코드 사용하기
DECLARE
    --레코드선언:REC_DEPT
    TYPE REC_DEPT IS RECORD(
    --변수선언
    deptno DEPT.DEPTNO%TYPE,
    dname DEPT.DNAME%TYPE
    );
    --연관배열 선언, 배열명:ITAB_DEPT ,REC_DEPT자료형
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
    --배열의 방 번호를 나타내는 인덱스는 정수형으로 선언
    INDEX BY PLS_INTEGER;
    
    --ITAB_DEPT배열을 자료형으로 하는 DEPT_ARR배열을 선언
    dept_arr ITAB_DEPT;
    --DEPT_ARR배열의 인덱스 값은 0으로 초기화
    idx PLS_INTEGER := 0;
    
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT)LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.DEPTNO;
        dept_arr(idx).dname := i.DNAME;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno||':'|| dept_arr(idx).dname);
END LOOP;
END;
------------------------------------------------------------------------------  
--%ROWTYPE으로 연관 배열 자료형 지정하기
DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN(SELECT*FROM DEPT) LOOP
    --FOR문 실행될때마다 인덱스 방번호 1씩 증가
    idx := idx + 1;
    dept_arr(idx).deptno := i.DEPTNO;
    dept_arr(idx).dname := i.DNAME;
    dept_arr(idx).loc := i.LOC;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno||':'||
    dept_arr(idx).dname ||':'||
    dept_arr(idx).loc);
    
    END LOOP;
END;