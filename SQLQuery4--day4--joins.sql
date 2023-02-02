

select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_BOOK_ISSUE;
select * from LMS_MEMBERS;
select * from LMS_BOOK_DETAILS;
select * from LMS_FINE_DETAILS;

--display the book code,book name and supplier name of the book in library
select BOOK_CODE,BOOK_TITLE,SUPPLIER_NAME FROM LMS_BOOK_DETAILS L1 JOIN LMS_SUPPLIERS_DETAILS L2 ON L1.SUPPLIER_ID = L2.SUPPLIER_ID ; 


--DISPLAY THE BOOK TITILE AND THE MEMBER ID WHO HAS TAKEN THE BOOK FROM LIBRARY
SELECT DISTINCT(BOOK_TITLE),M.MEMBER_ID FROM LMS_BOOK_DETAILS L  inner JOIN LMS_BOOK_ISSUE B ON L.BOOK_CODE = B.BOOK_CODE inner JOIN LMS_MEMBERS M 
ON B.MEMBER_ID = M.MEMBER_ID  WHERE BOOK_ISSUE_NO IN (SELECT BOOK_ISSUE_NO FROM  LMS_BOOK_ISSUE);

--display the book name , member name who has taken the book from library
select BOOK_TITLE,MEMBER_NAME FROM LMS_BOOK_DETAILS D JOIN LMS_BOOK_ISSUE I ON D.BOOK_CODE = I.BOOK_CODE JOIN LMS_MEMBERS M ON I.MEMBER_ID = M.MEMBER_ID
WHERE BOOK_ISSUE_NO IN (SELECT BOOK_ISSUE_NO FROM LMS_BOOK_ISSUE);

--display the supplier id and the no of books supplied by each supplier
select S.SUPPLIER_ID,COUNT(BOOK_CODE) AS 'NO OF BOOK SUPPLIED' FROM LMS_SUPPLIERS_DETAILS S JOIN LMS_BOOK_DETAILS B ON S.SUPPLIER_ID = B.SUPPLIER_ID 
GROUP BY S.SUPPLIER_ID ORDER BY 'NO OF BOOK SUPPLIED'; 

--display the supplier name and the no of books supplied by each supplier
select S.SUPPLIER_NAME,COUNT(BOOK_CODE) AS 'NO OF BOOK SUPPLIED' FROM LMS_SUPPLIERS_DETAILS S JOIN LMS_BOOK_DETAILS B ON S.SUPPLIER_ID = B.SUPPLIER_ID 
GROUP BY S.SUPPLIER_NAME order by 'NO OF BOOK SUPPLIED';

--DISPLAY THE ID,NAME,NO OF BOOKS SUPPLIED
select S.SUPPLIER_ID, S.SUPPLIER_NAME,COUNT(BOOK_CODE) AS 'NO OF BOOK SUPPLIED' FROM LMS_SUPPLIERS_DETAILS S JOIN LMS_BOOK_DETAILS B ON S.SUPPLIER_ID = B.SUPPLIER_ID 
GROUP BY S.SUPPLIER_ID,S.SUPPLIER_NAME order by 'NO OF BOOK SUPPLIED';



--LMS- Joins Questions
--1.	Write a query to display the book title, supplier name who has supplied books to library.
select BOOK_TITLE,SUPPLIER_NAME FROM LMS_BOOK_DETAILS L1 INNER JOIN LMS_SUPPLIERS_DETAILS L2 ON  L1.SUPPLIER_ID = L2.SUPPLIER_ID;

--2.	Write a query to display member name and book code for the book he/she taken from the library.
 SELECT DISTINCT(MEMBER_NAME),BOOK_CODE FROM LMS_MEMBERS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID 

--3.	Write a query to display the book title and date when the book was taken from the library.
 SELECT BOOK_TITLE,DATE_ISSUE FROM LMS_BOOK_DETAILS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.BOOK_CODE = L2.BOOK_CODE; 

--4.	Write a query to display the member id and the fine amount paid by the member in the library.
SELECT MEMBER_ID,FINE_AMOUNT FROM LMS_BOOK_ISSUE L1 INNER JOIN LMS_FINE_DETAILS L2 ON L1.FINE_RANGE = L2.FINE_RANGE;

--5.	Write a query to display the member name and the date difference between the date return and date returned.
 SELECT MEMBER_NAME,DATEDIFF(DAY,DATE_RETURN,DATE_RETURNED) AS "DIFF" FROM LMS_BOOK_ISSUE L1 INNER JOIN LMS_MEMBERS L2 ON L1.MEMBER_ID = L2.MEMBER_ID;

--6.	Write a query to display the book title and the member name of member who has taken book from library.
SELECT  DISTINCT(BOOK_TITLE),MEMBER_NAME FROM LMS_BOOK_DETAILS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.BOOK_CODE = L2.BOOK_CODE INNER JOIN LMS_MEMBERS L3 ON
L2.MEMBER_ID = L3.MEMBER_ID;

--7.	Write a query to display the book title, member name and the supplier name for the books taken from the library.
SELECT DISTINCT(BOOK_TITLE),SUPPLIER_NAME,MEMBER_NAME FROM LMS_BOOK_DETAILS L1 INNER JOIN LMS_SUPPLIERS_DETAILS L2 ON L1.SUPPLIER_ID = L2.SUPPLIER_ID JOIN LMS_BOOK_ISSUE L3
ON L1.BOOK_CODE = L3.BOOK_CODE JOIN LMS_MEMBERS L4 ON L3.MEMBER_ID = L4.MEMBER_ID;

