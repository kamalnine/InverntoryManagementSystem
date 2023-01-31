select * from Users;
select * from ProdcutMaster;
select * from Transactions;

select * from Users inner join ProdcutMaster on Users.UserID = ProdcutMaster.Productid inner join Transactions on Users.UserID = Transactions.UpdatedBy;
--default
alter table Users Add constraint Category default 'Admin' for Category;
--check
alter table Transactions add check(TransactionType in('in','out'));

insert into Users(UserName,Password,Fullname,isActive) values('John','Cleveo','John clevio',1);

--select
select * from Users where Category = 'Admin' or Category = 'Staff';
--IN opeartor is Multiple row comparsion opeartor
select * from Users where UserID in(1,3) and Category = 'Admin'; 

select * from Users where Category in('Admin','Staff');
--between operator is used to get a alue from a specified range
select * from Users where UserID between 1 and 3;
--like operator is used to get the name with their starting or ending charcater or at any position with the help of wildcard
select * from Users where UserName like 'K%';
select * from Users where UserName like '_a%';
select * from Users where UserName like '%k';
select * from Users where UserName like '%a%';

--Functions in Sql

-- aggregate Function
--max
--min
--sum
--count
--avg


select max(AvailableQty) As Maximum from ProdcutMaster;
select min(AvailableQty) as minimum from ProdcutMaster;
select sum(AvailableQty)as summation from ProdcutMaster;
select count(AvailableQty) as counts from ProdcutMaster;
select AVG(AvailableQty)as average from ProdcutMaster;