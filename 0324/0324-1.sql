update buytbl set amount = 3 where prodName='청바지';
-- 지울때 쓰는거
delete from buytbl where num = 3;
-- 키큰 순서대로 정렬함 desc(내림차순)를 지우면 오름차순(키작은순서대로)
select row_number() over(order by height desc)"키큰순위", userName,addr,height from usertbl;
-- rank():순위 row_number과 결과는 같다.
select rank() over(order by height desc) "키큰순위",userName,height from usertbl;
