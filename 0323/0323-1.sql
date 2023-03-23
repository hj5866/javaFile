-- where 조건
select num, movieName, movieYear from moviedb where score >=4.5;
select * from actordb where actorName like '%병%';
-- drder by 필드명: 필드명 기준 오름차순 정렬
select num, movieName from moviedb where score >=4.6 order by movieName;
-- or, and 조건 2개 이상 연결
select num, actorName from actordb where height>=178 or weight >= 80;
-- 한효주 몸무게 바꾸기
update actordb set weight = 48 where actorName='한효주';
select*from actordb;
-- 정보 추가하기
insert into actordb (num,actorName,birthday,height,weight,marriage) values (6,'박보검','1990-12-24',182,70,0);
select*from actordb;