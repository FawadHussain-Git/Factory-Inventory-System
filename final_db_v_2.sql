create database db_projects
use db_projects

create table tb_users
(
usser_id int primary key,
username varchar(50) not null,
password varchar(50) not null,
user_name varchar(30) not null,
user_employee_id varchar(30) not null,
desgination varchar(50) not null
)
drop table tb_users

create table rough 
(
rough_id int primary key,
name varchar(23) null,
date datetime null,
datetime datetime null
)

create function search_date(@d date)
returns table
as return 
(select * from rough where date=@d)

alter function search_date_time(@d date)
returns table
as return 
(select * from rough where datetime=@d)


select * from search_date_time('2018-01-01')

select * from search_date('2013-03-02')

create table rough
(
q int ,
p int,
a as concat('',q*p,'')
)

select * from tb_item

select * from view_item_table_for_user()

drop table rough

select * from rough
insert into rough values (4,2);


insert into tb_users values (1,'Hk','1','Haris Khan','A-001','admin')
insert into tb_users values (2,'FH','1','Fawad Hussain','A-002','admin')
insert into tb_users values (3,'ZA','1','Zaid Ahmad','A-002','admin')
insert into tb_users values (4,'P','123','Pappu','DY-122','user')


--drop database db_projects
create table tb_Machine
(
Machine_id varchar(15) primary key,
Machine_name varchar(30) not null,
Machine_Department_name varchar(30)
)


create table tb_Department
(
Dep_name varchar(30) not null primary key,

Dep_description varchar(50) null
)



create table tb_Employee
(
Employee_id varchar(15) primary key,
Em_father_name varchar(30) not null,
Em_fname varchar(15) not null,
Em_lname varchar(15) not null,
Em_Ad_Area varchar(20) not null,
Em_Ad_Street varchar(4) not null,
Em_Ad_House varchar(10) not null,
Em_Ad_City varchar(15) not null,
Em_cont_no varchar(11) not null,
Employee_Machine_id varchar(15) null,
Employee_Department_name varchar(30) null,
joining_date datetime not null,
Date_of_birth datetime  not null,
Employee_cnic varchar(15) not null,
Em_Status varchar(10) not null
)


ALTER TABLE tb_item
ADD Amount int null


ALTER TABLE tb_item
ADD Average int null


ALTER TABLE tb_item_purchased
ADD Amount int null


ALTER TABLE tb_item
ADD Average_price as (amount/quantity) 




ALTER TABLE tb_item_purchased
ADD Amount_2 as concat(quantity*price);


create table tb_Item
(
item_id varchar(15) primary key,
item_name varchar(50) not null,
quantity float not null,
unit varchar(20) null,
min_quantity float null,
item_description varchar(30) null,
price int null
)


---Q1
select sum(Amount) from tb_Item
 

select sum(Amount) from tb_Item



select * from tb_Item

--drop table tb_item

create table tb_Item_Purchased
(
Purchased_item_id varchar(15) not null,
Purchased_Employee_id varchar(15) null,
Date_time datetime not null,
quantity float null,
price int null,
entered_by varchar(50) not null,
Purchased_supplier_id varchar(15) null,
igp_no int not null,
CONSTRAINT PK_item_purchased PRIMARY KEY (Purchased_item_id,Date_time)
)

select * from tb_Item_Purchased
--drop table tb_Item_Purchased
alter table tb_request_item
add  issued_Date DateTime null

create table tb_Request_Item
(
Request_Request_id varchar(15) not null ,
Request_Item_id varchar(15) not null ,
quantity int not null,
issued_by varchar(20) not null
CONSTRAINT PK_request_item PRIMARY KEY (Request_Request_id,Request_Item_id)
)


--drop table tb_Request_Item

