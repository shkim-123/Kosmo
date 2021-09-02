--< 오라클 문제 >

-- 21.08.27 금
--15. employee 테이블에서 모든 컬럼, 모든 행의 데이터를 검색하면?
select * from employee
--16. employee 테이블에서 emp_no, emp_name, jikup, salary, hire_date 컬럼의 데이터를 검색하면?
select emp_no, emp_name, jikup, salary, hire_date from employee
--17. employee 테이블에서 emp_no, emp_name, jikup, salary, hire_date를 검색하면서
--별칭(=alias)을 사원번호, 직원명, 직급, 연봉, 입사일로 하고 연봉에 '만원' 이란 문자를 붙여 검색하면?
select emp_no as "사원번호", emp_name as "직원명", jikup as "직급", salary||'만원' as "연봉", hire_date as "입사일" from employee
--18. employee 테이블에서 직원명, 직급, 연봉, 세금, 실수령액을 검색하면? (세금은 연봉의 12%)
select emp_name, jikup, salary, salary*0.12 from employee
--19. employee 테이블에서 직급을 중복 없이 검색하면?
select distinct jikup from employee
select unique jikup from employee
--20. employee 테이블에서 부서번호와 직급을 중복 없이 검색하면?
select distinct dep_no, jikup from employee
--21. employee 테이블에서 연봉이 3000 이상인 직원을 검색하면?
select * from employee where salary >=3000
--22. employee 테이블에서 연봉 오름차순으로 검색하면?
select * from employee order by salary
--23. employee 테이블에서 연봉 내림차순으로 검색하면?
select * from employee order by salary desc
--24. employee 테이블에서 부서번호 오름차순을 유지하면서 연봉 내림차순으로 검색하면?
select * from employee order by dep_no, salary desc
--25. employee 테이블에서 직급이 높은 순서 나열해서 검색하면?
select * from employee order by decode(jikup, '사장',1, '부장',2,'과장',3,'대리',4,'주임',5,6)
--26. employee 테이블에서 부장만 검색하면?
select * from employee where jikup='부장'
--27. employee 테이블에서 20번 부서의 과장만 검색하면?
select * from employee where dep_no=20 and jikup='부장'
--28. employee 테이블에서 20번 부서 또는 과장을 검색하면?
select * from employee where dep_no=20 or jikup='과장'
--29. employee 테이블에서 과장 중에 연봉 3400 이상을 검색하면?
select * from employee where jikup='과장' and salary >= 3400
--30. employee 테이블에서 실수령 액이 4000만원 이상 받는 직원을 검색하면? 단, 세금을 12% 라고 가정한다.
select * from employee where salary*0.88 >= 4000
--31. employee 테이블에서 세금을 제일 많이 내는 직원 순서로 나열하면서 부서번호가 내림차순이면서 사장이 아닌 직원을 검색하면?
select * from employee where jikup <> '사장' order by salary*0.12 desc, dep_no desc
--32. employee 테이블에서 20번 부서 중에 연봉 2000 ~ 3000 사이 검색하면?
select * from employee where dep_no=20 and salary between 2000 and 3000
--33. employee 테이블에서 직속 상관이 없는 직원을 검색하면?
select * from employee where mgr_emp_no is null
--34. employee 테이블에서 직속 상관이 있는 직원을 검색하면?
select * from employee where mgr_emp_no is not null
--36. employee 테이블에서 최소 연봉, 최대 연봉, 평균 연봉, 연봉총합, 총인원수를 검색해서 출력하면?
select min(salary) as "최소연봉"
    , max(salary) as "최대연봉"
    , avg(salary) as "평균연봉"
    , sum(salary) as "연봉총합"
    , count(*) as "총인원수"
from employee
--37. 아래 SQL 구문은 무슨 문제의 답인가?
--SELECT COUNT(emp_no) FROM customer;
--
--
--38. 고객을 담당하고 있는 직원의 명수는?
select count(distinct emp_no) from customer
--39. 직속 상관이 있는 직원의 명수는?
select count(mgr_emp_no) from employee
--39-1. 부하직원이 있는 직원의 명수는?
select count(distinct mgr_emp_no) from employee
--40. employee 테이블에서 직원번호, 직원명, 생일월-생일일 검색해서 출력하면?
select emp_no, emp_name, substr(jumin_num, 3, 2)||'-'||substr(jumin_num, 5, 2) as "생일" from employee
--41. customer 테이블에서 모든 컬럼, 모든 행을 검색해서 출력하면? 단, 주민번호는 901225-2****** 형태로 출력하세요.
select cus_no, cus_name, tel_num, substr(jumin_num,1,6)||'-'||substr(jumin_num,7,1)||'******' as "주민번호"
from customer
--42. customer 테이블에서 고객번호, 고객명, 담당직원번호를 출력하면? 단, 담당직원번호가 없으면 NULL 출력하지 말고 '없음' 표시
select cus_no, cus_name, nvl(emp_no||'', '없음') from customer
--43. customer 테이블에서 고객번호, 고객명, 담당직원존재여부를 출력하면? 단, 직원번호가 있으면 "있음", 없으면 "없음"으로 표시
select cus_no, cus_name, nvl2(emp_no, '있음', '없음') from customer
--44. employee 테이블에서 직원번호, 직원명, 직급, 성별을 출력하면?
select emp_no, emp_name, jikup, case when substr(jumin_num, 7, 1) in('1', '3') then '남' else '여' end as "성별" from employee
--45. employee 테이블에서 직원번호, 직원명, 직급, 출생년도를 출력하면?
select emp_no, emp_name, jikup
    , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2) as "출생년도"
