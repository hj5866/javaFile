create table member_ex(
    멤버번호 number(7) primary key,
    성별 varchar(5) not null,
    연령대 number(2),
    가입일 date not null,
    주소 varchar(10)
);

create table order_ex(
    주문번호 number(5) primary key,
    멤버번호 number(7) not null,
    주문일 date not null,
    채널코드 number(1),
    지점코드 number(2),
    상품코드 number(3),
    판매가격 number(10)
);
insert into member_ex values(1000001,'man',20,'2019-01-22','Seoul');
insert into member_ex values(1000002,'women',20,'2019-01-12','Gyeonggi');
insert into member_ex values(1000003,'women',20,'2019-01-24','Gyeonggi');
insert into member_ex values(1000004,'man',20,'2019-02-14','Gangwon');
insert into member_ex values(1000005,'man',20,'2019-01-26','Busan');
insert into member_ex values(1000006,'man',20,'2019-02-16','Daejeon');
insert into member_ex values(1000007,'women',20,'2019-01-28','Jeju');
insert into member_ex values(1000008,'man',20,'2019-01-18','Jeju');

insert into order_ex values(1,1000060,'2020-01-10',1,19,637,385000);
insert into order_ex values(10,1000799,'2020-01-15',1,10,457,31000);
insert into order_ex values(1000,1000154,'2020-04-12',1,29,306,52700);
insert into order_ex values(1001,1000195,'2020-04-12',1,27,534,15000);
insert into order_ex values(1002,1000265,'2020-04-12',1,21,561,5000);
insert into order_ex values(1003,1000306,'2020-04-12',2,9,487,9000);
insert into order_ex values(1004,1000376,'2020-04-12',1,8,370,14000);
insert into order_ex values(1005,1000417,'2020-04-12',1,12,455,21000);
insert into order_ex values(1006,1000487,'2020-04-12',1,35,158,4000);
insert into order_ex values(1007,1000001,'2022-03-30',3,32,200,14000);
insert into order_ex values(1008,1000002,'2022-04-10',2,45,300,25000);
insert into order_ex values(1009,1000003,'2022-02-22',2,30,200,158000);
insert into order_ex values(10010,1000004,'2022-05-10',4,15,100,5400);
insert into order_ex values(10011,1000005,'2021-07-20',5,16,270,27000);
insert into order_ex values(10012,1000006,'2022-08-10',4,20,140,65400);
insert into order_ex values(10013,1000007,'2021-11-30',5,32,200,10000);
insert into order_ex values(10014,1000008,'2022-3-18',5,30,300,50000);

select*from member_ex;
select*from order_ex;

--문제1
--각 테이블의 멤버번호가 같은 데이터 끼리 inner join 모든 컬럼 표시
select*
from member_ex join order_ex using(멤버번호);

select*
from member_ex M, order_ex O
where M.멤버번호=O.멤버번호;

--문제2
--member_ex 기준으로 해서 outer join하기
--멤버변수가 같은 조건으로
select*
from member_ex M left outer join order_ex O
on(M.멤버번호=O.멤버번호);

--문제3
--문제2의 결과를 이용해서 성별 기준(그룹)으로 판매금액의 합계 구해서 출력.
--합계컬럼의 이름:총판매금액
select M.성별,sum(판매가격)as 총판매금액
from member_ex M left outer join order_ex O
on(M.멤버번호=O.멤버번호)
group by M.성별;

--문제4
--문제3번의 결과에 그룹 기준을 하나 더 추가하여 출력
--그룹(성별,주소)
select M.성별,M.주소,sum(판매가격)as 총판매금액
from member_ex M left outer join order_ex O
on(M.멤버번호=O.멤버번호)
group by M.성별,M.주소;

--문제5
--채널코드가 1인 데이터 중에서 판매가격이 평균 판매가격 미만인
--레코드의 주문번호,멤버번호,주문일,지점코드,주소,판매가격 출력
--결과가 안나오는것은 해당되는 값이 없어서이다
select O.주문번호,O.멤버번호,O.주문일,O.지점코드,M.주소,O.판매가격
from member_ex M ,order_ex O
where M.멤버번호=O.멤버번호
and O.채널코드=1
and O.판매가격 < (select avg(판매가격) from order_ex);