-- 8.	Write a query to display the book title and the different fine amount paid for the book in library.
SELECT distinct(BOOK_TITLE),(FINE_AMOUNT) FROM LMS_BOOK_DETAILS L1 INNER  JOIN LMS_BOOK_ISSUE L2 ON L1.BOOK_CODE = L2.BOOK_CODE INNER JOIN LMS_FINE_DETAILS L3 ON
L2.FINE_RANGE = L3.FINE_RANGE;

--Problem#17:
--Write a query to display the member id, member name, city and member status of members with the total fine 
--paid by them with alias name “Fine”.
select L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS,SUM(FINE_AMOUNT) AS FINE FROM LMS_MEMBERS  L1 INNER JOIN  LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID JOIN 
LMS_FINE_DETAILS L3 ON L2.FINE_RANGE = L3.FINE_RANGE GROUP BY L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS ORDER BY MEMBER_ID;

--Average Questions:
--Problem # 1:
--Write a query to display the member id, member name of the members, book code and book title of the books 
--taken by them.SELECT L.MEMBER_ID,MEMBER_NAME,D.BOOK_CODE,BOOK_TITLE FROM LMS_MEMBERS L INNER JOIN LMS_BOOK_ISSUE I ON L.MEMBER_ID = I.MEMBER_ID JOIN LMS_BOOK_DETAILS D ONI.BOOK_CODE = D.BOOK_CODE;

--Problem # 3:
--Write a query to display the member id, member name, fine range and fine amount of the members whose
--fine amount is less than 100. 

SELECT L1.MEMBER_ID,MEMBER_NAME,L3.FINE_RANGE,FINE_AMOUNT FROM LMS_MEMBERS L1 JOIN LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID JOIN LMS_FINE_DETAILS L3 ON
L2.FINE_RANGE = L3.FINE_RANGE WHERE FINE_AMOUNT<100;


--Problem # 4:
--Write a query to display the book code, book title, publisher, edition, price and year of publication and sort 
--based on year of publication, publisher and edition.

SELECT BOOK_CODE,BOOK_TITLE,PUBLICATION,BOOK_EDITION,PRICE,PUBLISH_DATE FROM LMS_BOOK_DETAILS ORDER BY PUBLISH_DATE,PUBLICATION,BOOK_EDITION;

--Problem # 5:
--Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' 
--and sort by book title in ascending order.

SELECT DISTINCT BOOK_CODE,BOOK_TITLE,RACK_NUM FROM LMS_BOOK_DETAILS WHERE RACK_NUM = 'A1' ORDER BY BOOK_TITLE;

--Problem # 6:
--Write a query to display the member id, member name, due date and date returned of the members who has 
--returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return 
--date.

SELECT L2.MEMBER_ID,MEMBER_NAME,DATE_RETURN,DATE_RETURNED FROM LMS_BOOK_ISSUE L1 INNER JOIN  LMS_MEMBERS L2 ON L1.MEMBER_ID = L2.MEMBER_ID WHERE 
DATE_RETURN<DATE_RETURNED;

--Problem # 7:
--Write a query to display the member id, member name and date of registration who have not taken any book. 
SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER FROM LMS_MEMBERS WHERE MEMBER_ID NOT IN(SELECT MEMBER_ID FROM LMS_BOOK_ISSUE);

--Problem # 8:
--Write a Query to display the member id and member name of the members who has not paid any fine in the 
--year 2012.

SELECT L1.MEMBER_ID,MEMBER_NAME FROM LMS_MEMBERS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID JOIN LMS_FINE_DETAILS  L3 ON L2.FINE_RANGE = L3.FINE_RANGE
WHERE FINE_AMOUNT=0 AND DATE_RETURNED BETWEEN '2012-01-01' AND '2012-12-31';

 --Problem # 10:
--Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book 
--edition is 5 and supplied by supplier ‘S01’.
SELECT BOOK_TITLE,SUPPLIER_ID FROM LMS_BOOK_DETAILS WHERE AUTHOR = 'Herbert Schildt' AND BOOK_EDITION = 5 AND SUPPLIER_ID = 'S01';


--Problem # 11:
--Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” 
--and sort by rack number in ascending order.
SELECT RACK_NUM,COUNT(BOOK_CODE) AS 'NO OF BOOKS' FROM LMS_BOOK_DETAILS GROUP BY RACK_NUM ORDER BY RACK_NUM;

--Problem # 12:
--Write a query to display book issue number, member name, date or registration, date of expiry, book title, 
--category author, price, date of issue, date of return, actual returned date, issue status, fine amount.
SELECT BOOK_ISSUE_NO,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE,BOOK_TITLE,CATEGORY,AUTHOR,PRICE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,CASE WHEN DATE_RETURNED IS NOT NULL THEN 'RETURNED'
ELSE 'NOT RETURNED' END AS ISSUE_STATUS,
FINE_AMOUNT 
FROM LMS_BOOK_ISSUE L1 INNER JOIN LMS_MEMBERS L2 ON L1.MEMBER_ID = L2.MEMBER_ID JOIN LMS_BOOK_DETAILS L3 ON L1.BOOK_CODE = L3.BOOK_CODE JOIN 
LMS_FINE_DETAILS L4 ON L1.FINE_RANGE = L4.FINE_RANGE; 


--Problem # 13:
--Write a query to display the book code, title, publish date of the books which is been published in the month of 
--December.
SELECT BOOK_CODE,BOOK_TITLE,PUBLISH_DATE FROM LMS_BOOK_DETAILS WHERE PUBLISH_DATE LIKE '%-12-%';

--Problem # 15:
--Write a query to display book code, book name, and publisher, how old the book is. Sorted as older to newer

SELECT BOOK_CODE,BOOK_TITLE,PUBLICATION,CONCAT(DATEDIFF(YEAR,PUBLISH_DATE,GETDATE()),'') AS 'hOW OLD THE BOOK IS' FROM LMS_BOOK_DETAILS;