select * from tb_Request_Item
create table tb_Supplier
(
supplier_id varchar(15) primary key,
supplier_name varchar(50) not null,
supplier_contact_person varchar(20) not null,
sup_Ad_Area varchar(20) not null,
sup_Ad_Street varchar(4) not null,
sup_Ad_Shop varchar(10) not null,
sup_Ad_City varchar(15) not null,
supplier_contact varchar(15) not null,
sup_description varchar(50) null
)
--drop table tb_Supplier


select * from tb_Request

create table tb_Request
(
Request_id varchar(15) primary key,
Request_Employee_id varchar(15) not null,
Req_description varchar(50) null,
Date_time datetime not null,
demand_note varchar(10) null,
)

select Request_Request_id,Request_Item_id,quantity, issued_by, (select Date_time  from tb_Request where Request_id=Request_Request_id ) as Date_time from tb_Request_Item 


alter table tb_Machine
add constraint fk_DepName
foreign key (Machine_Department_name) references tb_Department(Dep_name) 




alter table tb_Employee
add constraint fk_MachineID
foreign key (Employee_Machine_id) references tb_Machine(Machine_id)


alter table tb_Employee
add constraint fk_DepName_e
foreign key (Employee_Department_name) references tb_Department(Dep_name)

alter table tb_Request
add constraint fk_EmployeeID_r
foreign key (Request_Employee_id) references tb_Employee(Employee_id)

alter table tb_Request_Item
add constraint fk_RequestID
foreign key (Request_Request_id) references tb_Request(Request_id)


alter table tb_Request_Item
add constraint fk_ItemID_r
foreign key (Request_Item_id) references tb_Item(Item_id)

alter table tb_Item_Purchased
add constraint fk_ItemID
foreign key (Purchased_item_id) references tb_Item(item_id)


alter table tb_Item_Purchased
add constraint fk_EmployeeID
foreign key (Purchased_Employee_id) references tb_Employee(Employee_id)



alter table tb_Item_Purchased
add constraint fk_SupplierID
foreign key (Purchased_supplier_id) references tb_Supplier(supplier_id)


select * from tb_Department
truncate table tb_department

insert into  tb_Department values ('machincal','Good Comments....')
insert into  tb_Department values ('electrical','Good Comments....')
insert into  tb_Department values ('Dyeing','Good Comments....')
insert into  tb_Department values ('Finishing','Good Comments....')
insert into  tb_Department values ('lab','bad Comments....')
insert into  tb_Department values ('raising','bad Comments....')
insert into  tb_Department values ('fabric','bad Comments....')
insert into  tb_Department values ('boiler','bad Comments....')
insert into  tb_Department values ('security','Good Comments....')


select * from tb_Machine
truncate table tb_machine

insert into  tb_Machine values ('de-61','61','dyeing')
insert into  tb_Machine values ('de-62','62','dyeing')
insert into  tb_Machine values ('de-4t','4t','dyeing')
insert into  tb_Machine values ('de-3t','3t','dyeing')
insert into  tb_Machine values ('de-2t','2t','dyeing')
insert into  tb_Machine values ('de-1t1','1t1','dyeing')
insert into  tb_Machine values ('de-1t2','1t2','dyeing')
insert into  tb_Machine values ('f-h1','hydro1','finishing')
insert into  tb_Machine values ('f-h2','hydro2','finishing')
insert into  tb_Machine values ('f-v1','vertical_dryer1','finishing')
insert into  tb_Machine values ('f-v2','vertical_dryer2','finishing')
insert into  tb_Machine values ('r-p','peaching','raising')
insert into  tb_Machine values ('r-2','raising_1','raising')
insert into  tb_Machine values ('r-1','raising_2','raising')
insert into  tb_Machine values ('b-1','boiler','boiler')





select * from tb_Employee
truncate table tb_employee

