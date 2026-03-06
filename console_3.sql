
#For the first assignment, take on the hat of a Data Analyst. You've been tasked to create a summary of interesting data.
#Use MIN, MAX, AVG, SUM, ORDER BY, BETWEEN and more.
#If you in this task manage to solve one of the next assignments, then pat yourself on the back!
# You are a valued employee at tech company.



#List the number of employees.

select count (*) as total_employees from employees;

#List the sum of all salaries (excluding commission which are bonuses added to the base salaries).

select sum(employees.salary) as total_salary from employees;

#List the average salary for employees in department 20.

select avg(employees.salary) as average_salary from employees where department_number = 20;

#List the unique job titles in the company.

select distinct employees.job_title from employees;

#List the number of employees in each department.

select count(*), employees.department_number from employees join departments on employees.department_number = departments.department_number group by employees.department_number;

#List in decreasing order the maximum salary in each department together with the department number.

select employees.salary, employees.department_number from employees join departments on employees.department_number = departments.department_number order by employees.department_number, salary desc ;


#List total sum of salary and commission for all employees.

select sum(employees.salary) as sum_salary, sum(employees.commission) as sum_commission  from employees;

#Subquery time! Select the name and salary of employees whose salary is above average: WHERE salary > (SELECT AVG(salary) FROM employees).

select employees.employee_name, employees.salary from employees where employees.salary > (select avg(employees.salary) from employees);
