declare --선언
v_deptno number(2) not null default 10;
begin --실행
dbms_output.put_line('v_deptno: ' || v_deptno);
end;

declare
v_deptno dept.deptno%type := 50;
begin
dbms_output.put_line('v_deptno: ' || v_deptno);
end;

--선언부
declare
--식별자(변수)를 참조형으로 선언, 변숨셩 : v_dept_row
v_dept_row dept%rowtype;
begin
--dept테이블에서 부서번호가 40인 데이터만
--부서번호, 부서명, 지역명을 참조하겠다.
select deptno, dname, loc into v_dept_row
from dept
where deptno=40;
--dbms_output에 출력
dbms_output.put_line('deptno: ' || v_dept_row.deptno);
dbms_output.put_line('dname: ' || v_dept_row.dname);
dbms_output.put_line('loc: ' || v_dept_row.loc);
end;