insert  into tb_Employee values ('E500','Mushtaq Ali','Hamza','Ali','Sector_E','#3','#88','lahore','+92','r-p','raising',getdate(),getdate(),'8614868966','Active')
insert  into tb_Employee values ('E600','ibrahim','Hamza','akil','Sector_E','#3','#99','Fsd','+92','f-v1','finishing',getdate(),getdate(),'861434566','Active')
insert  into tb_Employee values ('E900','hashim','asad','butt','Sector_r','#6','#100','lahore','+92','b-1','boiler',getdate(),getdate(),'86143343466','Active')
insert  into tb_Employee values ('E330','munna','bhai','chotu','Sector_w','#8','#13','fsd','+92','b-1','boiler',getdate(),getdate(),'86143343466','Active')




select * from tb_Supplier
truncate table tb_supplier

insert  into tb_Supplier values ('S100','tariq',0333,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S200','hamza',0323,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S300','umer',03344,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S400','nabil',0333,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S500','ahmad',033434,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S600','ali',03443,'iqbal town','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S130','kamil',0333,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')
insert  into tb_Supplier values ('S120','hassan',0333,'bahria','#3','#66','Lahore','64654148','xbcdcbcbh')



select * from dbo.tb_Request
truncate table tb_request

insert into  tb_Request values ('R1','E500','Available......',GETDATE(),'issued')
insert into  tb_Request values ('R2','E500','Available......',GETDATE(),'issued')
insert into  tb_Request values ('R3','E500','Available......',GETDATE(),'issued')
insert into  tb_Request values ('R4','E600','Available......',GETDATE(),'issued')


select * from tb_item
truncate table tb_item

insert  into tb_Item values ('I1','Belt',6,'item',1,'Required',1000)
insert  into tb_Item values ('I2','rubber',1,'item',1,'Required',14400)
insert  into tb_Item values ('I3','pain',10,'item',3,'Required',2300)
insert  into tb_Item values ('I4','chain',7,'item',2,'Required',400)
insert  into tb_Item values ('I5','copy',4,'item',5,'Required',1300)


select * from tb_Request_Item
truncate table tb_request_item

insert  into tb_Request_Item values ('R1','I1',4,'Jamil')
insert  into tb_Request_Item values ('R1','I2',7,'asif')
insert  into tb_Request_Item values ('R2','I5',9,'ali')
insert  into tb_Request_Item values ('R2','I4',1,'asif')




select * from tb_Item_Purchased
truncate table tb_item_purchased


insert  into tb_Item_Purchased values ('I1','E500',getdate(),3,2000,'Haris','S100',555)
insert  into tb_Item_Purchased values ('I1','E600',getdate(),3,300,'umer','S200',555)
insert  into tb_Item_Purchased values ('I2','E900',getdate(),3,300,'umer','S300',555)
insert  into tb_Item_Purchased values ('I3','E330',getdate(),3,300,'umer','S400',555)



select * from tb_Machine

select * from tb_Employee
SELECT Employee_id, Em_father_name, Em_fname, Em_lname, Em_Ad_Area, Em_Ad_Street, Em_Ad_House, Em_Ad_City, Em_cont_no, Employee_Machine_id, Employee_Department_name, joining_date, Date_of_birth, Employee_cnic, Em_Status
FROM   tb_Employee
WHERE (Em_fname LIKE '%Haris%')


--database Queries
SELECT Employee_id, Em_father_name, Em_fname, Em_lname, Em_Ad_Area, Em_Ad_Street, Em_Ad_House, Em_Ad_City, Em_cont_no, Employee_Machine_id, Employee_Department_name, joining_date, Date_of_birth, Employee_cnic, Em_Status
FROM   tb_Employee
WHERE (Employee_id LIKE '%' + @Employee_id + '%') AND (Em_fname LIKE '%' + @Em_fname + '%') AND (Em_Ad_Area LIKE '%' + @Em_Ad_Area + '%') AND (Em_Ad_City LIKE '%' + @Em_Ad_City + '%') AND (Employee_Machine_id LIKE '%' + @Employee_Machine_id + '%') AND 
(Employee_Department_name LIKE '%' + @Employee_Department_name + '%') AND (Em_Status LIKE '%' + @Em_Status + '%') AND (Em_Status LIKE '%' + @Em_Status + '%')

