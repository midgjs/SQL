/*selet문 기본*/
select * 
from employees;

select * from departments;

select employee_id, first_name, phone_number from employees;

/****************************
select 문
    select 절
    from 절
    where 절
    order by 절
*****************************/

--모든 컬럼 조회하기
select *
from employees;

select *
from departments;

--원하는 컬럼 조회하기
select employee_id, first_name, last_name
from employees;

--예제)
--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary
from employees;

--사원의 이름, 성, 급여, 전화번호, 이메일, 입사일을 출력하세요
select first_name, last_name, salary, phone_number, email, hire_date
from employees;

-- 출력할 때 컬럼에 별명 사용하기
-- 사원의 이름과 전화번호 입사일 급여로 표시되도록 출력하세요
select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
from employees;

--사원의 사원번호, 이름, 성, 급여, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select first_name as 이름, --as생략가능
       last_name 성,
       salary as salary,
       phone_number "hp", --"안쓰면 대문자로 표기
       email "이 메 일", -- 공백도 따옴표 사용해야한다
       hire_date 입사일
from employees;

-- 1. 테이블 명 확인 / 2. 컬럼명확인+자료불러오기 / 3. 별명 붙이기

--연결연산자(컬럼을 붙이기)
select  first_name || last_name
from employees;

select  first_name || '           ' || last_name
from employees;

select first_name|| ' hire date is ' ||hire_date 입사일 
from employees;

--산술 연산자 사용하기
select  first_name, 
        salary, 
        salary*12,
        (salary+300)*12
from employees;

--전체직원의 정보를 다음과 같이 출력하세요
select  first_name||'-'||last_name "성명",
        salary "급여",
        salary*12 "연봉",
        (salary*12)+500 "연봉2",
        phone_number "전화번호"
from employees;



select *
from employees;

/*where절*/
select first_name
from employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  first_name, 
        salary
from employees
where salary*12 >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
--문자, 날짜는 ‘ ‘ 로 감싸줌    ‘ ‘는 대소문자를 구분한다
select  first_name,
        hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
--처음에 이름도 출력해서 확인해보고 정리
select salary*12
from employees
where first_name = 'Lex';

/*조건이 2개이상 일때 한꺼번에 조회하기*/
--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary >= 14000 
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--BETWEEN 연산자로 특정구간 값 출력하기(값 포함) 
select first_name, salary
from employees
where salary between 14000 and 17000;

--IN 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100); --or사용해서 작성도 가능하다

--Like 연산자로 비슷한것들 모두 찾기
select first_name, last_name, salary
from employees
where first_name like 'L%';

select first_name, last_name, salary
from employees
where first_name like '%s%';

select first_name, last_name, salary
from employees
where first_name like 'L___';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name, salary
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name, salary
from employees
where first_name like '__a_';

--is null / is not null
select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where commission_pct is not null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name,
        commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select  first_name
from employees
where commission_pct is null
and manager_id is null;

select  first_name,
        salary
from employees
where salary >= 10000;

--order by 절을 사용해 보기 좋게 정렬하기
select  first_name,
        salary
from employees
order by salary asc; -- 작은수->큰수

select  first_name,
        salary
from employees
order by salary desc; -- 큰수->작은수

select  first_name,
        salary
from employees
where salary >= 9000
order by salary desc;

--복수정렬
--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 
--부서번호 급여 이름을 출력하세요  
select  department_id,
        salary
from employees
where salary >=10000
order by salary desc;

/*
단일행 함수
*/
--문자함수 - INICAP(컬럼명)
--부서번호 100인 직원의 이메일주소와 부서번호를 출력하세요
select  email,
        initcap(email) "email2",
        department_id
from employees
where department_id = 100;

--문자함수 - LOWER(컬럼명) / UPPER(컬럼명)
select  first_name,
        upper(first_name) "upper",
        lower(first_name) "lower"
from employees
where department_id = 100;

--문자함수 - SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name,
        substr(first_name,2,4),
        substr(first_name,-3,2)
from employees
where department_id = 100;

--문자함수 - LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
select first_name, 
       lpad(first_name,6,'*'), 
       rpad(first_name,10,'*')
from employees;

--문자함수 ? REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name, 'a', '*'),
        substr(first_name,2, 3),
        replace(first_name, substr(first_name,2, 3), '***')
from employees
where department_id = 100;

select replace('abcdefg', 'bc', '******')
from dual;

select  substr('900214-1234234', 8, 1)
from dual;

--숫자함수 ? ROUND(숫자, 출력을 원하는 자리수) //반올림
select  round(123.346, 2),  --123.35로 반올림
        round(123.456, 0),
        round(123.4549, 2),
        round(123.756, 0)
from dual; 

--숫자함수 ? TRUNC(숫자, 출력을 원하는 자리수) //버림
select  trunc(123.346, 2),
        trunc(123.346, 1),
        trunc(123.346, -2)
from dual;

--날짜함수 ? SYSDATE()
select sysdate
from dual;

select months_between('2022/05/12', '2022/04/11')
from dual;

--단일함수>날짜함수 ? MONTH_BETWEEN(d1, d2) 
select months_between(sysdate, hire_date)
from employees
where department_id=110;

--TO_CHAR(숫자, ‘출력모양’)  숫자형?문자형으로 변환하기
select  first_name,
        to_char(salary*12, '$099,999,999.99')
from employees
where department_id = 110;

--단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜?문자형으로 변환하기

select  sysdate,
        to_char(sysdate, 'yyyy'),
        to_char(sysdate, 'yy'),
        to_char(sysdate, 'mm'),
        to_char(sysdate, 'month'),
        to_char(sysdate, 'dd'),
        to_char(sysdate, 'day'),
        to_char(sysdate, 'ddth'),
        to_char(sysdate, 'hh'),
        to_char(sysdate, 'hh24'),
        to_char(sysdate, 'mi'),
        to_char(sysdate, 'ss'),
        to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

--null값 변환
select  first_name,
        commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0) -- NVL2(컬럼명, not null, null)
from employees;