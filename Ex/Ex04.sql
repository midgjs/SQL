/*************************************
*SubQuery
*************************************/

/*
단일행 SubQuery
*/

--'Den' 보다 급여가 많은 사람의 이름과 급여는?
--1.
select  first_name,
        salary
from employees
where first_name = 'Den'; --'Den' -> 11000원

--2.
select  first_name,
        salary
from employees
where salary >= 11000
order by salary desc;

-- 한번에 표현하기
select  first_name,
        salary
from employees
where salary >= (select salary -- salary만 표시해야함
                from employees
                where first_name = 'Den')
order by salary desc;

--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select  min(salary)
                from employees);

--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
select  first_name,
        salary
from employees
where salary < (select  avg(salary)
                from employees);

/*
다중행 SubQuery 
*/

------In

--부서번호가 110인 직원들의 급여와 급여가 같은 전직원의 사번, 이름, 급여를 출력하세요
--부서번호가 100인 직원들의 급여
select  *
from employees
where department_id = 110;
--급여 12008 / 8300

select  *
from employees
where salary = 12008
or salary = 8300;

select  employee_id,
        first_name,
        salary
from employees
where salary in (12008, 8300);

select  employee_id,
        first_name,
        salary
from employees
where salary in (select  salary
                 from employees
                 where department_id = 110);

------ANY
--부서번호가 110인 직원 중 최저급여를 받는 직원보다 급여가 큰 모든 직원의
--사번, 이름, 급여를 출력하세요.

--(1)부서번호가 110인 직원의 급여
select  first_name,
        salary,
        department_id
from employees
where department_id = 110; --12008 , 8300

--(2)ANY(or)--> 8300보다 큰 직원
select  first_name,
        salary
from employees
where salary > Any(select  salary
                   from employees
                   where department_id = 110);

------ALL
--부서번호가 110인 직원 중 최고급여를 받는 직원보다 급여가 큰 직원

--(1)부서번호가 110인 직원의 급여
select  first_name,
        salary,
        department_id
from employees
where department_id = 110; --12008 , 8300

--(2)ALL(and)--> 12008 보다 큰 직원
select  first_name,
        salary
from employees
where salary > All(select  salary
                   from employees
                   where department_id = 110);

--------------------------------------------
--IN 예제
--각 부서별로 최고급여를 받는 사원을 출력하세요
--------------------------------------------

--where절로 구하기
select  department_id,
        employee_id,
        first_name,
        salary
from employees
where (department_id, salary) in (select  department_id, 
                                          max(salary)
                                  from employees
                                  group by department_id)      
order by department_id asc;
--null값을 표현하는 방법은? ex) nvl로 null값을 다른값으로 대체한다.


--테이블로 구하기 (컬럼이 추가된다)
select  e.first_name,
        e.salary,
        e.department_id,
        s.department_id,
        s.maxsalary
from employees e, (select  department_id,
                           max(salary) maxsalary 
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = maxsalary;
--order by department_id asc; 오류
--order by first_name; 가능