SELECT Dep_name, Dep_description
FROM   tb_Department
WHERE (Dep_name LIKE '%' + @Dep_name + '%') AND (Dep_description LIKE '%' + @Dep_description + '%')

SELECT Request_Request_id, Request_Item_id, quantity, issued_by
FROM   tb_Request_Item
WHERE (Request_Request_id LIKE '%' + @Request_Request_id + '%') AND (Request_Item_id LIKE '%' + @Request_Item_id + '%') AND (issued_by LIKE '%' + @issued_by + '%')

SELECT Purchased_item_id, Purchased_Employee_id, Date_time, quantity, price, entered_by, Purchased_supplier_id, igp_no
FROM   tb_Item_Purchased
WHERE (Purchased_item_id LIKE '%' + @Purchased_item_id + '%') AND (Purchased_Employee_id LIKE '%' + @Purchased_Employee_id + '%') AND (Purchased_supplier_id LIKE '%' + @Purchased_supplier_id + '%') AND (entered_by LIKE '%' + @entered_by + '%')

SELECT Request_id, Request_Employee_id, Req_description, Date_time, demand_note
FROM   tb_Request
WHERE (Request_id LIKE '%' + @Request_id + '%') AND (Request_Employee_id LIKE '%' + @Request_Employee_id + '%') AND (Req_description LIKE '%' + @Req_description + '%') AND (demand_note LIKE '%' + @demand_note + '%')

SELECT item_id, item_name, quantity, unit, min_quantity, item_description, Total_price, Avg_price
FROM   tb_Item
WHERE (item_id LIKE '%' + @item_id + '%') and  (item_name LIKE '%' + @item_name + '%') and (item_description LIKE '%' + @item_description + '%') 

SELECT supplier_id, supplier_name, supplier_contact_person, sup_Ad_Area, sup_Ad_Street, sup_Ad_Shop, sup_Ad_City, supplier_contact, sup_description
FROM   tb_Supplier
WHERE (supplier_id LIKE '%' + @supplier_id + '%') AND (supplier_name LIKE '%' + @supplier_name + '%')AND (sup_description LIKE '%' + @sup_description + '%')

