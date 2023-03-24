-- userTBL과 buyTBL의 일부 필드를 합쳐서 가상 테이블을 생성함
create view v_userbuyTBL as select U.userID,U.userName,P.prodName,
P.price from usertbl U inner join buyTBL P on U.userID=P.userID;

-- inner join 합치겠다는 뜻 , usertbl u, buytbl p 는 이름 정해준것, on은 view에서 쓰는 조건문법.
select*from v_userbuyTBL;

drop view v_usertbl;