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

--/////In//////

--부서번호가 110인 직원들의 급여와 급여가 같은 전직원의 사번, 이름, 급여를 출력하세요
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