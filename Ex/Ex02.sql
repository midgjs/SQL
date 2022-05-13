/*****************
* 그룹함수
******************/

/*
select  first_name,
        sum(salary)
from employees;
*/

select sum(salary)
from employees;

--그룹함수 - count()
select  count(*), -- null 포함
        count(commission_pct), -- null 제외
        count(manager_id) -- null 제외
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 - sum()
select  count(salary),
        count(*),
        sum(salary)
from employees;

--그룹함수 - avg()
select  count(*),
        sum(salary),
        avg(salary) -- null 값은 평균값 계산에서 제외
from employees;

select  count(*),
        sum(salary),
        avg(nvl(salary, 0)), -- null 값을 0으로 계산할시
        round(avg(salary))
from employees;

--그룹함수 max() / min()
select  max(salary),
        min(salary)
from employees;

-- GROUP BY 절
-- 절의 구성
select  first_name
from employees
where salary> 16000
order by salary desc;

/*
select  department_id, -- 여러개
        avg(salary) --전체평균 1개
from employees; -- 표현 불가
*/

select  department_id,
        job_id,
        avg(salary), -- departmend_id(부서별 평균)
        sum(salary), -- departmend_id(부서별 합계)
        count(salary) -- departmend_id(부서 총계)
from employees
group by department_id, job_id -- 부서로 그룹짓고 잡으로 세분화(쪼갬)
order by department_id asc;

/*연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 
급여합계를 출력하세요

--오류인 예제
select  department_id,
        count(*),
        sum(salary)
from employees
--where sum(salary) >= 20000 // where 절에는 그룹합수 사용불가
group by department_id;
*/

--having 절
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90;
--and hire_date >= 05/01/20; 
-- // having절에는 그룹함수와 group by에 참여한 컬럼만 사용 가능

--CASE ~ END 문
select  employee_id,
        first_name,
        salary,
        case when job_id = 'AC_ACCOUNT' then  salary+salary*0.1
             when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
        end realsalary
from employees;

--DECODE 문 
select  employee_id,
        first_name,
        job_id,
        salary,
        decode( job_id, 'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP', salary+salary*0.2,
                        'ST_CLERK', salary+salary*0.3,
                salary ) bonus
from employees;

/*
직원의 이름, 부서, 팀을 출력하세요 팀은 코드로 결정하며 부서코드가 10~50 이면 
‘A-TEAM’ 60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 
으로 출력하세요.
*/

select  first_name,
        department_id,
        case when 10<=department_id and department_id<=50 then 'A팀'
             when department_id>=60 and department_id<=100 then 'B팀'
             when department_id>=110 and department_id<=150 then 'C팀'
             else '팀없음'
        end team
from employees
order by department_id asc;






