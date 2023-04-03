--1. salary 테이블의 모든 레코드를 검색
select*from salary;

--2. salary 테이블에서 이름,부서,직책,이메일만 검색
select 이름,부서,직책,이메일 from salary;

--3. salary 테이블에서 직책(중복 제거)만 검색 
select distinct 직책 from salary;

--4. salary 테이블에서 나이가 30 이상인 레코드의 이름,부서,생일,월급 검색
--   (현재날짜의 년도-생일의 년도)>=30
select 이름,부서,생일,월급 from salary
where trunc(months_between(sysdate,생일)/12) >=30;
    
--5. salary 테이블에서 부서가 '기획부'인 레코드의 번호,이름,부서,입사일 검색
 select 번호,이름,부서,입사일 from salary where 부서='기획부'; 
 
--6. salary 테이블에서 월급이 3000이상 4000미만인 레코드의 이름, 부서, 직책, 월급만 검색
select 이름,부서,직책,월급 from salary where 월급 >=3000 and 월급 < 4000;
select 이름,부서,직책,월급 from salary where 월급 between 3000 and 3999;

--7. in 키워드 사용 salary 테이블에서 직책이 차장, 대리,사원인 레코드만 검색
select *from salary where 직책 in('차장','대리','사원');

--8. between 키워드 사용 salary 테이블에서 입사일이 2020/01/01 ~ 2022/12/31 인 레코드만 검색
select *from salary where 입사일 between '2020/01/01' and '2022/12/31';


--9. not 키워드 사용 salary 테이블에서 추가수당이 있는 레코드만 검색
select*from salary where 추가수당 is not null;

--10. 사원이름이 '이'씨인 레코드의 이름, 부서, 직책,이메일 검색
select 이름, 부서, 직책, 이메일 from salary where 이름 like '이%';

--11. 사원이름을 기준으로 오름차순 정렬하여 테이블 표시하기
select *from salary order by 이름 asc;

--12. 부서별 오름차순,직책별 내림차순 정렬하여 테이블 표시하기
select*from salary order by 부서 asc, 직책 desc;

--13. 부서가'총무부' 이거나 1980년대 태어난 직원들의 정보 표시하기
select *from salary where 부서='총무부' or 생일 between '1980-01-01' and '1989-12-31' ;
select *from salary where 부서='총무부' or to_char(생일,'YYYY') >= 1980 and to_char(생일,'YYYY') < 1990;

--14. 추가수당이 있는 레코드를 검색하되, 월급 기준 내림차순하여 표시
select *from salary where 추가수당 is not null order by 월급 desc;

--15. 번호,이름,부서,입사일,월급,연봉 표시 연봉:월급*12-세금3.3%
select 번호,이름,부서,입사일,월급,월급*12-(월급*12*0.033) as 연봉 from salary ;

--16. 부서별 월급,최고액(월급),최저액(월급),합계(월급),평균(월급)표시
select 부서, max(월급), min(월급), sum(월급), floor(avg(월급))as 평균월급 from salary
group by 부서;

--17. 부서별 인원 표시하기
select 부서,count(*) from salary group by 부서;

--18. 이름이 '권혜정'인 직원과 동일한 부서에 있는 사람들의 이름,입사일 표시 단,'권혜정'직원은 표시 안함.
select 이름,입사일 from salary where 부서 in (select 부서 from salary where 이름 in '권혜정') and 이름 <> '권혜정';

--19. 자신의 급여가 평균 급여 이상인 직원들의 정보 표시, 단 급여를 기준으로 내림차순 정렬
select *from salary where (월급 >= (select avg(월급) from salary)) order by 월급 desc;

--20, 추가수당이 null이면 X표시, 아니면 O표시하기
select 이름 ,부서,직책,입사일, nvl2(추가수당,'O','X')as 추가수당여부 from salary;

--21. salary 테이블에서 이름을 성과 이름으로 분리해서 표시하고, 부서이름에서 '부'를 빼고 부서이름 표시하기
select substr(이름,1,1)as 성,substr(이름,2,2)as 이름, substr(부서,1,2)as 부서 from salary;

--22. salary테이블에서 이름 가운데 정보를 *로 바꿔서 표시하기
select replace(이름,substr(이름,2,1),'*')as 이름정보보호 from salary;
select substr(이름,1,1) || lpad('*',length(이름)-2,'*')|| substr(이름,3,1) as 이름정보보호 from salary;
SELECT CONCAT(SUBSTR(이름, 1, 1), CONCAT('*', SUBSTR(이름, 3, 1))) AS 이름 FROM SALARY;
select substr(이름,1,1) || '*' || substr(이름,3,1) as 이름정보보호 from salary;

--23. salary테이블에서 이름에 '님'자 붙여서 표시하기
select concat(이름,'님') from salary;
select 이름 || '님' as 이름 from salary;
--한글은 2byte를 차지하므로 length(이름)*2+2 해야 함
select rpad(이름,length*2+2,'님') as 이름 from salary;

--24. salary테이블에서 월급의 평균값을 소수점 2자리까지만 반올림하여 표시하기
select round(avg(월급),2)as 월급평균값 from salary;
select to_char(avg(월급),'FM9999.00')as 월급평균값 from salary;

--25. salary테이블에서 모든 직원은 입사일로부터 12개월 후에 호봉이 오를 예정이다. 호봉이 오를 예정인 날짜를 표시하기
select 이름,to_char(ADD_MONTHS(입사일,12),'YYYY-MM-DD')as 예정날짜 from salary;

--26. salary테이블에서 입사일과 생일을 년도-월-일로 표시하기
select 이름, 부서, to_char(입사일,'YYYY-MM-DD')as 입사일,to_char(생일,'YYYY-MM-DD')as 생일 from salary;

--27. salary테이블에서 직책이 '부장'이면 월급의 10% 인상, '차장'이면 월급의 7% 인상, '과장'이면 5% 인상, '대리'이면 3% 인상, '사원'이면 0 으로 월급 표시
select 이름,월급,
    decode(직책,
        '부장',월급+월급*0.1,
        '차장',월급+월급*0.07,
        '과장',월급+월급*0.05,
        '대리',월급+월급*0.03,
        월급
    )as 인상된월급
    from salary;

--28. salary테이블에서 월급이 평균월급이상인 직원의 부서별 번호,이름, 부서, 월급,이메일을 부서기준 오름차순 정렬하여 표시하기
select 번호,이름,부서,월급,이메일 from salary where (월급 >= (select avg(월급) from salary)) order by 부서;

--29. 28번 문제의 결과에 소계와 총계를 표시하기
select 번호,이름,부서,월급,이메일 from salary where (월급 >= (select avg(월급) from salary)) group by rollup(번호,부서,이름,월급,이메일);

--30. salary테이블의 총 레코드 수 표시하기
select concat(count(*),'개')as 총레코드수 from salary;