--449P 업데이트
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2) NOT NULL := 90,
        dname DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 50;
    dept_rec.dname := 'DB';
    dept_rec.loc := 'SEOUL';
    
UPDATE DEPT_RECORD
SET ROW = dept_rec
WHERE DEPTNO = 99;
END;

select*From dept_record;