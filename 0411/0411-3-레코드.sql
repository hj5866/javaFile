--448P INSERT
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2) NOT NULL := 90,
        dname DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    
INSERT INTO DEPT_RECORD
VALUES dept_rec;
END;

select*From dept_record;