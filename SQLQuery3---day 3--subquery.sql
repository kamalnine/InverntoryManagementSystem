select * from employee;
select * from department;
select * from Region;
select * from manager;
select * from Countries;
select * from location;

select * from employee where department_id = (select id from department where name = 'HR');


select * from location where country_id = (select id from Countries where name = 'india');


--manager name
select * from employee where id in (select employee_id from manager);

--manager name belong to hr
select * from employee where id in (select employee_id from manager) and department_id = (select id from department where name = 'HR');

--display the employee details whose department location is in the state New Jersey 
select * from employee where department_id =(select id from department where location_id =(select id from location where state = 'New Jersey'));

--highest salary
select * from employee where salary = (select max(salary) from employee);

--2nd highest salary
select * from employee where salary = (select max(salary) from employee where salary < (select max(salary) from employee));

-- min salary
select * from employee where salary = (select min(salary) from employee);

--avg salary or less than avg salary
select * from employee where salary <= (select avg(salary) from employee);

--3rd highest salary
select * from employee where salary = (select max(salary) from employee where salary <(select max(salary) from employee where salary < (select max(salary) from employee)));

--another type of sub query
--non correlated
--correlated

----practise

--2.Write a query to display the names of all states belonging to the country Canada. Display the records sorted in ascending order based on state name.(Q 2).
 select state from location  where country_id = (select id from Countries where id = 'CA') order by state;


-- 3.	Write a query to display the first name of the managers of Accounts department. Display the records sorted in ascending order based on manager name.(Q7).
select first_name from employee where id in(select employee_id from manager where department_id = (select id from department where name= 'Accounts'));

--5 5.	Write a query to find the first name and department name of employees who work in city London. Display the records sorted in ascending order based on first name.(Q14).
select first_name,name as DepartmentName from employee join department on employee.id = department.id where  location_id = (select id from location where state='LOndon') order by first_name;

--9.	Write a query to display the names of all countries belonging to region Europe. Display the records sorted in ascending order based on country name.(Q1)
select name from Countries where region_id = (select id from Region where name = 'Europe') order by name;
 
 --14.	Write a query to display the first name of the managers of HR department. Display the records sorted in ascending order based on manager name(Q6)
 select first_name from employee where id in (select employee_id from manager where department_id = (select id from department where name='HR')) order by first_name;

--15 Write a query to display the first name of all employees who are managers. Display the records sorted in ascending order based on first name.(Q5)
 select first_name from employee where id in (select employee_id from manager) order by first_name;

 --correlated subquery
 ----nth highest salary
select * from employee as emp1 where 3-1 = (select count(distinct salary) from employee emp2 where emp2.salary > emp1.salary);

--group by clause
--no of employees in each department
select department_id,count(*) from employee group by department_id;
--
select country_id,count(*) from location group by country_id order by country_id;
--
select  city,count(*) from location group by city;
--no of states in a country
select country_id,count(*) from location group by country_id;
--
select region_id,count(*) from countries group by region_id

select department_id,max(salary) from employee group by department_id;



--find out how many employee are available in the IT department
select count(*) as 'Employee from IT department' from employee where department_id = (select id from department where name='IT');

--7.	Write a query to display the department name and the number of managers in the department. Display the records sorted in ascending order based on department name.
--Give an alias to the number of managers as manager_count.(Q15).

select name,count(e.id) as 'Manager_Count' from department join employee e on  department.id = e.department_id where e.id in (select employee_id from manager) 
group by name order by name;