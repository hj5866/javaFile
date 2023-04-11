--1번 테이블 만들기
create table stationery(
    거래처 varchar2(20) not null,
    상품분류 varchar2(20) not null,
    품명 varchar2(30) not null,
    수량 number(6) not null,
    단가 number(6) not null,
    판매금액 number(10)
);
--데이터 입력
insert into stationery(거래처,상품분류,품명,수량,단가) values('강남아트박스','노트','합지 스프링노트',20,2500);
insert into stationery(거래처,상품분류,품명,수량,단가) values('강남아트박스','복사용지','더블에이 A4용지',30,20000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('강남아트박스','필기류','모나미 볼펜',250,100);
insert into stationery(거래처,상품분류,품명,수량,단가) values('강남아트박스','필기류','네임펜F(중간글씨용)흑색',10,6000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('신촌문구','노트','옥스포드  노트',150,6000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('신촌문구','수정용품','오피스 수정테이프',10,20000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('신촌문구','필기류','모나미 볼펜',200,100);
insert into stationery(거래처,상품분류,품명,수량,단가) values('신촌문구','노트','옥스포드  노트',200,6000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('종로아트박스','스카치테이프','스카치 다용도 테이프',30,900);
insert into stationery(거래처,상품분류,품명,수량,단가) values('종로아트박스','클립','피스코리아 더블클립',20,4000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('종로아트박스','필기류','옵텍스 형광펜 혼합3색',30,3000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('종로문구','포스트잇','포스트잇 노트(654)노랑',35,1700);
insert into stationery(거래처,상품분류,품명,수량,단가) values('종로문구','필기류','네임펜F(중간글씨용)흑색',30,6000);
insert into stationery(거래처,상품분류,품명,수량,단가) values('나나문구','포스트잇','포스트잇 노트 3색',60,2300);
insert into stationery(거래처,상품분류,품명,수량,단가) values('나나문구','필기류','네임펜F(중간글씨용)흑색',45,6000);

desc stationery;
select*from stationery;
drop table stationery;

--판매금액 조건
update stationery set 판매금액=수량*단가;

--2번
--시퀀스 생성
create sequence sq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop sequence sq;

--번호 테이블 생성
alter table stationery add 번호 number(3);

--시퀀스로 번호 붙이기
insert into stationery(거래처,상품분류,품명,수량,단가,번호) values('강남아트박스','노트','합지 스프링노트',20,2500,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('강남아트박스','복사용지','더블에이 A4용지',30,20000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('강남아트박스','필기류','모나미 볼펜',250,100,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('강남아트박스','필기류','네임펜F(중간글씨용)흑색',10,6000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('신촌문구','노트','옥스포드  노트',150,6000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('신촌문구','수정용품','오피스 수정테이프',10,20000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('신촌문구','필기류','모나미 볼펜',200,100,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('신촌문구','노트','옥스포드  노트',200,6000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('종로아트박스','스카치테이프','스카치 다용도 테이프',30,900,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('종로아트박스','클립','피스코리아 더블클립',20,4000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('종로아트박스','필기류','옵텍스 형광펜 혼합3색',30,3000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('종로문구','포스트잇','포스트잇 노트(654)노랑',35,1700,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('종로문구','필기류','네임펜F(중간글씨용)흑색',30,6000,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('나나문구','포스트잇','포스트잇 노트 3색',60,2300,sq.nextval);
insert into stationery(거래처,상품분류,품명,수량,단가,번호)  values('나나문구','필기류','네임펜F(중간글씨용)흑색',45,6000,sq.nextval);

--update로 번호매기기
update stationery set 번호=sq.nextval;

--시퀀스 현재값(currval) 확인 교재351p
select sq.currval from dual;

--시퀀스의 값 1로 수정하기(원하는 값이 되도록 값을 빼주거나 더해줌)
--시퀀스 수정하는 방법:alter sequence sq increment by 질의어로 currval값을 0으로 적용한뒤,
--(ex:currval 값이 29이면, alter sequence sq increment by -29)
--alter sequence sq increment by 1로 초기화 한뒤(select sq.nextval from dual는 하지않는다) update해서 값 확인
alter sequence sq increment by 1;
select sq.nextval from dual;

--시퀀스 수정
alter sequence sq
minvalue -1;

select*from stationery;
select*from user_sequences;

--컬럼순서 바꾸는법(번호를 맨앞으로 옮기기위해)
--1.select from으로 출력
select 번호,거래처,상품분류,품명,수량,단가,판매금액 from stationery;

--2.view만들어서 출력
create view stationery_view as stationery_view as
    (번호,거래처,상품분류,품명,수량,단가,판매금액 from stationery);
    select*from stationery_view;
    
--3.기존테이블 복사해서,수정,기존테이블삭제,다시 생성
create table station2 as
select 번호,거래처,상품분류,품명,수량,단가,판매금액
from stationery;

drop table stationery;

alter table station2 rename to stationery;

select*from stationery;

--3번
--거래처별 개수와 평균수량, 평균단가, 평균판매량, 최대판매금액, 최소판매금액 출력하기
select 거래처,count(거래처)as 개수, trunc(avg(수량))as 평균수량,trunc(avg(단가))as 평균단가,trunc(avg(판매금액))as 평균판매금액,
max(판매금액)as 최대판매금액, min(판매금액)as 최소판매금액
from stationery
group by 거래처;

select*from stationery;

--4번
--테이블의 각 컬럼에 제약조건 이름 붙이기(제약조건 수정)
--처음에 not null 이여서 이 질의어가 실행이 안 되더라구요 그래서 null로 실행 한번씩 하고
--다시 not null로 실행하니 되었어요^ㅠ^~~!!!
alter table stationery modify(거래처 constraint customer_nn NOT null); 
alter table stationery modify(상품분류 constraint class_nn not null);
alter table stationery modify(품명 constraint product_nn not null);
alter table stationery modify(수량 constraint number_nn not null);
alter table stationery modify(단가 constraint price_nn not null);

--rename으로 수정하기
alter table stationery rename constraint SYS_C0011310 to class_nn;
  
select CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME from user_constraints where table_name = 'STATIONERY';

--5번
--테이블에서 상품이 '필기류'인 레코드만 복사하여 stationery_new 테이블 생성
create table stationery_new
as select*from stationery
where 상품분류='필기류';

select*from stationery_new;

--6번
--판매금액이 평균판매금액 미만인 레코드만 출력하기(서브쿼리)
select 거래처,상품분류,품명,판매금액,수량,단가,번호
from stationery
where 판매금액 < (select avg(판매금액) from stationery);

--7번 교재258페이지
--테이블에서 거래처별 평균판매금액을 구하고 모든 컬럼 출력
select 거래처,상품분류,품명,수량,단가,판매금액
from stationery
where (거래처,판매금액) in (select 거래처,trunc(avg(판매금액)) from stationery group by 거래처);

--최소판매금액과 비교
select 거래처,상품분류,품명,수량,단가,판매금액
from stationery
where (거래처,판매금액) in (select 거래처,trunc(min(판매금액)) from stationery group by 거래처);

select*from stationery;

--8번
--거래처 이름에 '아트박스'가 들어가는 레코드들 중에서 '신촌문구'에는 존재하지 않는 품명을
--가진 레코드의 모든 컬럼을 출력하기
select*
from stationery
where 품명 not in(select 품명 from stationery where 거래처='신촌문구')
and 거래처 like '%아트박스%'
order by 번호;

--9번
--테이블에 내용 추가하기
insert into stationery(거래처,상품분류,품명,수량,단가,판매금액)
values('나나문구','스카치테이프','스카치 다용도 테이프',20,650,13000);

--10번
--테이블에서 품명에'볼펜'이 포함된 레코드의 단가를 200으로 모두 수정하기
update stationery set 단가=200 where 품명 like '%볼펜%';

select*from stationery;