try
            {
                this.tb_SupplierTableAdapter.Fill(this.db_projectsDataSet.tb_Supplier);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

alter procedure sbsample_1
@fname varchar(20)
as
begin
select * from tb_Employee
where Em_fname like '%' +@fname +'%'
end

sbsample_1 'is'

--Queries
requests show kr ni thin ek machine ki
wo item jo maximum use hoti 



--
koi bhi item ek dafa search mein likhi tou uski sari entries ki date r item name date wise...issued r purchased aleda aleda

--report  
cost r date item ki (further option purchased ya issued) ya sari purachased items ya issued items




alter trigger tr_tb_Purchased_Item_forUpdate
on tb_item_purchased
for insert 
as
begin

declare @quantity int
declare @amount int

	select @quantity= quantity from inserted
    select @amount= price*quantity from inserted
		
		update tb_Item set amount = amount+@amount where tb_Item.item_id = (select Purchased_item_id from inserted)
    
	update tb_Item set quantity = quantity+@quantity where tb_Item.item_id = (select Purchased_item_id from inserted)
    
end

alter table 


create trigger tr_tb_Item_issued_for_delete_entry
on tb_request_item
after delete 
as
begin

declare @q1 int
declare @avg float

select @q1 = quantity from deleted
select @avg =  Avg_price from tb_Item


update tb_Item set quantity=quantity+@q1 where tb_Item.item_id = (select Request_Item_id from deleted)

update tb_Item set Total_price=Total_price+(@q1*@avg)  where tb_Item.item_id = (select Request_Item_id from deleted)

update tb_Request set demand_note='pending' where tb_Request.Request_id = (select top 1 Request_Request_id from deleted)
	
end



alter trigger tr_tb_Item_for_insert_amount
on tb_item
after insert 
as
begin

declare @amount int

	select @amount= price*quantity from inserted
		
		update tb_Item set amount = amount+@amount where tb_Item.item_id = (select item_id from inserted)
    
end


create trigger tr_tb_Item_update_amount_forUpdate
on tb_item
for update 
as
begin

declare @amount int

	select @amount= price*quantity from inserted
		
		update tb_Item set amount = amount+@amount where tb_Item.item_id = (select item_id from inserted)
    
end


create trigger tr_tb_Item_amount_for_remove
on tb_item
after delete 
as
begin

declare @amount int

	select @amount= price*quantity from inserted
		
		update tb_Item set amount = amount+@amount where tb_Item.item_id = (select item_id from inserted)
    
end



alter function fun1(@city varchar(20))
returns @table table(Id varchar(20), name varchar(20))
as 
begin
insert into @table
select employee_id,Em_fname from tb_Employee
where Em_Ad_City like '%' +@city +'%'
return
end



select * from fun1('lahore')


create trigger tr_tb_Purchased_Item_for_insert_quantity
on tb_item_purchased
after insert 
as
begin

declare @quantity int

	select @quantity= quantity from inserted
	
	update tb_Item set quantity = quantity+@quantity where tb_Item.item_id = (select Purchased_item_id from inserted)
end



alter trigger tr_tb_Purchased_Item_for_update_quantity
on tb_item_purchased
after update
as
begin

declare @quantity int
declare @price int

	select @quantity= quantity from inserted
	select @price= price from inserted
	
	update tb_Item set price = price+@price where tb_Item.item_id = (select Purchased_item_id from inserted)
	
	update tb_Item set quantity = quantity+@quantity where tb_Item.item_id = (select Purchased_item_id from inserted)
	if  @quantity <0
	begin
	update tb_item_purchased set quantity = @quantity*-1 where Purchased_item_id= (select Purchased_item_id from inserted)

	end
	else
	begin
	update tb_item_purchased set quantity = @quantity*1 where Purchased_item_id= (select Purchased_item_id from inserted)

	end
end






--tb_item for insert amount
alter trigger tr_tb_Item_for_insert_amounts
on tb_item
after insert 
as
begin
	--insert into tb_Item values(,@total_price/@quantity)
	update tb_Item set Avg_price = Total_price/quantity where tb_Item.item_id = (select item_id from inserted)
print 'a'		
end

--tb_item for update
alter trigger tr_tb_Item_for_update_amounts
on tb_item
after update 
as
begin



	update tb_Item set Avg_price = Total_price/quantity where tb_Item.item_id = (select item_id from inserted)
print 'd'	
end



select * from tb_Item
insert into tb_Item values('jw','fsd',5,'343',4,'fsd',40,0)


select Average_price from tb_Item

update tb_item set item_name='ssss' where item_id='jjjd'


alter trigger tr_tb_Item_Purchased_for_insert_amounts
on tb_Item_Purchased 
after insert 
as
begin

declare @total_price int

declare @q int

	select @total_price= price*quantity from inserted
	
   	select @q= quantity from inserted
	
	update tb_Item_Purchased set Total_price = @total_price where tb_Item_Purchased.Purchased_Employee_id = (select Purchased_Employee_id from inserted)
	
	if @total_price>0
	begin
	update tb_item set total_price = total_price+(@total_price)  where tb_Item.item_id = (select Purchased_item_id from inserted)
	end
	
	if @total_price>0
	begin
	update tb_item set quantity = quantity+@q  where tb_Item.item_id = (select Purchased_item_id from inserted)
	end
	print'insertion'
end



select *from tb_Item



create trigger tr_tb_Item_Purchased_for_update_amounts
alter trigger tr_tb_Item_Purchased_for_update_amounts

on tb_Item_Purchased
after update
as
begin


declare @old_quantity int
declare @old_price int
declare @old_total_price int


	select @old_quantity= quantity from deleted
	select @old_price = price from deleted
	select @old_total_price = @old_price * @old_quantity from inserted
	

declare @new_quantity int
declare @new_price int
declare @new_total_price int

	select @new_quantity= quantity from inserted
	select @new_price = price from inserted
	select @new_total_price = @new_price * @new_quantity from inserted
	
	update tb_item_purchased set total_price = @new_total_price where tb_item_purchased.purchased_item_id = (select purchased_item_id from inserted)
	
	if @new_total_price>0
	begin
	update tb_item set Total_price = total_price+@new_total_price where tb_Item.item_id = (select Purchased_item_id from inserted)
	end

	
	if @new_total_price>0
	begin
	update tb_item set quantity = quantity+@new_quantity  where tb_Item.item_id = (select Purchased_item_id from inserted)
	end
	print 'update'
	
	
end

insert into tb_Item values('abcd','fsd',5,'343',4,'fsd',40,0)
update tb_item set item_name='lhr' where item_id='abc'


truncate table tb_item

select * from tb_Item
select * from tb_Item_Purchased
insert into tb_Item_Purchased values('abcd','E500',GETDATE(),3,20,'ccs','s100',22,0)

truncate table tb_item_purchased
update tb_Item_Purchased set quantity=4 where Purchased_item_id='ff'


ALTER trigger tr_tb_Item_issued_for_insert_entry
on tb_request_item
after insert 
as
begin

declare @q1 int
declare @avg float

select @q1 = quantity from inserted
select @avg =  Avg_price from tb_Item


update tb_Item set quantity=quantity-@q1 where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Item set Total_price=Total_price-(@q1*@avg)  where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Request set demand_note='Issued' where tb_Request.Request_id = (select top 1 Request_Request_id from inserted)
	
update tb_Request_Item set Price=@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)

