create table applied (
	user_name varchar(150),
	nid varchar(150),
	address varchar(150),
	branch varchar(150),
	pass varchar(150),
	CONSTRAINT PK_Customer_appl PRIMARY KEY (user_name,nid)
);
create table accept_info(
	user_name varchar(150),
	nid varchar(150),
	address varchar(150),
	branch varchar(150),
	pass varchar(150),
	CONSTRAINT PK_Customer_acpt PRIMARY KEY (user_name)
);
create table deposite(
	deposite_user varchar(150),  
	deposite_amount money,
	about varchar(150),
	dates date,
	FOREIGN KEY (deposite_user) REFERENCES accept_info(user_name),
	CONSTRAINT PK_deposite PRIMARY KEY (deposite_user,deposite_amount)
);
create table loan(
	loan_user varchar(150),  
	loan_amount money,
	about varchar(150),
	dates date,
	FOREIGN KEY (loan_user) REFERENCES accept_info(user_name),
	CONSTRAINT PK_loan PRIMARY KEY (loan_user,loan_amount)
);

drop table user_info;
create table user_info(
	user_name varchar(150),
	deposite_u varchar(150),
	about_u varchar(150),
	loan_u varchar(150),
	deposite_amount money,
	loan_amount money,
	FOREIGN KEY (user_name) REFERENCES accept_info(user_name),
	FOREIGN KEY (deposite_u,deposite_amount) REFERENCES deposite(deposite_user,deposite_amount),
	FOREIGN KEY (loan_u,loan_amount) REFERENCES loan(loan_user,loan_amount),
	CONSTRAINT PK_user_info PRIMARY KEY (user_name)

);

create table employee(
	emp_id varchar(150),
	name varchar(150),
	branch varchar(150),
	pass varchar(150),
	CONSTRAINT PK_emp_info PRIMARY KEY (emp_id)
);

create table transection(
	policy_user varchar(150),
	transection_no int,
	amount varchar(150),
	where_to varchar(150),
	CONSTRAINT PK_transection PRIMARY KEY (transection_no),
	FOREIGN KEY (policy_user) REFERENCES accept_info(user_name)
);

create table record(
	rec_user varchar(150),
	branch varchar(150),
	datee date,
	transection_no int,
	FOREIGN KEY (rec_user) REFERENCES accept_info(user_name),
	FOREIGN KEY (transection_no) REFERENCES transection(transection_no)
);
create table manager(
	emp_id varchar(150),
	user_name varchar(150),
	transection_no int,
	FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
	FOREIGN KEY (transection_no) REFERENCES transection(transection_no),
	FOREIGN KEY (user_name) REFERENCES accept_info(user_name)
);


insert into applied values('Jui','123450','Dhaka','Dhaka','1234a');
insert into applied values('Mujahid','123451','Kishoregonj','Kishoregonj','1234b');
insert into applied values('Jannatul','123452','Sylhet','Sylhet','1234c');
insert into applied values('Islam','123453','Dhaka','Dhaka','1234d');
insert into applied values('Saad','123450','Sylet','Sylet','1234e');


insert into accept_info values('Jui','123450','Dhaka','Dhaka','1234a');
insert into accept_info values('Mujahid','123451','Kishoregonj','Kishoregonj','1234b');
insert into accept_info values('Jannatul','123452','Sylhet','Sylhet','1234c');
insert into accept_info values('Islam','123453','Dhaka','Dhaka','1234d');
insert into accept_info values('Saad','123450','Sylet','Sylet','1234e');



insert into deposite values('Jui',50000,'gsgsdgs','2008-11-11');
insert into deposite values('Mujahid',45000,'gsgsdgs','2015-05-07');
insert into deposite values('Jannatul',90000,'gsgsdgs','2017-07-17');
insert into deposite values('Islam',67000,'gsgsdgs','2011-09-23');
insert into deposite values('Saad',33000,'gsgsdgs','2018-02-03');


insert into loan values('Jui',43200,'sssssgf','2018-02-03');
insert into loan values('Mujahid',78200,'sssssgf','2009-08-29');
insert into loan values('Jannatul',35000,'sssssgf','2001-12-22');
insert into loan values('Islam',22500,'sssssgf','2013-04-12');
insert into loan values('Saad',75900,'sssssgf','2016-06-19');




insert into user_info values('Jui','Jui','gsgsdgss','Jui',50000,43200);
insert into user_info values('Mujahid','Mujahid','gsgsdgs','Mujahid',45000,78200);
insert into user_info values('Jannatul','Jannatul','gsgsdgs','Jannatul',90000,35000);
insert into user_info values('Islam','Islam','gsgsdgs','Islam',67000,22500);
insert into user_info values('Saad','Saad','gsgsdgs','Saad',33000,75900);


insert into transection values('Jui',010101,'50000','abc');
insert into transection values('Mujahid',010102,'35000','xyz');
insert into transection values('Islam',010103,'59000','pqr');



insert into record values('Jui','Dhaka','2008-11-11',010101);
insert into record values('Islam','Dhaka','2011-09-23',010102);
insert into record values('Mujahid','Kishoregonj','2015-05-07',010103);



insert into employee values('001','Jui','Kishoregonj','1234a');
insert into employee values('002','Mujahid','Sylhet','1234a');
insert into employee values('003','Islam','Dhaka','1234a');




insert into manager values('001','Jui',010101);
insert into manager values('002','Mujahid',010102);
insert into manager values('003','Islam',010103);


select * from [dbo].[accept_info];
select * from [dbo].[applied];
select * from [dbo].[deposite];
select * from [dbo].[employee];
select * from [dbo].[loan];
select * from [dbo].[manager];
select * from [dbo].[record];select loan_user from loan where loan_user like '%mu%' 


select sum (loan_amount ) as TotalLoan	from loan;

select deposite_user from deposite as deposite where deposite_amount > 50000;

select user_name from accept_info where branch = 'Dhaka'  and address='Dhaka';

select deposite_user,loan_user from deposite , loan where deposite.deposite_user = loan.loan_user



