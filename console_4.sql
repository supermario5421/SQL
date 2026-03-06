#Create an INNER JOIN between employees and departments to get the department name for each employee. Show all columns

select * from employees inner join departments on employees.department_number = departments.department_number;

#Continue from the last task. Show two columns. The employee_name and their corresponding department_name.
# Oh, and can you sort them alphabetically (A-Z)?

select employees.employee_name as name, departments.department_name as department_name from departments inner join employees on departments.department_number = employees.department_number order by employee_name, departments.department_name;

#Now is the time to make a LEFT JOIN. Let's look at employee_name and department_name only.
#There is one more person this time who didn't show in the previous query. Who is it and why?

select * from employees left join departments on employees.department_number = departments.department_number;

# SVAR: President er med her fordi tabellerne er left join og employees står først (til venstre for joinet).
# På trods af PRESIDENT ikke har noget department_number.


#Consider this query:

SELECT departments.department_name, COUNT(employees.employee_number)
FROM employees
          JOIN departments
              ON departments.department_number = employees.department_number
GROUP BY department_name;

#One department is missing. Which one and why? (Look in the database).

    #SVAR: Hvis vi left joiner så får vi også præsidenten ud.
     #     Hvis vi right joiner så får vi også operations ud.

#To get the missing department change the previous query to use a RIGHT JOIN

SELECT departments.department_name, COUNT(employees.employee_number)
FROM employees
         right JOIN departments
                    ON departments.department_number = employees.department_number
GROUP BY department_name;


#SCOTT sends you this query and asks you to run it. In order to assess whether it is information that SCOTT is privy to, you must first understand it. Describe in technical terms what this query does:
#SVAR: en join svar til en inner join så query herunder viser medarbejders informationer samt med medarbejders respektive manager
#       men da queryen bruger join, vil præsidenten ikke være med. Hvilket betyder at queriy viser ikke managers manager.
#       Hvis vi vil have det fulde billede, så skal vi left joine imellem employee og menager.

SELECT *
FROM employees employee
         join employees manager
              ON employee.manager_id = manager.employee_number
ORDER BY employee.employee_name;

#Get two columns: employees and their managers.

    select employee.employee_name as employee_name, manager.employee_name as manager_name FROM employees employee left join employees manager ON employee.manager_id = manager.employee_number ORDER BY employee.employee_name;

 #   Use the HAVING keyword (feel free to look it up) to show the departments with more than 3 employees. The as number_of_employees is so that you can reference the value later on in the query:

SELECT employees.department_number, COUNT(employees.department_number) as number_of_employees
FROM employees
GROUP BY department_number having number_of_employees > 3;