update tb_Request_Item set Total_price=quantity*@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)	
end

select sum(total_price) from tb_Request_Item 
where datepart(m,issued_Date) = DATEPART(m,dateadd(m,-1,getdate())) and datepart(yy,issued_Date) = datepart(yy,dateadd(m,-1,getdate()))


create function total_amount_previous_month()
returns table
as
return (select sum(Total_price) as Total_Amount_Issued from tb_Request_Item where datepart(m,issued_Date) = DATEPART(m,dateadd(m,-1,getdate())) and datepart(yy,issued_Date) = datepart(yy,dateadd(m,-1,getdate()))
)

select * from total_amount_previous_month()

select sum(total_price) from tb_item

--min quantity
create function fun_min_invenotry()
returns table
as return(
select * from tb_Item where quantity<=min_quantity)

select * from fun_min_invenotry()


alter function fun_item_issued_recently()
returns table
as return (
select top 7*  from tb_Request_Item  order by issued_Date desc 
)

alter function fun_item_purchased_recently()
returns table
as return (
select top 7* from tb_Item_Purchased  order by Date_time desc 

)

select * from fun_item_issued_recently()
select * from fun_item_purchased_recently()


------
create function fun_total_inhand_amount_inventory()
returns table
as
return (select sum(Total_price) As Total_inhand_price from tb_Item)


select * from fun_total_inhand_amount_inventory()

use db_projects

create function total_isssued_amount_current_month()
returns table
as
return  (Select sum(total_price) AS Total_Price from tb_Request_item where datepart(m,issued_date)= datepart(m,getdate()) and datepart(yy,issued_date) = datepart(yy,getdate()))

select * from total_isssued_amount_current_month()

--request pending for one more than one day
create function requests_pending_for_more_than_one_day()
returns table
as
return(
SELECT  tb_Request.*, tb_Employee.Em_fname, tb_Employee.Em_lname, tb_Employee.Employee_Department_name 
FROM tb_Request 
INNER JOIN tb_Employee 
ON tb_Request.Request_Employee_id = tb_Employee.Employee_id
where demand_note = 'Pending' and datepart(dd,date_time) <= DATEPART(dd,dateadd(dd,-1,getdate())) 
)

