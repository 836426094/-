/*create table invoice 
(
       invoice_id number primary key,
       vendor_id number not null,
       invoice_number varchar2(50) not null,
       invoice_date date default sysdate,
       invoice_total number(9,2) not null,
       payment_total number(9,2) default 0
)
*/

--drop table invoice;  --删除表
--drop table vendors;
/*
--1列级别约束
create table invoice 
(
       invoice_id  number constraint invoice_pk primary key,
       vendor_id  number constraint vendor_id_nn not null,
       invoice_number varchar2(50) constraint invoice_number1 not null,
       invoice_date date default sysdate,
       invoice_total number(9,2)  constraint invoice_sum not null,
       payment_total number(9,2)  default 0
)*/

/*
--表级别约束
create table invoice 
(
       invoice_id  number ,
       vendor_id  number ,
       invoice_number varchar2(50)  not null,
       invoice_date date default sysdate,
       invoice_total number(9,2) not null,
       payment_total number(9,2)  default 0,
       
       constraint invoice_pk primary key(invoice_id),
       constraint vendor_id_nn unique (vendor_id)
)*/

                            
/*
--2创建vendors 表
create table vendors
(
vendor_id number,   --供应商id
vendor_name varchar2(50) not null,   --供应商名称
constraint vendors_pk primary key (vendor_id), --主键
constraint vendors_uq unique (vendor_name)  --唯一性约束

)*/


/*--给表vendors创建关联
create table vendors
(
vendor_id number,   --供应商id
vendor_name varchar2(50) not null,   --供应商名称
constraint vendors_pk primary key (vendor_id), --主键
constraint vendors_uq unique (vendor_name) --唯一性约束
--constraint vendorid_fk_incoiceid foreign key (incoice_id) references invouce (incoice_id) on delete cascade
)*/


/*
--3列级别创建外键关联 
create table invoice 
(
       invoice_id  number ,
       vendor_id  number references vendors(vendor_id),  --供应商id  与cendors表的vendor_id 关联
       invoice_number varchar2(50)  not null,
       invoice_date date default sysdate,
       invoice_total number(9,2) not null,
       payment_total number(9,2)  default 0,
       
       constraint invoice_pk primary key(invoice_id,vendor_id),
       constraint vendor_id_nn unique (vendor_id)
)
*/

--drop table invoice;
--表级别创建外键关联
/*
create table invoice 
(
       invoice_id  number ,
       vendor_id  number ,
       invoice_number varchar2(50)  not null,
       invoice_date date default sysdate,
       invoice_total number(9,2),
       payment_total number(9,2)  default 0,
       
       constraint invoiceid_vendorid_pk primary key(invoice_id,vendor_id),
       constraint vendor_id_nn unique (vendor_id),
       constraint invoice_fk_vendors foreign key (vendor_id) references vendors 
       (vendor_id) 
       on delete cascade
)*/


--4  创建检查约束

create table invoice_check
(
       invoice_id number,
       invoice_total number(9,2) default 0,
       
);




