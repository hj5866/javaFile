--1번
create table food(
    아이디 number(2) constraint food_id primary key,
    음식명 varchar2(20) constraint food_name unique,
    음식종류 varchar2(10),
    음식점 varchar2(20) constraint food_store not null,
    전화번호 varchar2(13) constraint food_tel not null,
    이메일 varchar2(20),
    음식점분류번호 number(4) constraint food_store_num not null
    );
    desc food;
--2번  
create table store(
    아이디 number(2) constraint store_id primary key,
    음식점명 varchar2(20) constraint store_name unique,
    음식점분류번호 number(4) constraint store_num not null,
    요리사 varchar2(10)
);
    desc store;
    
--3번
insert into food values(1,'자장면','중식','홍콩반점','032-547-8564','hkbj@gmail.com',10);
insert into food values(2,'탕수육','중식','홍콩반점','032-547-8564',null,10);
insert into food values(3,'콤비네이션 피자',null,'이딸리아스','031-547-8961','italia@gmail.com',20);
insert into food values(4,'모듬초밥','일식','오니기리','02-415-7854','onigiri@gmail',30);
insert into food values(5,'돈가스','일식','오니기리','02-415-7854','onigiri@gmail',30);
insert into food values(6,'고등어정식','한식','할머니네','02-549-7541','grandma@gmail.com',40);
insert into food values(7,'비빔밥','한식','할머니네','02-549-7541',null,40);
insert into food values(8,'곱창전골',null,'할머니네','02-549-7541','grandma@gmail.com',40);
insert into food values(9,'햄버거',null,'막더널드','032-125-5236','mado@gmail.com',50);
insert into food values(10,'떡볶이','분식','이모분식','032-125-5236',null,60);

select*from food;
drop table food;

--4번
insert into store values(1,'홍콩반점',10,'백종원');
insert into store values(2,'이딸리아스',20,'파비오');
insert into store values(3,'오니기리',30,'테츠야');
insert into store values(4,'할머니네',40,'김옥순');
insert into store values(5,'막더널드',50,'스티브');
insert into store values(6,'이모분식',60,'오이모');

select*from store;
drop table store;

--5번
--food테이블의 음식점분류번호와 store테이블의 음식점분류번호를 이용하여 두개의 테이블을 join하기
--음식점 이름으로 오름차순 정렬
--출력형식:아이디,음식명,음식점,전화번호,이메일,요리사
select F.아이디,F.음식명,F.음식점,F.전화번호,F.이메일,S.요리사
from food F, store S
where F.음식점분류번호 = S.음식점분류번호
order by F.음식점;

--6번
--food테이블의 음식점분류번호와 store테이블의 음식점분류번호를 이용하여 두개의 테이블 join
--조건:음식점이름이 '할머니네'인 데이터만 join
--음식점 이름으로 오름차순, 음식명 내림차순 정렬
--출력형식:아이디,음식명,음식점,요리사
select F.아이디,F.음식명,F.음식점,S.요리사
from food F, store S
where F.음식점분류번호=S.음식점분류번호
and F.음식점='할머니네'
order by F.음식점, F.음식명 desc;

--7번 187p
--food테이블을 음식점별로 묶어서(그룹)출력, 음식점이름 기준 내림차순 정렬
select 아이디,음식명,음식종류,음식점,전화번호,이메일,음식점분류번호
from food
group by 아이디,음식명,음식종류,음식점,전화번호,이메일,음식점분류번호
order by 음식점 desc;

--8번 366p
--food테이블에 <가격>컬럼 추가
--가격,숫자형(6자리) 제약조건:필수,제약조건 이름:food_price

--첫번째 방법
--컬럼 추가한뒤 -> 데이터 입력하고 -> 제약조건 추가
alter table food add (가격 number(6));

update food set 가격='10000' where 음식명='자장면';
update food set 가격='20000' where 음식명='탕수육';
update food set 가격='25000' where 음식명='콤비네이션 피자';
update food set 가격='16000' where 음식명='모듬초밥';
update food set 가격='15000' where 음식명='돈가스';
update food set 가격='18000' where 음식명='고등어정식';
update food set 가격='8000' where 음식명='비빔밥';
update food set 가격='30000' where 음식명='곱창전골';
update food set 가격='9200' where 음식명='햄버거';
update food set 가격='6000' where 음식명='떡볶이';

alter table food modify(가격 constraint food_price NOT NULL);
-----------------------------두번째 방법-----------------------
--default값 0을 추가한뒤 한번에 constraint까지 설정한뒤에 ->첫번째 방법처럼
--update set으로 데이터를 추가하면 됌.
alter table food add 가격 number(6) default 0
   constraint food_price not null;  

desc food;
select *from food;

--제약조건 확인
select constraint_name, constraint_type, table_name
from user_constraints where table_name='FOOD';

--9번
--food테이블에서 가격이 평균 가격 이상인 데이터의 모든 컬럼 출력
select *
from food
where 가격 >= (select avg(가격) from food);

--10번
--food테이블에서 가격이 10000~20000 사이인 데이터 출력
--출력형식:아이디,음식점,가격,요리사
select F.아이디,F.음식점,F.가격,S.요리사
from food F, store S
where F.음식점분류번호=S.음식점분류번호
and F.가격 between 10000 and 20000
order by 가격;

--네츄럴조인


--join~using
select F.아이디,F.음식점,F.가격,S.요리사
from food F join store S using(음식점분류번호)
where F.가격 between 10000 and 20000
order by 가격;

--join~on
select F.아이디,F.음식점,F.가격,S.요리사
from food F join store S on (F.음식점분류번호=S.음식점분류번호)
where F.가격 between 10000 and 20000
order by 가격;


--11번
--store 테이블에 레코드 입력
--아이디:7 음식점:대왕족발 음식점분류번호:70 요리사:NULL
insert into store(아이디,음식점명,음식점분류번호,요리사) values(7,'대왕족발',70,NULL);
select*from store;

--12번
--store테이블에 food테이블을 외부조인하기
--음식점분류번호 컬럼 이용, store테이블과 food테이블의 모든 컬럼 출력
select*
from store S left outer join food F on(S.음식점분류번호=F.음식점분류번호);

--13번
--요리사 이름이 백종원,테츠야,스티브인 데이터에 해당하는 레코드 출력
--출력형식:아이디,음식명,음식점,음식점분류번호,요리사
select F.아이디,F.음식명,F.음식점,F.음식점분류번호,S.요리사
from food F ,store S
where F.음식점분류번호=S.음식점분류번호
and 요리사 in('백종원','테츠야','스티브');

--using
select F.아이디,F.음식명,F.음식점,음식점분류번호,S.요리사
from food F join store S using(음식점분류번호)
where 요리사 in('백종원','테츠야','스티브');

--14번
--food테이블에서 음식점 이름이 '홍콩반점'인 데이터만 복사하여 새로운 테이블 food_new 생성
CREATE TABLE food_new
AS SELECT * FROM food
WHERE 음식점 = '홍콩반점';

select*from food_new;

--15번 store테이블에 <비고> 컬럼 추가,자료형 가변길이문자열형 10자리
--<비고> 컬럼명을 <추가사항>으로 변경, <추가사항> 컬럼 삭제
alter table store add 비고 varchar2(10);
alter table store rename column 비고 to 추가사항;
alter table store drop column 추가사항;

select*from store;