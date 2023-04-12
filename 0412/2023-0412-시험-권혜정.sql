--1번
create table book(
    도서번호 number(4) primary key,
    책이름 varchar2(40) unique,
    분류 varchar2(20),
    가격 number(6) not null,
    할인가격 number(6),
    책소개 varchar2(30),
    출판일 date
);

create table author(
    일련번호 number(2) primary key,
    저자 varchar2(20) not null,
    출판사 varchar2(10) not null,
    도서번호 number(4) references book (도서번호)
);

insert into book values(1001,'미우나 고우나 내 인생','에세이',13500,12150,'우당탕탕 일상 에세이','2023/03/10');
insert into book values(1002,'오늘부터 내 그릇을 키우기로 했다','자기계발',14850,null,'느리지만 단단하게!','2023/04/03');
insert into book values(1003,'다이어트 워킹','건강 취미',12600,11340,'걷기를 운동으로 바꾸는 법','2023/03/20');
insert into book values(1004,'무해한 복숭아','소설/시/희곡',10800,9720,'아름답고 달콤한 시의 세계','2023/03/31');
insert into book values(1005,'세이노의 가르침','자기계발',7200,6480,'자기 자신을 사냥하라','2023/03/02');
insert into book values(1006,'스즈메의 문단속','소설/시/희곡',11700,10200,'문을 찾고 있다','2023/01/14');
insert into book values(1007,'메리골드 마음 세탁소','소설/시/희곡',13500,12150,'세상에서 가장 아름다운 세탁소','2023/03/18');
insert into book values(1008,'당신은 결국 무엇이든 해내는 사람','에세이',15000,13500,'우리는 결국 해낸다','2023/04/13');
insert into book values(1009,'인생의 역사','에세이',18000,16200,'공무도하가에서 사랑의 발명까지','2023/10/05');
insert into book values(1010,'꽃의 마음 사전','에세이',19800,17820,'가장 향기로운 속삭임의 세계','2023/03/10');

insert into author values(1,'손현녕','반달눈',1001);
insert into author values(2,'이진아','카멜북스',1002);
insert into author values(4,'이은규','아침달',1004);
insert into author values(3,'나가사카 야스코','즐거운상상',1003);
insert into author values(5,'세이노','데이원',1005);
insert into author values(6,'신카이 마코토','대원씨아이',1006);
insert into author values(7,'윤정은','북로망스',1007);
insert into author values(8,'김상현','필름',1008);
insert into author values(9,'신형철','난다',1009);
insert into author values(10,'오데사 비게이','윌북',1010);

select*from book;
select*from author;

--2번
select 도서번호,책이름,분류,가격
from book
where 가격 between 15000 and 20000;

--3번
select 도서번호,책이름,분류,가격,할인가격,책소개,출판일
from book
where 책소개 like '%세계%';

--4번
select 분류,avg(가격)
from book
group by 분류
having avg(가격) >= 12000
order by 분류 desc; 

--5번
select 도서번호,책이름,책소개,rpad(분류,14,'@')as 분류
from book;

--6번
create table shopping(
    고객번호 number(4) primary key,
    고객이름 varchar2(20) not null,
    상품 varchar2(20),
    가격 number(7),
    개수 number(3)
);
select*from shopping;

alter table shopping add 비고 varchar2(10);
alter table shopping rename column 상품 to 구입상품;
alter table shopping drop column 개수;

--7번
select 책이름,가격,책소개,출판일
from book
where 가격 >= (select avg(가격) from book);

--8번
select 도서번호,책이름,분류, A.저자, A.출판사
from book B join author A using(도서번호);

--9번
select B.도서번호,B.책이름,B.분류,A.저자,A.출판사,B.할인가격
from book B left outer join author A on(B.도서번호=A.도서번호)
where B.분류='에세이'
order by 책이름 desc;

select*from author;
select*from book;

--10번
select 도서번호,책이름,분류,가격,책소개
from book
where 가격 in(select max(가격) from book group by 분류);


