--432p �������
declare
--v_number������ ���������� �����ϰ� 13���� ������
v_number number := 14;
begin
--���� v_number���� 2�� ���� �������� 1�̸�
--mod:������ ���ϴ� �Լ�
if mod(v_number,2)=1 then
--v_number�� Ȧ���̴�. ����ϱ�
dbms_output.put_line('v_number�� Ȧ���̴�.');
--���� v_number���� 2�� ���� �������� 1�� �ƴϸ�
else
dbms_output.put_line('v_number�� ¦���̴�.');
end if;
end;