from employee
--46. employee 테이블에서 직원번호, 직원명, 직급, 출생년대(4자리)를 출력하면?
select emp_no, emp_name, jikup
    , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,1)||'0대' as "출생년대"
from employee
--47. employee 테이블에서 나이순으로 출력하면?
select * from employee order by case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)
--48. employee 테이블에서 직급 순서대로 정렬하여 모든 컬럼을 보이면?
select * from employee order by decode(jikup, '사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6)
--49. employee 테이블에서 직원번호, 직원명, 입사일(년-월-일(요일) 분기 시분초) 검색하면?
select emp_no, emp_name, to_char(hire_date,'yyyy-mm-dd(dy) q hh:mi:ss','nls_date_language=korean') as "입사일"
from employee
--49-1. employee 테이블에서 직원번호, 직원명, 입사일(x년-x월-x일(요일) x분기 x시x분x초) 검색하면?
select emp_no, emp_name
    , to_char(hire_date, 'yyyy"년"mm"월"dd"일"(day) q"분기" hh"시"mi"분"ss"초"', 'nls_date_language=korean') as "입사일"
from employee
--50. employee 테이블에서 직원번호, 직원명, 나이 검색하면?
select emp_no, emp_name
    , extract(year from sysdate)
     - to_number(case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1 as "나이"
from employee
--51. employee 테이블에서 직원번호, 직원명, 근무년차를 검색해서 출력하면?
select emp_no, emp_name, ceil((sysdate-hire_date)/365)||'년차' as "근무년차" from employee
--52. employee 테이블에서 직원번호, 직원명, 연령대를 검색해서 출력하면?
select emp_no, emp_name
    , floor((extract(year from sysdate)
        - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) +1)*0.1)||'0대'
        as "연령대"
from employee
--53. employee 테이블에서 직원번호, 직원명, 100일 잔치 날짜(년-월-일)을 검색해서 출력하면?
select emp_no, emp_name
    , to_char(to_date(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end
        ||substr(jumin_num,1,6), 'yyyymmdd')+100, 'yyyy-mm-dd') as "100일잔치날짜"
from employee
--53-1. 개강일이 2021년 5월 12일이고 종강일이 2021년 11월 10일 이다. 며칠 동안 학원 생활을 하나?
select to_date('20211110','yyyymmdd')-to_date('20210512','yyyymmdd') from dual
--54. employee 테이블에서 직원번호, 직원명, 현재나이, 입사일 당시 나이를 검색해서 출력하면?
select emp_no, emp_name
    , extract(year from sysdate)
    - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1
    as "현재나이"
    , extract(year from hire_date)
    - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1
    as "입사일당시나이"
from employee
--55. employee 테이블에서 직원번호, 직원명, 주민번호, 다가올생일날(년-월-일), 생일까지 남은일수를 검색하면?
select emp_no, emp_name, jumin_num
    , -- 생일 - 현재 > 0 올해, 아니면 내년
    to_char(to_date(case
        when to_number(substr(jumin_num,3,4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else extract(year from sysdate) +1
    end||substr(jumin_num,3,4), 'yyyymmdd'), 'yyyy-mm-dd') as "다가올생일날"
    , ceil(to_date(case
        when to_number(substr(jumin_num,3,4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else extract(year from sysdate) +1
    end||substr(jumin_num,3,4), 'yyyymmdd') - sysdate)||'일' as "생일까지남은일수"
from employee
--56. employee 테이블에서 직원번호, 직원명, 직급, 연봉(xxx,xxx,xxx만원)을 검색하면?
select emp_no, emp_name, jikup, to_char(salary, '999,999,999')||'만원' as "연봉" from employee
--57. employee 테이블에서 수요일에 태어난 직원을 검색하라
select * from employee
where to_char(to_date(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end
            ||substr(jumin_num,1,6),'yyyymmdd'), 'day','nls_date_language=korean') = '수요일'
--58. employee 테이블에서 70년대생 남자 직원을 검색하라
select * from employee where substr(jumin_num,1,1)='7' and substr(jumin_num,7,1)='1'
--59. employee 테이블에서 1960년대, 1970년대 출생자 중 남자만 검색하라
select * from employee where substr(jumin_num,1,1) in('6','7') and substr(jumin_num,7,1)='1'
--60. employee 테이블에서 오래 근무한 직원이 먼저 나오게 검색하면?
select * from employee order by sysdate-hire_date desc
--
--61. 직원번호, 직원명, 근무일수, 근무개월수, 입사후 5개월 후 날짜(년-월-일),
--입사한 달의 마지막 날짜(년-월-일), 입사한 날짜 기준 돌아오는 일요일날짜(년-월-일)를 검색하면?
--단, 근무일수는 소수 2자리에서 반올림
select emp_no, emp_name
    , round(sysdate-hire_date, 1) as "근무일수"
    , round(months_between(sysdate,hire_date),1) as "근무개월수"
    , to_char(add_months(hire_date,5),'yyyy-mm-dd') as "입사후5개월후"
    , to_char(last_day(hire_date),'yyyy-mm-dd') as "입사달마지막날"
    , to_char(next_day(hire_date, 1),'yyyy-mm-dd') as "입사날첫번째일요일"
from employee
--
--62. employee 테이블에서 직급이 과장인 직원을 검색하면?
select * from employee where jikup = '과장'
--63. employee 테이블에서 직급이 과장이 아닌 직원을 검색하면?
select * from employee where jikup <> '과장'
--64. employee 테이블에서 부서번호가 10번이고 직급이 과장인 직원을 검색하면?
select * from employee where dep_no = 10 and jikup='과장'
--65. employee 테이블에서 직급이 과장 또는 부장인 직원을 검색하면?
select * from employee where jikup in('과장', '부장')
--66. employee 테이블에서 10번, 20번 부서 중에 직급이 과장인 직원을 검색하면?
select * from employee where dep_no in(10,20) and jikup='과장'
--67. customer 테이블에서 담당직원이 없는 고객을 검색하면?
select * from customer where emp_no is null
--68. customer 테이블에서 담당직원이 있는 고객을 검색하면?
select * from customer where emp_no is not null
--69. customer 테이블에서 담당직원 번호가 9번이 아닌 고객을 검색하면?
select * from customer where emp_no <> 9 or emp_no is null
--70. employee 테이블에서 연봉이 3000 만원 ~ 4000만원 사이의 직원을 검색하면?
select * from employee where salary between 3000 and 4000
--71. employee 테이블에서 연봉이 3000만원 이상 ~ 4000만원 미만 사이의 직원을 검색하면?
select * from employee where salary between 3000 and 4000 and salary <> 4000
--72. employee 테이블에서 연봉을 5% 인상됐다고 가정하고 3000이상인 직원을 검색하면
select * from employee where salary*1.05 >= 3000
--73. employee 테이블에서 입사일 이 '1995-1-1' 이상인 직원을 검색하면?
select * from employee where hire_date >= to_date('1995-01-01', 'yyyy-mm-dd')
--74. employee 테이블에서 입사일이 1990년 ~ 1999년 사이인 직원을 검색하면?
select * from employee where hire_date between to_date('19900101','yyyymmdd') and to_date('19991231', 'yyyymmdd')
--75. employee 테이블에서 부서번호가 10번 또는 30번인 직원 중에 연봉이 3000 미만이고 입사일이 '1996-01-01' 미만 직원을 검색하면?
select * from employee where dep_no in(10,30) and salary < 3000 and hire_date < to_date('1996-01-01', 'yyyy-mm-dd')
--76. employ 테이블에서 성이 김씨인 직원을 검색하면?
select * from employee where emp_name like '김%'
--77. employ 테이블에서 성이 황씨인 직원을 검색하면?
select * from employee where emp_name like '황%' and emp_name not like '황보%'
--78. employee 테이블에서 이름이 2자인 직원을 검색하면?
select * from employee where length(emp_name) = 2
--79. employee 테이블에서 이름이 김으로 끝나는 직원을 검색하면?
select * from employee where emp_name like '%김'
--80. employee 테이블에서 성이 김씨이고 3글자인 직원을 검색하면?
select * from employee where emp_name like '김__'
--81. employee 테이블에서 이름에 김이란 문자를 가진 직원을 검색하면?
select * from employee where emp_name like '%김%'
--82. employee 테이블에서 성이 김씨가 아닌 직원을 검색하면?
select * from employee where emp_name not like '김%'
--83. employee 테이블에서 이름 중간에만 김이 들어간 직원을 검색하면?
select * from employee where emp_name like '%김%' and emp_name not like '김%' and emp_name not like '%김'
--84. employee 테이블에서 여자 직원을 검색하라
select * from employee where substr(jumin_num,7,1) in('2','4')
--85. employee 테이블에서 1960년대, 1970년대 출생자중 남자만 검색하라
select * from employee where substr(jumin_num,1,1) in('6','7') and substr(jumin_num,7,1) ='1'
--86. 직원번호, 직원명, 소속부서명 검색?
--87. 고객번호, 고객명, 고객담당직원이름 검색하면?
--88. 평균 연봉보다 많이 받는 직원을 검색하면?
--89. 직급별, 평균연봉 검색하면?
--
--90. 직원번호, 직원명, 소속부서명 검색?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no

select e.emp_no, e.emp_name, d.dep_name
from employee e inner join dept d on e.dep_no = d.dep_no
--91. 고객명, 고객전화번호, 담당직원명, 담당직원직급을 출력하면? <조건> 담당직원이 있는 고객만 출력
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no


select * from customer
--92. 고객명, 고객전화번호, 담당직원명, 담당직원직급을 출력하면? <조건> 10번 부서의 담당직원이 있는 고객만 출력
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.dep_no=10

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no
where e.dep_no=10


-- 21.08.29 일요일
--93. 고객명, 고객전화번호, 담당직원명, 담당직원직급을 출력하면? <조건> 연봉이 3000만원 이상인 담당직원이 있는 고객만 포함
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no and e.salary >= 3000

--94. 직원명, 직원직급, 직원부서명, 담당고객명, 고객전화를 출력하면? <조건> 직원 이름 오름차순 정렬
select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e, dept d, customer c
where e.dep_no=d.dep_no and e.emp_no = c.emp_no
order by e.emp_name

select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e inner join dept d on e.dep_no=d.dep_no
                inner join customer c on e.emp_no = c.emp_no
order by e.emp_name

--95. 직원명, 직원직급, 소속부서명, 연봉등급을 출력하면? 연봉등급 오름차순, 직급높은순서 오름차순, 나이높은순서 내림 유지 요망
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e, dept d, salary_grade s
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(jikup, '사장',1, '부장',2,'과장',3,'대리',4,'주임',5,6)
        , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)

select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e inner join dept d on e.dep_no = d.dep_no
                inner join salary_grade s on e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(jikup, '사장',1, '부장',2,'과장',3,'대리',4,'주임',5,6)
        , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)

--96. 부하직원명, 부하직원직급, 직속상관명, 직속상관직급을 출력하면? <조건> 상관이 있는 직원만 포함
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.mgr_emp_no = e2.emp_no

select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e inner join employee e2 on e.mgr_emp_no = e2.emp_no
--97. 직속상관명, 직속상관직급, 부하직원명, 부하직원직급을 출력하면? <조건> 상관이 있는 직원만 포함
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.emp_no = e2.mgr_emp_no

select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e inner join employee e2 on e.emp_no = e2.mgr_emp_no

--98. 직원명, 직원직급, 소속부서명, 연봉등급, 직속상관명, 직속상관직급, 담당고객명을 출력하면?
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e, dept d, salary_grade s, employee e2, customer c
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
    and e.mgr_emp_no = e2.emp_no and e.emp_no = c.emp_no

select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e inner join dept d on e.dep_no = d.dep_no
                inner join salary_grade s on e.salary between s.min_salary and s.max_salary
                inner join employee e2 on e.mgr_emp_no = e2.emp_no
                inner join customer c on e.emp_no = c.emp_no
--99. 고객명, 고객전화번호, 담당직원명, 담당직원직급을 출력하면? <조건> 담당직원이 없는 고객도 포함
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+)

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no

--100. 고객번호, 고객명, 고객전화번호, 담당직원명, 담당직원직급을 출력하면? <조건> 고객정보는 모두 보이고 직원정보는 10번 부서만 보일 것
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+) and e.dep_no(+)=10

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no and e.dep_no=10
--101. 고객번호, 고객명, 고객전화번호, 담당직원명, 담당직원직급, 담당직원연봉등급을 출력하면? <조건> 담당직원이 없는 고객도 포함
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, s.sal_grade_no
from customer c, employee e, salary_grade s
where c.emp_no = e.emp_no(+) and e.salary between s.min_salary(+) and s.max_salary(+)

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, s.sal_grade_no
from customer c left outer join employee e on c.emp_no = e.emp_no
                left outer join salary_grade s on e.salary between s.min_salary and s.max_salary
--102. 고객번호, 고객명, 고객주민번호를 출력하라. 단, 연봉이 3000 이상인 담당직원이 담당한 고객 이어야 한다.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000

select c.cus_no, c.cus_name, c.jumin_num
from customer c inner join employee e on c.emp_no = e.emp_no
where e.salary >= 3000
--103. 고객번호, 고객명, 고객주민번호를 출력하라. 단, 40살 이상인 담당직원이 담당한 고객 이어야 한다.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and
   40 <= extract(year from sysdate)
    - to_number(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,2)) + 1