select * from requests_pending_for_more_than_one_day()

---------------Views

create view view_item_table_for_user
as
select item_id,item_name,quantity,unit,min_quantity,item_description from tb_Item 

insert into view_item_table_for_user values ('5','5',102,'r',3,'cd')

select * from view_item_table_for_user

select * from tb_Item

select * from view_item_table_for_user

create view view_materi_item_table_for_user
as
select item_id,item_name,quantity,unit,min_quantity,item_description from tb_Item 



create view view_materi_item_table_for_user
as
select item_id,item_name,quantity,unit,min_quantity,item_description from tb_Item 




Create Materialized view MV_Employee

as

select * from tb_Item








create view view_item_issued_table_for_user
as
select Request_Request_id,Request_Item_id,quantity,issued_by,issued_Date from tb_Request_Item 


--create view view_item_issued_table_for_user
--as
--select Request_Request_id,Request_Item_id,quantity,issued_by,issued_Date from tb_Request_Item 

create view view_item_purchased_table_for_user
as
select Purchased_item_id,Purchased_Employee_id,Date_time,quantity,entered_by,Purchased_supplier_id,igp_no from tb_Item_Purchased 

select * from view_item_purchased_table_for_user


select * from view_item_issued_table_for_user

use db_projects


select * from view_rough







--Trigers
Three types
ddl,dml,log out

--ddl
--two types
after trigger  (insert,update,delete)
instead of      (insert,update,delete)

create trigger tr1_Name
on tbl_trigger
instead of insert
as
begin

delete from tbl2 where id=5
end


--create trigger tr1_Name
on tbl_trigger
for insert
as
begin

delete from tbl2 where id=5
end
-- ye tab chalay ga jab insert chalay ga r insert ka kam nahi ho ga





--view
view mein query likhtay
k kya kya show krna r view bna dete






--temporary tables  
-- use with #sign
--local temporary tables
--global variables

--built in functions
--deterministic
no change in function output
e.g count  

--non-deterministic
change in function ouput
e.g date time


--"indexes" most imp
database after 100 records kharab ho ja ti
yani k pora table nahi scan krna pehlay uska index bna lena
primary key itself is a index
--two types
clustered and non-clustered (slow)
by default non-clustered

clustered means dictionary k tarha yani alphabetically
ye ek hi lagay ga

non-clustered like book ka index dekhna

sp_helpindex tb_item


sp_helpindex rough
--applying index

create index  ex_employee_salary  on rough (q)

create clustered index  ex_employee_salary  on rough (p)


create nonclustered index  ex_employee_salary  on rough (p,q)

create nonclustered index  ex_employee_salary  on rough (q)



use db_projects



--Lecture Functions
--Scalar function
alter function fun(@id varchar(20), @Name varchar(20))
returns varchar(20)
as
begin

declare @total varchar(20) 

return (select Em_father_name from tb_Employee where Employee_id=@id and Em_fname=@Name)
 
end


alter function fun(@id varchar(20), @Name varchar(20))
returns varchar(20)
as
begin

declare @total varchar(20) 

@total= (select Em_father_name from tb_Employee where Employee_id=@id and Em_fname=@Name)
return @total
end
--calling
declare @a varchar(20)

 set @a= (select dbo.fun('E1000','haris'))

--print var
print @a


--inline function
create function inline()
returns table
as
return (select Em_fname,Employee_cnic from tb_Employee)


create function inline()
returns table
as
return (select Em_fname,Employee_cnic from tb_Employee)


--inline function
select * from dbo.inline()

update dbo.inline() set Em_fname='Umer' where Em_fname='bhai'


--table delete na ho sky

alter function inline()
returns table
with schemabinding
as
return (select Em_fname,Employee_cnic from dbo.tb_Employee)


