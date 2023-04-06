--1¹ø
create table dept_const(
    deptno number(2) constraint deptconst_deptno_pk primary key,
    dname varchar(14) constraint deptconst_dname_unq unique,
    loc varchar(13) constraint deptconst_loc_nn not null);
    desc dept_const;
--2¹ø
create table emp_const(
    empno number(4) constraint empconst_empno_pk primary key,
    ename varchar(10) constraint empconst_ename_nn not null,
    job varchar(9),
    tel varchar(20) constraint empconst_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint empconst_sal_chk check(SAL BETWEEN 1000 AND 9999),
    comm number(7,2),
    deptno number(2) constraint empconst_deptno_fk references dept_const(deptno));
    desc dept_const;
--3¹ø
select table_name,constraint_name,constraint_type
from user_constraints where (table_name like 'DEPT_CONST%'or table_name like 'EMP_CONST%')
order by constraint_name;
    