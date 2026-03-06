#Find the employee number for employees named MARTIN.

    select employees.employee_number from employees where employee_name = 'MARTIN';

#Find the employee(s) with a salary greater than 1500.

    select * from employees where salary >= 1500;

#List the names of salesmen that earn more than 1300.

    select employee_name from employees where job_title = 'SALESMAN' and salary >= 1300;

#List the names of employees that are not salesmen.

    select employees.employee_name from employees where job_title != 'SALESMAN';

#List the names of all clerks together with their salary with a deduction of 10%.

select employees.employee_name, employees.salary * 0,09 as salary_after_deduction from employees where job_title = 'CLERK';

#Find the name of employees hired before May 1981.

    select employees.employee_name from employees where hire_date <= 1981;

#List employees sorted by salary in descending order (i.e. highest salary first).

    select * from employees order by salary DESC;

#List departments sorted by location.

    select * from departments order by office_location;

#Find name of the department located in New York.

    select departments.department_name from departments where office_location = 'New York';

#You have proven your worth at the company. Your colleague comes to you trying to remember what's-his-name. It starts with a J and ends with S. Can you help her?

select  employees.employee_name from employees where employee_name like 'j%s';

#Maybe that wasn't helpful. "Oh yeah, I remember now!" they say and tell you that he is a manager.

select  employees.employee_name from employees where employee_name like 'j%s' and employees.job_title = 'manager';

#How many employees are there in each department?

select department_number, count(*) as number_of_employees from employees group by department_number;