--multiline table
create function fun1()
returns @table table(Id varchar(20), name varchar(20))
as 
begin
insert into @table
select employee_id,Em_fname from tb_Employee
return
end



select * from fun1()

-----------------------------------------------------------------------------
CREATE FUNCTION SEARCH_DateWise()
declare @date datetime
select * from tb_Item_Purchased where cast(date_time,date) = @DATE


--plsql  use rextex
declare
b number(3);
a number(2) := 7;   --initilization at the time of decalration

speedcheck exception;
d exception
begin
--printing

Dbms_output.put_line('Heloo Pakistan');

Dbms_output.put_line('Heloo Pakistan'||a);

if(a<120) then
Dbms_output.put_line('vehicle speed is under limit');
else
raise speedcheck

endif;

Exception
when speedcheck then 
Dbms_output.put_line('over speeding');

when b then 
Dbms_output.put_line('bbbbd');


end;


declare
a number(2) :=5;

begin
for on a..5  --5 bar execute hona a=5 say start tk
loop
a=a+2;
Dbms_output.put_line('bcdcdd');

endloop;

select * from tb_Request_Item

alter function issued_Date_Wise(@date date,@date2 date)
returns table
as
return  
(select * from tb_Request_Item where cast(issued_date as datetime) between @date and @date2)

alter function purchased_item_Date_Wise(@date date,@date2 date)
returns table
as
return  
(select * from tb_Item_Purchased where cast(Date_time as datetime) between @date and @date2)

select * from tb_Item_Purchased

select * from issued_Date_Wise('2018-01-17','2018-06-07')

select * from purchased_item_Date_Wise('2018-01-17','2018-12-17')

select * from tb_Item





----------------------new trigger--------------

USE [db_projects]
GO
/****** Object:  Trigger [dbo].[tr_tb_Item_issued_for_insert_entry]    Script Date: 5/18/2018 3:32:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[tr_tb_Item_issued_for_insert_entry]
on [dbo].[tb_Request_Item]
after insert 
as
begin

declare @r varchar(20)
declare @i varchar(20)

select @r =Request_Request_id from inserted
select @i =Request_Item_id from inserted

declare @q1 int
declare @avg float

declare @q2 int

select @q2 = quantity from tb_Item
select @q1 = quantity from inserted
select @avg =  Avg_price from tb_Item


if @q1<=@q2
begin
update tb_Item set quantity=quantity-@q1 where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Item set Total_price=Total_price-(@q1*@avg)  where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Request set demand_note='Issued' where tb_Request.Request_id = (select top 1 Request_Request_id from inserted)
	
update tb_Request_Item set Price=@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)

update tb_Request_Item set Total_price=quantity*@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)	
end
else
begin
delete tb_Request_Item 
where Request_Request_id=@r and Request_Item_id=@i
end


end
------------------------new trigger-----------



---------------------old trigger-----------
USE [db_projects]
GO
/****** Object:  Trigger [dbo].[tr_tb_Item_issued_for_insert_entry]    Script Date: 5/18/2018 3:32:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[tr_tb_Item_issued_for_insert_entry]
on [dbo].[tb_Request_Item]
after insert 
as
begin

declare @q1 int
declare @avg float

select @q1 = quantity from inserted
select @avg =  Avg_price from tb_Item


update tb_Item set quantity=quantity-@q1 where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Item set Total_price=Total_price-(@q1*@avg)  where tb_Item.item_id = (select Request_Item_id from inserted)

update tb_Request set demand_note='Issued' where tb_Request.Request_id = (select top 1 Request_Request_id from inserted)
	
update tb_Request_Item set Price=@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)

update tb_Request_Item set Total_price=quantity*@avg where tb_Request_item.Request_Item_id = (select Request_Item_id from inserted)-- and tb_Request_item.Request_Request_id = (select Request_Request_id from inserted)	
end

-----------------------old trigger-----------
