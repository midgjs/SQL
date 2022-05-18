/********************************************
Practice04. 서브쿼리(SUBQUERY) SQL 문제입니다.
*********************************************/

/*
문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건)
*/

select  count(salary)
from employees
where salary <= (select  avg(salary)
                from employees);
                
/*
문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
(51건)
*/

select  e.employee_id,
        e.first_name,
        e.salary,
        avg,
        max
from employees e, (select  avg(salary) avg,
                           max(salary) max
                   from employees) s
where e.salary>=avg
and e.salary<=max
order by salary asc;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를
알아보려고 한다. 도시아이디(location_id), 거리명(street_address), 우편번호(postal_code),
도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/

/*
select  first_name,
        last_name,
        employee_id
from employees
where first_name = 'Steven';

select  *
from employees
where employee_id = 100;

찾을내용 : 도시아이디 / 거리명 / 우편번호 / 도시명 / 주 / 나라아이디
부서아이디 90
select  *
from departments
where department_id = 90;
도시아이디 location id = 1700

select  *
from locations
where location_id = 1700;
거리명street_address = 2004 Charade Rd
우편번호 postal_code = 98199
도시명 city = Seattle
주 State_Province = Washington
나라아이디 country id = US
*/

select  lo.location_id,
        street_address,
        postal_code,
        city,
        state_province,
        country_id
from locations lo, departments de
where lo.location_id = de.location_id
and department_id IN (select  department_id
                         from employees
                         where first_name = 'Steven'
                         and last_name = 'King');

/*
문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 
출력하세요  -ANY연산자 사용
(74건)
*/

select  employee_id,
        first_name,
        salary
from employees
where salary < ANY (select salary
                    from employees
                    where job_id = 'ST_MAN');

/*
문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 
부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
--조건절비교
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) IN (select department_id, max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;

--테이블조인
select  e.employee_id,
        e.first_name,
        e.salary,
        e.department_id
from employees e, (select department_id,
                          max(salary) max
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = max;

/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
(19건)
*/
/*
select  sum(salary) sum,
        job_id
from employees
group by job_id
order by sum desc;
*/

select  job_title,
        sum
from jobs j, (select  job_id, sum(salary) sum
              from employees
              group by job_id) e
where j.job_id = e.job_id
order by sum desc;

/*
문제7.
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 
이름(first_name)과 급여(salary)을 조회하세요 
(38건)
*/

select  e.employee_id,
        e.first_name,
        e.salary
from employees e, (select  avg(salary) avg, department_id
                   from employees
                   group by department_id) d
where e.salary>avg
and e.department_id = d.department_id;

/*
문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요
*/

select  rn,
        employee_id,
        first_name,
        salary,
        hire_date
from (select  rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.salary,
              ot.hire_date
      from (select  employee_id,
                    first_name,
                    salary,
                    hire_date
            from employees
            order by hire_date asc) ot
      ) ort
where rn >= 11
and rn <= 15;







