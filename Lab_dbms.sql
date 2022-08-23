create database `e_dbms`;

use `e_dbms`;

create table `supplier`(Supp_Id int primary key auto_increment , Supp_Name varchar(50) not null , Supp_City varchar(50) not null , Supp_Phone varchar(50) not null);

create table `customer`(Cus_Id int primary key auto_increment , Cus_Name varchar(20) not null , Cus_Phone varchar(10) not null , Cus_City varchar(30) not null , Cus_Gender char);

create table `category`(Cat_Id int primary key auto_increment , Supp_Name varchar(20) not null);

alter table category rename column Supp_Name to Cat_Name;

create table `product`(Pro_Id int primary key auto_increment , Pro_Name varchar(20) not null default "Dummy", Pro_Desc varchar(60) , Cat_Id int , foreign key (Cat_ID) references `category`(Cat_Id));

create table `supplier_pricing`(Pricing_Id int primary key auto_increment , Pro_Id int , Supp_Id int , Supp_Price int default 0 , foreign key (Pro_Id) references `product`(Pro_Id) , foreign key (Supp_Id) references `supplier`(Supp_Id));

create table `order`(Ord_Id int primary key auto_increment , Ord_Amount int not null , Ord_Date date not null , Cus_Id int , Pricing_Id int , foreign key (Cus_Id) references `customer`(Cus_Id) , foreign key (Pricing_Id) references `supplier_pricing`(Pricing_Id));

create table `rating`(Rat_Id int primary key auto_increment , Ord_Id int , Rat_Ratstars int not null , foreign key (Ord_Id) references `order`(Ord_Id));

insert into `supplier` values (1 , "Rajesh Retails" , "Delhi" , "1234567890");

insert into `supplier` values (2 , "Appario Ltd." , "Mumbai" , "2589631470");

insert into `supplier` values 
(3 , "Knome products" , "Banglore" , "9785462315") , 
(4 , "Bansal Retails" , "Kochi" , "8975463285") , 
(5 , "Mittal Ltd." , "Lucknow" , "7898456532");

insert into `customer` values
(1 , "AAKASH" , "9999999999" , "DELHI" , 'M') , 
(2 , "AMAN" , "9785463215" , "NOIDA" , 'M') , 
(3 , "NEHA" , "9999999999" , "MUMBAI" , 'F') , 
(4 , "MEGHA" , "9994562399" , "KOLKATA" , 'F') , 
(5 , "PULKIT" , "7895999999" , "LUCKNOW" , 'M');

insert into `category` values
(1 , "BOOKS") ,
(2 , "GAMES") , 
(3 , "GROCERIES") ,
(4 , "ELECTRONICS") ,
(5 , "CLOTHES");

insert into `product` values
(1 , "GTA V" , "Windows 7 and above with i5 processor and 8GB RAM" , 2) , 
(2 , "TSHIRT" , "SIZE-L with Black, Blue and White variations" , 5) , 
(3 , "ROG LAPTOP" , "Windows 10 with 15inch screen, i7 processor,1TB SSD" , 4) , 
(4 , "OATS" , "Highly Nutritious from Nestle" , 3) , 
(5 , "HARRY POTTER" , "Best Collection of all time by J.K Rowling" , 1) , 
(6 , "MILK" , "1L Toned MIlk" , 3) ,
(7 , "Boat Earphones" , "1.5Meter long Dolby Atmos" , 4) ,
(8 , "Jeans" , "Stretchable Denim Jeans with various sizes and color" , 5) , 
(9 , "Project IGI" , "compatible with windows 7 and above" , 2),
(10 , "Hoodie" , "Black GUCCI for 13 yrs and above" , 5),
(11	 , "Rich Dad Poor Dad" , "Written by RObert Kiyosaki" , 1) ,
(12 , "Train Your Brain" , "By Shireen Stephen" , 1);

insert into `supplier_pricing` values
(1 , 1 , 2 , 1500) ,
(2 , 3 , 5 , 30000) ,
(3 , 5 , 1 , 3000) ,
(4 , 2 , 3 , 2500) ,
(5 , 4 , 1 , 10000);

INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);




insert into `order` values
(102 , 1000 , '2021-10-12' , 3 , 5),
(103 , 30000 , '2021-09-16' , 5 , 2),
(104 , 1500 , '2021-10-05' , 1 , 1),
(105 , 3000 , '2021-08-16' , 4 , 3),
(106 , 1450 , '2021-08-18' , 1 , 4),
(107 , 789 , '2021-09-01' , 3 , 1),
(108 , 780 , '2021-09-07' , 5 , 5),
(109 , 3000 , '2021-00-10' , 5 , 3),
(110 , 2500 , '2021-09-10' , 2 , 4),
(111 , 1000 , '2021-09-15' , 4 , 5),
(112 , 789 , '2021-09-16' , 4 , 3),
(113 , 31000 , '2021-09-16' , 1 , 1),
(114 , 1000 , '2021-09-16' , 3 , 5),
(115 , 3000 , '2021-09-16' , 5 , 3),
(116 , 99 , '2021-09-17' , 2 , 4);

update `order` set Pricing_Id = 9 where Ord_Id = 106; 

insert into `rating` values
(1 , 101 , 4),
(2 , 102 , 3),
(3 , 103 , 1),
(4 , 104 , 2),
(5 , 105 , 4),
(6 , 106 , 3),
(7 , 107 , 4),
(8 , 108 , 4),
(9 , 109 , 3),
(10 , 110 , 5),
(11 , 111 , 3),
(12 , 112 , 4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


-- 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select count(customer.Cus_Id) , customer.Cus_Gender from `customer` inner join (select sum(Ord_Amount) as Amount , `order`.Cus_Id from `order` group by `order`.Cus_Id) od on customer.Cus_Id = od.Cus_Id where od.Amount >= 3000 group by customer.Cus_Gender;

-- 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
select `order`.Ord_Id , `order`.Ord_Amount , `order`.Ord_Date , `order`.Cus_Id , `order`.Pricing_Id , product.Pro_Name from `order` inner join supplier_pricing on `order`.Pricing_Id = supplier_pricing.Pricing_Id inner join product on product.Pro_Id = supplier_pricing.Pro_Id where Cus_Id =  2;

-- 5)	Display the Supplier details who can supply more than one product.
select supplier.Supp_Id , supplier.Supp_Name , supplier.Supp_City , supplier.Supp_Phone from supplier inner join (select Supp_Id , count(Pro_Id) as No_Of_Product from supplier_pricing group by Supp_Id) product_count on supplier.Supp_Id = product_count.Supp_Id where product_count.No_of_Product > 1; 

-- 6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select t.Cat_Id , c.Cat_Name , t.Pro_Name , t.Price from (select p.Cat_Id , p.Pro_Name , min(s.Supp_Price) as price from (select Pro_Id , Supp_Price from supplier_pricing) s inner join product p on s.Pro_Id = p.Pro_Id group by Cat_Id) t inner join category c on c.Cat_Id = t.Cat_Id;

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
select p.Pro_Id , P.Pro_Name from `order` o inner join supplier_pricing s on o.Pricing_Id = s.Pricing_Id inner join product p on s.Pro_Id = p.Pro_Id where Ord_Date > '2021-10-05';

-- 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
delimiter $$
create procedure My_Procedure()
begin
select * ,
case
when ut.Rating = 5 then "Excellent Service"
when ut.Rating > 4 then "Good Service"
when ut.Rating > 2 then "Average Service"
else "Poor Service"
end as Type_Of_Service 
from (select sp.Supp_Id , s.Supp_Name , avg(r.Rat_Ratstars) as Rating from rating r inner join `order` o on o.Ord_Id = r.Ord_Id inner join supplier_pricing sp on sp.Pricing_Id = o.Pricing_Id inner join supplier s on s.Supp_Id = sp.Supp_Id group by sp.Supp_Id) ut order by ut.Supp_Id;
end $$
delimiter ;

-- 8)	Display customer name and gender whose names start or end with character 'A'.
select Cus_Name , Cus_Gender from customer where Cus_Name regexp '^a|a$';