select c.cus_no, c.cus_name, c.jumin_num
from customer c inner join employee e on c.emp_no = e.emp_no
where 40 <= extract(year from sysdate)
    - to_number(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,2)) + 1
--103-1. 10번 부서 또는 30번 부서 직원이 담당하는 고객을 검색하면?
select * from employee e, customer c where e.emp_no=c.emp_no and e.dep_no in('10','30')

select * from employee e inner join customer c on e.emp_no=c.emp_no where e.dep_no in('10','30')
--
--104. 고객번호, 고객명,
--담당직원번호,담당직원명, 담당직원소속부서명, 담당직원연봉등급, 담당직원직속상관명, 담당직원직속상관직급,
--직속상관연봉등급 출력하라. 단, 고객은 다 나와야 하고 NULL은 없음으로 표시
select c.cus_no, c.cus_name, nvl(e.emp_no||'', '없음'), nvl(e.emp_name||'', '없음')
    , nvl(d.dep_name||'', '없음'), nvl(s.sal_grade_no||'', '없음')
    , nvl(e2.emp_name||'', '없음'), nvl(e2.jikup||'', '없음'), nvl(s2.sal_grade_no||'', '없음')
from customer c, employee e, dept d, salary_grade s, employee e2, salary_grade s2
where c.emp_no = e.emp_no(+) and e.dep_no = d.dep_no(+) and e.salary between s.min_salary(+) and s.max_salary(+)
    and e.mgr_emp_no = e2.emp_no(+) and e2.salary between s2.min_salary(+) and s2.max_salary(+)


