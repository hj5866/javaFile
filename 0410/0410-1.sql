declare --����
v_deptno number(2) not null default 10;
begin --����
dbms_output.put_line('v_deptno: ' || v_deptno);
end;

declare
v_deptno dept.deptno%type := 50;
begin
dbms_output.put_line('v_deptno: ' || v_deptno);
end;

--�����
declare
--�ĺ���(����)�� ���������� ����, ������ : v_dept_row
v_dept_row dept%rowtype;
begin
--dept���̺��� �μ���ȣ�� 40�� �����͸�
--�μ���ȣ, �μ���, �������� �����ϰڴ�.
select deptno, dname, loc into v_dept_row
from dept
where deptno=40;
--dbms_output�� ���
dbms_output.put_line('deptno: ' || v_dept_row.deptno);
dbms_output.put_line('dname: ' || v_dept_row.dname);
dbms_output.put_line('loc: ' || v_dept_row.loc);
end;
