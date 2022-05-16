/*******************************
*JOIN
********************************/
--equi join

select *
from employees, departments;

select  employee_id, 
        first_name,
        salary,
        department_name,
        em.department_id "e_did",-- 출신 성분 앞에 써줘야한다 
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;

--예제) 모든 직원이름, 부서이름, 업무명 을 출력하세요
select  e.first_name,
        d.department_name,
        j.job_title,
        e.salary,
        e.department_id,
        d.department_id,
        e.job_id,
        j.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and e.salary >= 7000
order by salary desc;

--left join

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--left join 예제
select  e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

--left join 오라클 표현법
select  e.first_name,
        d.department_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id(+);

--right join

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--right join 예제
select  e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

--right join 오라클 표현법
select  e.first_name,
        d.department_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

--right join --> left join

select  e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;


select  e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from departments d left outer join employees e
on e.department_id = d.department_id;

--full outer join // 오라클 표현법 따로 없음
select  e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;

--**Self Join
select  e.employee_id "직원id",
        e.first_name "직원이름",
        e.salary "직원월급",
        e.phone_number "직원 폰번호",
        e.manager_id "직원의 매니저 id",
        m.employee_id "매니저의 id",
        m.first_name "매니저이름",
        m.phone_number "매니저 폰번호"
from employees e, employees m
where e.manager_id = m.employee_id;