select c.cus_no, c.cus_name, nvl(e.emp_no||'', '없음'), nvl(e.emp_name||'', '없음')
    , nvl(d.dep_name||'', '없음'), nvl(s.sal_grade_no||'', '없음')
    , nvl(e2.emp_name||'', '없음'), nvl(e2.jikup||'', '없음'), nvl(s2.sal_grade_no||'', '없음')
from customer c left outer join employee e on c.emp_no = e.emp_no
                left outer join dept d on e.dep_no = d.dep_no
                left outer join salary_grade s on e.salary between s.min_salary and s.max_salary
                left outer join employee e2 on e.mgr_emp_no = e2.emp_no
                left outer join salary_grade s2 on e2.salary between s2.min_salary and s2.max_salary
--
--
--105. 직원명, 직원전화번호 와 고객명, 고객전화번호를 종으로 붙여 출력하라. 조건은 중복하지 말 것
select emp_name||'직원' as "이름", phone from employee
union
select cus_name||'고객', tel_num from customer
--106. 직원명, 직원전화번호 와 고객명, 고객전화번호를 종으로 붙여 출력하라. 조건은 중복허락
select emp_name||'직원' as "이름", phone from employee
union all
select cus_name||'고객', tel_num from customer
--108. 최고 연봉을 받는 직원을 검색하라
select * from employee where salary = (select max(salary) from employee)
--109. 평균 연봉 이상을 받는 직원을 검색하라
select * from employee where salary >= (select avg(salary) from employee)
--110. 20번 부서에서 최고 연봉자 직원을 검색하라
select * from employee where salary = (select max(salary) from employee where dep_no=20) and dep_no=20
--
--111. 직원명, 직급, 연봉, 전체연봉에서 차지하는 비율을 검색하라. 단, 전체연봉에서 차지하는 비율은 소수점 버림하고 %로 표현하라.
--단, 높은 비율이 먼저 나오게 정렬하라.
select emp_name, jikup, salary, floor(salary/(select sum(salary) from employee)*100)||'%' "비율"
from employee
order by salary/(select sum(salary) from board)*100 desc
--
--112. 10번 부서 직원들이 관리하는 고객번호, 고객명, 직원번호를 검색하면?
select cus_no, cus_name, emp_no
from customer c
where emp_no in(select emp_no from employee where dep_no=10)
--113. 평균 연봉 이상이고 최대 연봉 미만의 직원명, 연봉, 전체평균연봉, 전체최대연봉을 출력하면?
select emp_name, salary, (select avg(salary) from employee) as "전체평균연봉", (select max(salary) from employee) as "전체최대연봉"
from employee
where salary >= (select avg(salary) from employee) and salary < (select max(salary) from employee)
--114. 최고 연봉 직원의 직원번호, 직원명, 부서명, 연봉을 검색하면?
select e.emp_no, e.emp_name, d.dep_name, e.salary
from employee e, dept d
where e.dep_no=d.dep_no and e.salary = (select max(salary) from employee)
--115. 담당 고객이 2명 이상인 직원번호, 직원명, 직급을 검색하면?
select e.emp_no, e.emp_name, e.jikup
from employee e
where 2 <= (select count(emp_no) from customer c where e.emp_no=c.emp_no)
--116. 직원번호, 직원명, 소속부서명을 검색하면?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no

