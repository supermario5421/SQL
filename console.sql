

#Create a new table called leaders and insert rows into it.

create table leaders(
    leader_number int primary key,
    leader_name varchar(30),
    job_title varchar(30)
);

SELECT DISTINCT manager.employee_number, manager.employee_name, manager.job_title
FROM employees employee
         JOIN employees manager
              ON employee.manager_id = manager.employee_number
ORDER BY employee.employee_name;

select * from leaders;

#Create a new table called employees_leaders that should link the employees and leaders tables. This is called a join table.
# It will enable you to create a many-to-many relationship between employees and leaders (a leader can manage multiple employees and an employee can have multiple leaders).
# Try to figure it out yourself, otherwise here is the solution:

#```sql CREATE TABLE employees_leaders ( employee_number INT, leader_number INT, PRIMARY KEY (employee_number, leader_number), FOREIGN KEY (employee_number) REFERENCES employees(employee_number), FOREIGN KEY (leader_number) REFERENCES leaders(leader_number) ); ```

CREATE TABLE employees_leaders ( employee_number INT, leader_number INT, PRIMARY KEY (employee_number, leader_number), FOREIGN KEY (employee_number) REFERENCES employees(employee_number), FOREIGN KEY (leader_number) REFERENCES leaders(leader_number) );

SELECT DISTINCT employee.employee_number, employee.employee_name, employee.job_title
FROM employees employee where employee.manager_id not in(employee.employee_number)

ORDER BY employee.employee_name;

insert into employees_leaders values (7369,7902);
insert into employees_leaders values (7499,7698);
insert into employees_leaders values (7521,7698);
insert into employees_leaders values (7844,7698);
insert into employees_leaders values (7876,7788);
insert into employees_leaders values (7900,7698);
insert into employees_leaders values (7934,7782);
insert into employees_leaders values (7902,7566);
insert into employees_leaders values (7698,7839);
insert into employees_leaders values (7788,7566);
insert into employees_leaders values (7782,7839);
select * from employees_leaders;

#Create rows in employees_leaders that link employees to their respective leaders.

#Create a many-to-many query between employees and leaders. It requires two JOIN statements.
# First you select from employees, then you join with employees_leaders, and finally you join again with leaders.

select * from employees e inner join employees_leaders el on e.employee_number = el.employee_number inner join leaders l on el.leader_number = l.leader_number;