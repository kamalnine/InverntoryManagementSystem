SELECT * FROM LMS_MEMBERS;
SELECT * FROM LMS_FINE_DETAILS;
SELECT * FROM LMS_BOOK_ISSUE;
SELECT *  FROM LMS_BOOK_DETAILS;
SELECT * FROM LMS_SUPPLIERS_DETAILS;




--Complex Questions:
--Problem # 1:
--Write a query to display the book code, book title and supplier name of the supplier who has supplied 
--maximum number of books. For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books 
--and “XYZ Store” has supplied 1 book. So “ABC Store” has supplied maximum number of books, hence display 
--the details as mentioned below. 

SELECT BOOK_CODE,BOOK_TITLE,SUPPLIER_NAME FROM LMS_BOOK_DETAILS L1 INNER JOIN LMS_SUPPLIERS_DETAILS L2 ON L1.SUPPLIER_ID = L2.SUPPLIER_ID 
group by L1.SUPPLIER_ID,SUPPLIER_NAME,BOOK_TITLE,BOOK_CODE HAVING  L1.SUPPLIER_ID = (SELECT SUPPLIER_ID FROM LMS_BOOK_DETAILS GROUP BY SUPPLIER_ID 
HAVING COUNT(SUPPLIER_ID) >=ALL(SELECT COUNT(SUPPLIER_ID) FROM LMS_BOOK_DETAILS GROUP BY SUPPLIER_ID));


--Problem # 2:
--Write a query to display the member id, member name and number of remaining books he/she can take with 
--“REMAININGBOOKS” as alias name. Hint: Assuming a member can take maximum 3 books. For example, 
--Ramesh has already taken 2 books; he can take only one book now. Hence display the remaining books as 1 in below format. 
--Example: 
--MEMBER_ID MEMBER_NAME REMAININGBOOKS
--LM001      RAMESH        1
--LM002       MOHAN        3


SELECT L1.MEMBER_ID,MEMBER_NAME,COUNT(L2.BOOK_CODE) AS 'REMAININGBOOK' FROM LMS_MEMBERS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID INNER JOIN LMS_BOOK_DETAILS L3
ON L2.BOOK_CODE = L3.BOOK_CODE WHERE L2.BOOK_CODE IN (SELECT BOOK_CODE FROM LMS_BOOK_DETAILS) GROUP BY L1.MEMBER_ID,MEMBER_NAME;

--PROBLEM # 3:
--Write a query to display the supplier id and supplier name of the supplier who has supplied minimum number
--of books. For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has 
--supplied 1 book. So “XYZ Store” has supplied minimum number of books, hence display the details as 
--mentioned below. 
--Example:
--SUPPLIER_ID SUPPLIER_NAME
-- S04          XYZ STORE

SELECT L1.SUPPLIER_ID,SUPPLIER_NAME FROM LMS_SUPPLIERS_DETAILS L1 JOIN LMS_BOOK_DETAILS L2 ON L1.SUPPLIER_ID=L2.SUPPLIER_ID GROUP BY L1.SUPPLIER_ID,SUPPLIER_NAME
HAVING L1.SUPPLIER_ID = (SELECT L1.SUPPLIER_ID FROM LMS_SUPPLIERS_DETAILS L1 JOIN LMS_BOOK_DETAILS L2 ON L1.SUPPLIER_ID = L2.SUPPLIER_ID GROUP BY L1.SUPPLIER_ID 
HAVING COUNT(L1.SUPPLIER_ID) <= ALL(SELECT COUNT(SUPPLIER_ID) FROM LMS_SUPPLIERS_DETAILS GROUP BY SUPPLIER_ID));





--Problem # 2:
--Write a query to display the book code, publication, price and supplier name of the book witch is taken 
--frequently.
SELECT L1.BOOK_CODE,PUBLICATION,PRICE,SUPPLIER_NAME FROM LMS_BOOK_DETAILS L1 JOIN LMS_SUPPLIERS_DETAILS L2 ON L1.SUPPLIER_ID = L2.SUPPLIER_ID JOIN LMS_BOOK_ISSUE L3 ON
L1.BOOK_CODE = L3.BOOK_CODE WHERE DATE_issue between '2012-04-01' and '2012-06-01';


--Problem#15:
--Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone 
--number or email or address with alias name “CONTACTDETAILS”. If phone number is null then display email, 
--even if email also null then display the address of the supplier. Hint: Use Coalesce function. 
select SUPPLIER_ID,SUPPLIER_NAME,COALESCE(CONTACT,EMAIL,ADDRESS) AS 'CONTACTDETAILS' FROM LMS_SUPPLIERS_DETAILS;


--Problem#17:
--Write a query to display the member id, member name, city and member status of members with the total fine 
-- paid by them with alias name “Fine”.
SELECT L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS,SUM(FINE_AMOUNT) AS 'FINE' FROM LMS_MEMBERS L1 INNER JOIN LMS_BOOK_ISSUE L2 ON L1.MEMBER_ID = L2.MEMBER_ID JOIN LMS_FINE_DETAILS L3 ON
L2.FINE_RANGE = L3.FINE_RANGE GROUP BY L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS;



--Problem # 2:
--Write a query to display the total number of books available in the library with alias name 
--“NO_OF_BOOKS_AVAILABLE” (Which is not issued). Hint: The issued books details are available in the 
--LMS_BOOK_ISSUE table.

select count(book_code)no_books_available from lms_book_details where book_code not in (select book_code from lms_book_issue);



