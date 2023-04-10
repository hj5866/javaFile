--432p 조건제어문
declare
--v_number변수를 숫자형으로 선언하고 13값을 대입함
v_number number := 14;
begin
--만약 v_number값을 2로 나눈 나머지가 1이면
--mod:나머지 구하는 함수
if mod(v_number,2)=1 then
--v_number는 홀수이다. 출력하기
dbms_output.put_line('v_number는 홀수이다.');
--만약 v_number값을 2로 나눈 나머지가 1이 아니면
else
dbms_output.put_line('v_number는 짝수이다.');
end if;
end;