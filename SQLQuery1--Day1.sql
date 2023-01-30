use InventoryManagementSystem;

create table Users(UserID int primary key identity(1,1),UserName varchar(50),Password varchar(25),Fullname varchar(255),isActive bit,Category varchar(50));


create table ProdcutMaster(Productid int primary key identity(1,1),ProductName varchar(50),AvailableQty bigint);

drop  table ProdcutMaster;
drop table Transactions;

create table Transactions (TransactionID int primary key identity(1,1),TransactionDate date,ProductID int foreign key references ProdcutMaster(Productid),TransactionType varchar(5),Qty int,UpdatedBy int
foreign key references Users(UserID));


select * from Users;
select * from ProdcutMaster;
select * from Transactions;



alter table Transactions add foreign key (UpdatedBy)references Users(UserID);

alter table Transactions alter column ProductID int not null;

alter table Transactions alter column UpdatedBy int not null;

alter table Transactions alter column TransactionType varchar(5) not null;

alter table ProdcutMaster alter column ProductName varchar(50) not null;
alter table ProdcutMaster alter column AvailableQty int not null;


insert into ProdcutMaster values('TubeLight',500);

insert into ProdcutMaster values('Switch',1000),('Screws',700),('Nails',600);

insert into Users(UserName,Password,Fullname,isActive) values('Mathew','mathew@111','John Mathew',1);
insert into Users(UserName,Password,Fullname,isActive) values('Kamal','Kamal@111','kamal Sutte',1);
insert into Users(UserName,Password,Fullname,isActive)values('Jack','Jack@111','Jack Daniels',1);


update Users set Category = 'Admin' where UserID= 1; 
update Users set Category = 'Staff' where UserID = 2;
update Users set Category='Staff' where UserID = 3;
delete from Users where UserID = 5;

truncate table Users;



insert into Transactions values('2022-02-22',1,'UPI',5,2);


insert into Transactions values('2022-01-22',2,'UPI',90,1);

insert into Transactions values('2022-08-17',3,'Cash',100,3);

update Transactions set TransactionType = 'In' ; 

--practice

select UserName,Category from Users;

select ProductName from ProdcutMaster where AvailableQty < 500;

select * from Transactions where UpdatedBy = 1;

select TransactionDate,TransactionType from Transactions;

select * from Transactions where TransactionType = 'In';

select * from ProdcutMaster where ProductName = 'Nails'; 


