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



-- 1. Write a query to display the member id, member name, city and membership status who are all having life
--time membership. Hint: Life time membership status is “Permanent”.
select MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS FROM LMS_MEMBERS WHERE MEMBERSHIP_STATUS = 'Permanent';

--3. Write a query to display the member id, member name who have taken the book with book code 'BL000002'
select MEMBER_ID,MEMBER_NAME from LMS_MEMBERS where MEMBER_ID = (SELECT MEMBER_ID FROM LMS_BOOK_ISSUE WHERE BOOK_CODE = 'BL000002');

--4. Write a query to display the book code, book title and author of the books whose author name begins with 'P'.

SELECT BOOK_CODE,BOOK_TITLE,AUTHOR FROM LMS_BOOK_DETAILS WHERE AUTHOR LIKE 'P%';

--5. Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’
SELECT COUNT(*) AS 'NO_OF_BOOKS' FROM LMS_BOOK_DETAILS WHERE CATEGORY = 'JAVA'; 

--6. Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’
SELECT CATEGORY,COUNT(*) AS 'NO_OF_BOOKS' FROM LMS_BOOK_DETAILS GROUP BY CATEGORY;

--7. Write a query to display the number of books published by "Prentice Hall” with the alias name
--“NO_OF_BOOKS”.
SELECT COUNT(*) AS 'NO_OF_BOOKS' FROM  LMS_BOOK_DETAILS WHERE PUBLICATION='Prentice Hall'; 

--8. Write a query to display the book code, book title of the books which are issued on the date 
--"1st April 2012"
select BOOK_CODE,BOOK_TITLE FROM LMS_BOOK_DETAILS WHERE BOOK_CODE IN (SELECT BOOK_CODE FROM LMS_BOOK_ISSUE WHERE DATE_ISSUE = '2012-04-01');

--9. Write a query to display the member id, member name, date of registration and expiry date of the members
--whose membership expiry date is before APR 2013.
SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE FROM LMS_MEMBERS WHERE DATE_EXPIRE < '2013-04-01';

--10. write a query to display the member id, member name, date of registration, membership status of the
-- members who registered before "March 2012" and membership status is "Temporary" 
SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER,MEMBERSHIP_STATUS FROM LMS_MEMBERS WHERE DATE_REGISTER < '2012-03-01' AND MEMBERSHIP_STATUS = 'Permanent';

--11. Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the
--member name in title case with alias name 'Name'.

select MEMBER_ID,MEMBER_NAME as 'NAME' FROM LMS_MEMBERS WHERE CITY IN ('Chennai','Delhi');

--12. Write a query to concatenate book title, author and display in the following format.
--Book_Title_is_written_by_Author
--Example: Let Us C_is_written_by_Yashavant Kanetkar
--Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name.

select concat(BOOK_TITLE,' is written by ',AUTHOR) AS 'BOOK_WRITTEN_BY' FROM LMS_BOOK_DETAILS;

--13. Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name
--“AVERAGEPRICE”.
select avg(PRICE) AS 'AVERGAGEPRICE' FROM LMS_BOOK_DETAILS WHERE CATEGORY = 'JAVA';

--14. Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.
SELECT SUPPLIER_ID,SUPPLIER_NAME,EMAIL FROM LMS_SUPPLIERS_DETAILS WHERE EMAIL LIKE '%gmail.com';

--16. Write a query to display the supplier id, supplier name and contact. If phone number is null then display ‘No’
-- else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. Hint: Use ISNULL.

select SUPPLIER_ID,SUPPLIER_NAME,CONTACT, CASE WHEN CONTACT IS NULL THEN 'NO' WHEN CONTACT IS NOT NULL THEN 'YES' END AS 'PHONENUMBERAVAILABLE' FROM LMS_SUPPLIERS_DETAILS;