select e.emp_no, e.emp_name, d.dep_name
from employee e inner join dept d on e.dep_no = d.dep_no
--117. 직원번호, 직원명, 연봉, 연봉 순위를 출력하면? 단, 연봉 순위를 오름차순 유지
select e.emp_no, e.emp_name, e.salary, (select count(*)+1 from employee e2 where e.salary < e2.salary) as "연봉순위"
from employee e
order by 4
--118. 직원번호, 직원명, 담당고객수를 출력하면?
select e.emp_no, e.emp_name, (select count(*) from customer c where c.emp_no=e.emp_no) as "담당고객수"
from employee e
--119. 부서명, 부서직원수, 부서담당고객수를 출력하면?
select d.dep_name, (select count(*) from employee e where e.dep_no=d.dep_no) as "부서직원수"
    , (select count(*) from employee e, customer c where e.emp_no=c.emp_no and d.dep_no=e.dep_no) as "부서담당고객수"
from dept d
--
--120. 직원번호, 직원명, 직급, 주민번호, 직급서열순위를 출력하면?
--단, 직급이 같으면 나이 많은 직원이 직급서열순위 이다. 그리고 직급서열순위를 오름차순 유지
select e.emp_no, e.emp_name, e.jikup, e.jumin_num
    , (select count(*)+1 from employee e2
        where (e.jikup <> e2.jikup and decode(e.jikup,'사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6)
        > decode(e2.jikup,'사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6))
        or (e.jikup = e2.jikup and
        case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,6)
        > case when substr(e2.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e2.jumin_num,1,6))
         ) as "직급서열순위"
from employee e
order by 5
--
--121. 고객번호, 고객명, 고객전화번호, 담당직원명, 담당직원직급, 부서번호를 출력하면?
--<조건> 담당직원이 없는 고객도 포함. 단, 조인을 사용하지 말고 서브쿼리를 사용하십시오.
select cus_no, cus_name, tel_num
    ,(select emp_name from employee e where e.emp_no=c.emp_no) as "담당직원명"
    ,(select jikup from employee e where e.emp_no=c.emp_no) as "담당직원직급"
    ,(select dep_no from employee e where e.emp_no=c.emp_no) as "부서번호"
from customer c
--
--122. 고객번호, 고객명, 고객전화번호, 담당직원명, 담당직원직급, 부서번호를 출력하면?
--<조건>고객정보는 모두 보이고 직원정보는 10번 부서만 보일 것. 단, 조인을 사용하지 말고 서브쿼리를 사용하십시오.
select cus_no, cus_name, tel_num
    ,(select emp_name from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "담당직원명"
    ,(select jikup from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "담당직원직급"
    ,(select dep_no from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "부서번호"
from customer c
--
--124. 부서별로 부서번호, 급여합, 평균급여, 인원수를 출력하면? 단, 평균은 소수 둘째 자리에서 반올림 할 것
select d.dep_no, sum(e.salary) as "SUM_SALARY", round(avg(e.salary),1) "AVG_SALARY", count(*) "CNT"
from dept d, employee e
where d.dep_no=e.dep_no
group by d.dep_no
--125. 직급별로 직급, 급여합, 평균급여, 인원수를 출력하면? 단, 평균은 소수 둘째 자리에서 반올림 할 것
select jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by jikup
--126. 부서별, 직급별, 부서번호, 직급, 급여합, 평균급여, 인원수를 출력하면? 단, 평균은 소수 둘째 자리에서 반올림 할 것
select dep_no, jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, jikup
--127. 부서별, 직급별, 부서번호, 직급, 급여합, 평균급여, 인원수를 출력하되 인원수는 3명 이상인 출력하면?
select dep_no, jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, jikup
having count(*) >= 3
--128. 부서별, 성별로 부서번호, 성별, 급여합, 평균급여, 인원수를 출력하면?
select dep_no, case when substr(jumin_num,7,1) in('1','3') then '남' else '여' end as "성별"
        , sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, case when substr(jumin_num,7,1) in('1','3') then '남' else '여' end
--129. 입사년도별로 입사년도, 인원수를 출력하고 년도별로 오름차순 하면?
select extract(year from hire_date) as "입사년도", count(*) as "CNT"
from employee
group by extract(year from hire_date)
order by 1
--130. 부서별로 부서번호, 평균근무년수를 출력하면? (근년수는 소수점 둘째 자리에서 반올림할 것)
select dep_no, round(avg((sysdate-hire_date)/365),1) as "평균근무년수"
from employee
group by dep_no
--131. 입사분기별로 입사분기, 인원수를 출력하면?
select to_char(hire_date, 'q') as "Q", count(*) as "CNT"
from employee
group by to_char(hire_date, 'q')
--132. 입사연대별, 성별로 입사연대, 성별, 연대별입사자수 출력하면?
select substr(extract(year from hire_date),1,3)||'0년대' as "HIRE_DATE"
    , case when substr(jumin_num,7,1) in('1','3') then '남' else '여' end as "GENDER", count(*)
from employee
group by substr(extract(year from hire_date),1,3)||'0년대', case when substr(jumin_num,7,1) in('1','3') then '남' else '여' end
--
--133. 직원명, 입사일(년-월-일 ~/4분기 한글 1자리 요일), 퇴직일(년-월-일) 출력하면?
--<조건> 퇴직일은 입사 후 20년 5개월 10일 후
select emp_name, to_char(hire_date, 'yyyy-mm-dd q"/분기" dy', 'nls_date_language=korean') as "입사일"
    , to_char(add_months(hire_date+10, 5)+20*365,'yyyy-mm-dd') as "퇴직일"
from employee
--
--134. 직원들이 있는 부서별로 부서번호, 부서위치, 직원수를 출력하면? 모든 부서 다 나와라
select dep_no, loc, (select count(*) from employee e where e.dep_no=d.dep_no)
from dept d

select d.dep_no, d.loc, count(e.emp_no)
from dept d, employee e
where d.dep_no=e.dep_no(+)
group by d.dep_no, d.loc
--
--135. 월별로 입사월, 인원수를 검색하면? 입사월 오름차순 유지 <조건> 입사월 오름차순 유지
--<조건> 위 결과에서 2월, 9월은 없어서 빠진다. 2월, 9월도 포함시키고 인원수는 0으로 포함하려면?
select extract(month from hire_date) as "HIRE_DATE_MONTHS", count(*) as "CNT"
from employee
group by extract(month from hire_date)
union select 2, 0 from dual
union select 9, 0 from dual
order by 1
--
--136. employee 테이블에서 직급순서대로 정렬하여 직급별로 직급, 직급평균연봉, 인원수를 검색하면? (높은 직급이 먼저 나와야함)
select jikup, round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by jikup
order by decode(jikup, '사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6)
--137. 부서별 부서번호, 부서명, 직원수, 직원이관리하는고객수를 검색하면?
select d.dep_no, d.dep_name, count(distinct e.emp_no) as "EMP_CNT", count(c.emp_no) as "CUS_CNT"
from dept d, employee e, customer c
where d.dep_no=e.dep_no(+) and e.emp_no = c.emp_no(+)
group by d.dep_no, d.dep_name
--
--138. 퇴직일이 60세라는 기준 하에 아래처럼 출력하면?
--직원번호, 직원명, 근무년차, 퇴직일까지 남은 년도, 생일(년-월-일 요일명), 소속부서명, 직속상관명, 직속상관 부서명.
--단, 모든 직원 다 나오고, 직급 높은 사람이 먼저 나오고 직급이 같으면 나이가 많은 사람이 나와야함.
select e.emp_no, e.emp_name
    , ceil((sysdate-e.hire_date)/365) as "HIRE_YEAR"
    , to_char(to_date(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end
            ||substr(e.jumin_num, 1,6),'yyyymmdd'),'yyy-mm-dd', 'nls_date_language=korean') as "BIRTH"
    , d.dep_name, e2.emp_name, d2.dep_name
from employee e, dept d, employee e2, dept d2
where e.dep_no = d.dep_no(+) and e.mgr_emp_no=e2.emp_no(+) and e2.dep_no = d2.dep_no(+)
order by decode(e.jikup,'사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6)
    , case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num, 1,6)
--
--140. 연봉 서열대로 직원을 검색하되 1행부터 10행까지만 검색하면?
select * from (select rownum "RNUM", zxc.*
from (
    select * from employee order by salary
) zxc where rownum <= 10) where rnum >=1
--
--140-6. 고객 나이 서열중 6행부터 10행까지 검색하면?
select * from (select rownum "RNUM", zxc.* from (
    select * from customer
    order by case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)
) zxc where rownum <= 10) where rnum >= 6
--
--140-7. 직원 직급 서열 중 2행부터 5행까지 검색하면?
select * from (select rownum as "RNUM", zxc.* from(
select * from employee order by decode(jikup,'사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6)
) zxc where rownum <= 5) where rnum >=2
--

-- 21.09.02 목
--141. 오늘부터 10일 이후까지 날짜 중에 토요일, 일요일, 월요일을 제외한 날의 개수를 구하면?
select count(*) from (
    select sysdate "TODAY" from dual
    union select sysdate+1 from dual union select sysdate+2 from dual union select sysdate+3 from dual
    union select sysdate+4 from dual union select sysdate+5 from dual union select sysdate+6 from dual
    union select sysdate+7 from dual union select sysdate+8 from dual union select sysdate+9 from dual
    union select sysdate+10 from dual
) where to_char(today, 'day', 'nls_date_language=korean') not in('토요일', '일요일', '월요일')

--
--142. 이번달 중에 토요일, 일요일을 제외한 날의 개수를 구하면? = 이번달 평일 수 구하기
--
--146. employee 테이블로부터 salary 컬럼만 제외하고 다 볼 수 있는 뷰 employee_vw1를 생성하면?
create view employee_vw1 as select emp_no, emp_name, dep_no, jikup, hire_date,jumin_num,phone,mgr_emp_no from employee

--
--147. 뷰 employee_vw1에 데이터 '이승엽', 40, '과장', '1990-09-01', '7811231452719', '01090056376', 1 를 입력하면?
insert into employee_vw1(emp_no, emp_name, dep_no, jikup, hire_date,jumin_num,phone,mgr_emp_no )
    values((select nvl(max(emp_no, 0)+1 from employee)
        , '이승엽', 40, '과장', to_date('1990-09-01', 'yyyy-mm-dd'), '7811231452719', '01090056376', 1 )
--
--148. 뷰 employee_vw1에서 주민번호 '7811231452719', 직원명 '이승엽'의 직급을 부장으로 수정하면?
update employee_vw1 set jikup='부장' where jumin_num='7811231452719' and emp_name='이승엽'
--
--149. 뷰 employee_vw1에서 주민번호 '7811231452719' 인 직원을 제거하면?
delete from employee_vw1 where jumin_num='7811231452719'
--
--150. 뷰 employee_vw1 를 제거하면?
drop view employee_vw1
--
--150-1. 부서별, 직급별 부서번호, 부서명, 직급, 평균연봉을 출력하는 뷰 employee_vw3를 생성하면?
create view employee_vw3 where
select d.dep_no, d.dep_name, e.jikup, avg(e.salary) as "AVG_SALARY"
    from dept d, employee e
    where d.dep_no = e.dep_no
    group by d.dep_no, d.dep_name, e.jikup
--
--151. 다음 뷰에 대한 질문에 대답하면?
--CREATE VIEW employee_vw4 AS
--SELECT emp_no, emp_name, dep_no FROM employee;
--위의 뷰를 만든 후 INSERT INTO employee_vw4 VALUES(21, '사오순', 40);
--실행하면 성공하나 실패하나?
--
--
--152. 다음 뷰에 대한 질문에 대답하면?
--INSERT INTO dept VALUES(60, '전략부', '부산');
--CREATE VIEW dept_vw1 AS
--SELECT dep_no, dep_name, loc FROM dept
--WHERE dep_no = 60 WITH CHECK OPTION;
--문제!!
--UPDATE dept_vw1 SET dep_no = 70 WHERE dep_no = 60; 을 실행하면?
--
--156. employee 테이블에 '장보고', 40, '대리', 3500, '2012-05-28', '8311091109310', '01092499215', 3 데이터를 입력하면?
insert into employee(emp_no, emp_name, dep_no, jikup, salary, hire_date, jumin_num, phone, mgr_emp_no)
    values((select nvl(max(emp_no),0)+1 from employee)
            ,'장보고', 40, '대리', 3500, to_date('2012-05-28', 'yyyy-mm-dd'), '8311091109310', '01092499215', 3  )
--
--157. employee 테이블에서 직원 번호가 18번 이고, 주민번호 '8203121977315'인 '강감찬' 직원의 직급을 '주임'으로 수정하려면?
update employee set jikup='주임' where emp_no=18
--
--158. 여성 직원의 월급을 500만원 인상하는 UPDATE 문은?
update employee set salary=salary+500 where substr(jumin_num,7,1) in('2','4')
--
--159. employee 테이블에서 평균 연봉 이상의 직원 연봉을 2% 삭감하면?
update employee set salary=salary*0.98 where salary >= (select avg(salary) from employee)
--
--160. employee 테이블에서 평균 연봉 보다 작은 연봉자의 연봉을 50만원 인상하면?
update employee set salary=salary+50 where salary < (select avg(salary) from employee)
--
--161. 담당 고객이 있는 직원의 급여를 5% 인상하면?
update employee set salary=salary*1.05 where emp_no in(select distinct emp_no from customer where emp_no is not null)
--
--162. 연봉 서열 2~5위까지 5명의 연봉을 10% 인하하면?
--정렬 기준 → 연봉높은 순서 > 직급 높은 순서 > 입사일 빠른 순서 > 나이 높은 순서
update employee set salary=salary*0.9 where emp_no in(
    select emp_no from (select rownum "RNUM",zxc.* from (
        select emp_no from employee order by salary desc, decode(jikup,'사장',1,'부장',2,'과장',3,'대리',4,'주임',5,6), hire_date,
            extract(year from sysdate)-to_number(case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,4)) + 1
    ) zxc where rownum <= 5 ) where rnum >=2
)
--
--163. employee와 똑같은 구조와 똑같은 데이터를 가진 쌍둥이 테이블 employee2 만들면?
create table employee2 as select * from employee
--
--164. employee와 똑같은 구조를 가진 쌍둥이 테이블 employee3를 만들되 데이터는 복사해 오지 않으려면?
create table employee3 as select * from employee where 1=2
--
--
--