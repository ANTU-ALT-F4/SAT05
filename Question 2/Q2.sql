--CAU 1
CREATE DATABASE Supermarket_Managemen
GO
USE Supermarket_Managemen
GO
--CAU 2:


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IMPORTSLIP_DETAIL') and o.name = 'FK_IMPORTSL_IMPORTSLI_IMPORT_S')
alter table IMPORTSLIP_DETAIL
   drop constraint FK_IMPORTSL_IMPORTSLI_IMPORT_S
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IMPORTSLIP_DETAIL') and o.name = 'FK_IMPORTSL_IMPORTSLI_ITEM')
alter table IMPORTSLIP_DETAIL
   drop constraint FK_IMPORTSL_IMPORTSLI_ITEM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IMPORT_SLIP') and o.name = 'FK_IMPORT_S_EXIST_SUPPLIER')
alter table IMPORT_SLIP
   drop constraint FK_IMPORT_S_EXIST_SUPPLIER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ITEM') and o.name = 'FK_ITEM_BELONG_CATEGORY')
alter table ITEM
   drop constraint FK_ITEM_BELONG_CATEGORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ITEM') and o.name = 'FK_ITEM_LOCATED_COUNTER')
alter table ITEM
   drop constraint FK_ITEM_LOCATED_COUNTER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ITEM') and o.name = 'FK_ITEM_MAKE_MANUFACT')
alter table ITEM
   drop constraint FK_ITEM_MAKE_MANUFACT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALESSLIP_DETAIL') and o.name = 'FK_SALESSLI_SALESSLIP_SALES_SL')
alter table SALESSLIP_DETAIL
   drop constraint FK_SALESSLI_SALESSLIP_SALES_SL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALESSLIP_DETAIL') and o.name = 'FK_SALESSLI_SALESSLIP_ITEM')
alter table SALESSLIP_DETAIL
   drop constraint FK_SALESSLI_SALESSLIP_ITEM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALES_SLIP') and o.name = 'FK_SALES_SL_RECEIVE_CUSTOMER')
alter table SALES_SLIP
   drop constraint FK_SALES_SL_RECEIVE_CUSTOMER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORY')
            and   type = 'U')
   drop table CATEGORY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COUNTER')
            and   type = 'U')
   drop table COUNTER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IMPORTSLIP_DETAIL')
            and   name  = 'IMPORTSLIP_DETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index IMPORTSLIP_DETAIL.IMPORTSLIP_DETAIL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IMPORTSLIP_DETAIL')
            and   name  = 'IMPORTSLIP_DETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index IMPORTSLIP_DETAIL.IMPORTSLIP_DETAIL2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('IMPORTSLIP_DETAIL')
            and   type = 'U')
   drop table IMPORTSLIP_DETAIL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IMPORT_SLIP')
            and   name  = 'EXIST_FK'
            and   indid > 0
            and   indid < 255)
   drop index IMPORT_SLIP.EXIST_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('IMPORT_SLIP')
            and   type = 'U')
   drop table IMPORT_SLIP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ITEM')
            and   name  = 'LOCATED_FK'
            and   indid > 0
            and   indid < 255)
   drop index ITEM.LOCATED_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ITEM')
            and   name  = 'MAKE_FK'
            and   indid > 0
            and   indid < 255)
   drop index ITEM.MAKE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ITEM')
            and   name  = 'BELONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index ITEM.BELONG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ITEM')
            and   type = 'U')
   drop table ITEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MANUFACTURER')
            and   type = 'U')
   drop table MANUFACTURER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALESSLIP_DETAIL')
            and   name  = 'SALESSLIP_DETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALESSLIP_DETAIL.SALESSLIP_DETAIL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALESSLIP_DETAIL')
            and   name  = 'SALESSLIP_DETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALESSLIP_DETAIL.SALESSLIP_DETAIL2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SALESSLIP_DETAIL')
            and   type = 'U')
   drop table SALESSLIP_DETAIL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALES_SLIP')
            and   name  = 'RECEIVE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALES_SLIP.RECEIVE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SALES_SLIP')
            and   type = 'U')
   drop table SALES_SLIP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUPPLIER')
            and   type = 'U')
   drop table SUPPLIER
go

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY (
   CODE_CATEGORY        varchar(10)          not null,
   NAME                 varchar(150)         null,
   constraint PK_CATEGORY primary key (CODE_CATEGORY)
)
go

/*==============================================================*/
/* Table: COUNTER                                               */
/*==============================================================*/
create table COUNTER (
   CNUMBER              int                  not null,
   COUNTER_NAME         varchar(150)         null,
   LOCATION             varchar(150)         null,
   constraint PK_COUNTER primary key (CNUMBER)
)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CODE_CUSTOMER        varchar(10)          not null,
   NAME                 varchar(150)         null,
   ADDRESS              varchar(150)         null,
   constraint PK_CUSTOMER primary key (CODE_CUSTOMER)
)
go

/*==============================================================*/
/* Table: IMPORTSLIP_DETAIL                                     */
/*==============================================================*/
create table IMPORTSLIP_DETAIL (
   CODE_ITEM            varchar(10)          not null,
   CODE_IMPORT_SLIP     varchar(10)          not null,
   QUANTITY             int                  null,
   UNIT_PRICE           float                null,
   constraint PK_IMPORTSLIP_DETAIL primary key (CODE_ITEM, CODE_IMPORT_SLIP)
)
go

/*==============================================================*/
/* Index: IMPORTSLIP_DETAIL2_FK                                 */
/*==============================================================*/




create nonclustered index IMPORTSLIP_DETAIL2_FK on IMPORTSLIP_DETAIL (CODE_ITEM ASC)
go

/*==============================================================*/
/* Index: IMPORTSLIP_DETAIL_FK                                  */
/*==============================================================*/




create nonclustered index IMPORTSLIP_DETAIL_FK on IMPORTSLIP_DETAIL (CODE_IMPORT_SLIP ASC)
go

/*==============================================================*/
/* Table: IMPORT_SLIP                                           */
/*==============================================================*/
create table IMPORT_SLIP (
   CODE_IMPORT_SLIP     varchar(10)          not null,
   CODE_SUPPLIER        varchar(10)          not null,
   DATE                 datetime             null,
   constraint PK_IMPORT_SLIP primary key (CODE_IMPORT_SLIP)
)
go

/*==============================================================*/
/* Index: EXIST_FK                                              */
/*==============================================================*/




create nonclustered index EXIST_FK on IMPORT_SLIP (CODE_SUPPLIER ASC)
go

/*==============================================================*/
/* Table: ITEM                                                  */
/*==============================================================*/
create table ITEM (
   CODE_ITEM            varchar(10)          not null,
   CODE_CATEGORY        varchar(10)          not null,
   CODE_MANUFACTURER    varchar(10)          not null,
   CNUMBER              int                  not null,
   ITEM_NAME            varchar(150)         null,
   UNIT                 varchar(150)         null,
   constraint PK_ITEM primary key (CODE_ITEM)
)
go

/*==============================================================*/
/* Index: BELONG_FK                                             */
/*==============================================================*/




create nonclustered index BELONG_FK on ITEM (CODE_CATEGORY ASC)
go

/*==============================================================*/
/* Index: MAKE_FK                                               */
/*==============================================================*/




create nonclustered index MAKE_FK on ITEM (CODE_MANUFACTURER ASC)
go

/*==============================================================*/
/* Index: LOCATED_FK                                            */
/*==============================================================*/




create nonclustered index LOCATED_FK on ITEM (CNUMBER ASC)
go

/*==============================================================*/
/* Table: MANUFACTURER                                          */
/*==============================================================*/
create table MANUFACTURER (
   CODE_MANUFACTURER    varchar(10)          not null,
   NAME                 varchar(150)         null,
   NATIONALITY          varchar(150)         null,
   constraint PK_MANUFACTURER primary key (CODE_MANUFACTURER)
)
go

/*==============================================================*/
/* Table: SALESSLIP_DETAIL                                      */
/*==============================================================*/
create table SALESSLIP_DETAIL (
   CODE_ITEM            varchar(10)          not null,
   COUPON_CODE          varchar(10)          not null,
   QUANTITY             int                  null,
   UNIT_PRICE           float                null,
   constraint PK_SALESSLIP_DETAIL primary key (CODE_ITEM, COUPON_CODE)
)
go

/*==============================================================*/
/* Index: SALESSLIP_DETAIL2_FK                                  */
/*==============================================================*/




create nonclustered index SALESSLIP_DETAIL2_FK on SALESSLIP_DETAIL (CODE_ITEM ASC)
go

/*==============================================================*/
/* Index: SALESSLIP_DETAIL_FK                                   */
/*==============================================================*/




create nonclustered index SALESSLIP_DETAIL_FK on SALESSLIP_DETAIL (COUPON_CODE ASC)
go

/*==============================================================*/
/* Table: SALES_SLIP                                            */
/*==============================================================*/
create table SALES_SLIP (
   COUPON_CODE          varchar(10)          not null,
   CODE_CUSTOMER        varchar(10)          not null,
   DATE                 datetime             null,
   constraint PK_SALES_SLIP primary key (COUPON_CODE)
)
go

/*==============================================================*/
/* Index: RECEIVE_FK                                            */
/*==============================================================*/




create nonclustered index RECEIVE_FK on SALES_SLIP (CODE_CUSTOMER ASC)
go

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER (
   CODE_SUPPLIER        varchar(10)          not null,
   FULL_NAME            varchar(150)         null,
   ADDRESS              varchar(150)         null,
   constraint PK_SUPPLIER primary key (CODE_SUPPLIER)
)
go

alter table IMPORTSLIP_DETAIL
   add constraint FK_IMPORTSL_IMPORTSLI_IMPORT_S foreign key (CODE_IMPORT_SLIP)
      references IMPORT_SLIP (CODE_IMPORT_SLIP)
go

alter table IMPORTSLIP_DETAIL
   add constraint FK_IMPORTSL_IMPORTSLI_ITEM foreign key (CODE_ITEM)
      references ITEM (CODE_ITEM)
go

alter table IMPORT_SLIP
   add constraint FK_IMPORT_S_EXIST_SUPPLIER foreign key (CODE_SUPPLIER)
      references SUPPLIER (CODE_SUPPLIER)
go

alter table ITEM
   add constraint FK_ITEM_BELONG_CATEGORY foreign key (CODE_CATEGORY)
      references CATEGORY (CODE_CATEGORY)
go

alter table ITEM
   add constraint FK_ITEM_LOCATED_COUNTER foreign key (CNUMBER)
      references COUNTER (CNUMBER)
go

alter table ITEM
   add constraint FK_ITEM_MAKE_MANUFACT foreign key (CODE_MANUFACTURER)
      references MANUFACTURER (CODE_MANUFACTURER)
go

alter table SALESSLIP_DETAIL
   add constraint FK_SALESSLI_SALESSLIP_SALES_SL foreign key (COUPON_CODE)
      references SALES_SLIP (COUPON_CODE)
go

alter table SALESSLIP_DETAIL
   add constraint FK_SALESSLI_SALESSLIP_ITEM foreign key (CODE_ITEM)
      references ITEM (CODE_ITEM)
go

alter table SALES_SLIP
   add constraint FK_SALES_SL_RECEIVE_CUSTOMER foreign key (CODE_CUSTOMER)
      references CUSTOMER (CODE_CUSTOMER)
go

--CAU 3:
INSERT INTO CUSTOMER (CODE_CUSTOMER, NAME, ADDRESS) VALUES ('CUS01','Nguyen Van An','Vinh Long')
INSERT INTO CUSTOMER (CODE_CUSTOMER, NAME, ADDRESS) VALUES ('CUS02','Nguyen Van A','Can Tho')
INSERT INTO CUSTOMER (CODE_CUSTOMER, NAME, ADDRESS) VALUES ('CUS03','Nguyen Van B','Vinh Long')

SELECT * FROM CUSTOMER

INSERT INTO COUNTER (CNUMBER, COUNTER_NAME, LOCATION) VALUES ('1','LEVEL 1','Khu A')
INSERT INTO COUNTER (CNUMBER, COUNTER_NAME, LOCATION) VALUES ('2','LEVEL 2','Khu B')
INSERT INTO COUNTER (CNUMBER, COUNTER_NAME, LOCATION) VALUES ('3','LEVEL 3','Khu C')

SELECT * FROM COUNTER


INSERT INTO MANUFACTURER (CODE_MANUFACTURER, NAME, NATIONALITY) VALUES ('MA01','CONG TY A','VIET NAM')
INSERT INTO MANUFACTURER (CODE_MANUFACTURER, NAME, NATIONALITY) VALUES ('MA02','CONG TY B','NHAT')
INSERT INTO MANUFACTURER (CODE_MANUFACTURER, NAME, NATIONALITY) VALUES ('MA03','CONG TY C','TRUNG QUOC')

SELECT * FROM MANUFACTURER

INSERT INTO SUPPLIER (CODE_SUPPLIER, FULL_NAME, ADDRESS) VALUES ('SUP01','NGUYEN VAN Z','VINH LONG')
INSERT INTO SUPPLIER (CODE_SUPPLIER, FULL_NAME, ADDRESS) VALUES ('SUP02','NGUYEN VAN X','HA NOI')
INSERT INTO SUPPLIER (CODE_SUPPLIER, FULL_NAME, ADDRESS) VALUES ('SUP03','NGUYEN VAN C','TP HCM')

SELECT * FROM SUPPLIER

INSERT INTO CATEGORY (CODE_CATEGORY, NAME) VALUES ('type1','Thit')
INSERT INTO CATEGORY (CODE_CATEGORY, NAME) VALUES ('type2','Ca')
INSERT INTO CATEGORY (CODE_CATEGORY, NAME) VALUES ('type3','Nuoc')

SELECT * FROM CATEGORY

INSERT INTO ITEM (CODE_ITEM, CODE_CATEGORY, CODE_MANUFACTURER, CNUMBER, ITEM_NAME, UNIT) VALUES ('IT1','type1','MA01','1','Thit Heo','Hop')
INSERT INTO ITEM (CODE_ITEM, CODE_CATEGORY, CODE_MANUFACTURER, CNUMBER, ITEM_NAME, UNIT) VALUES ('IT2','type2','MA02','2','Ca Duoi','Hop')
INSERT INTO ITEM (CODE_ITEM, CODE_CATEGORY, CODE_MANUFACTURER, CNUMBER, ITEM_NAME, UNIT) VALUES ('IT3','type3','MA03','3','Nuoc Suoi','Chai')

SELECT * FROM ITEM

INSERT INTO SALES_SLIP (COUPON_CODE, CODE_CUSTOMER, DATE) VALUES ('CB01','CUS01','2022-12-25')
INSERT INTO SALES_SLIP (COUPON_CODE, CODE_CUSTOMER, DATE) VALUES ('CB02','CUS02','2022-12-25')
INSERT INTO SALES_SLIP (COUPON_CODE, CODE_CUSTOMER, DATE) VALUES ('CB03','CUS03','2022-12-25')

SELECT * FROM SALES_SLIP

INSERT INTO IMPORT_SLIP (CODE_IMPORT_SLIP, CODE_SUPPLIER, DATE) VALUES ('SLP01','SUP01','2022-12-25')
INSERT INTO IMPORT_SLIP (CODE_IMPORT_SLIP, CODE_SUPPLIER, DATE) VALUES ('SLP02','SUP02','2022-12-25')
INSERT INTO IMPORT_SLIP (CODE_IMPORT_SLIP, CODE_SUPPLIER, DATE) VALUES ('SLP03','SUP03','2022-12-25')

SELECT * FROM IMPORT_SLIP

INSERT INTO IMPORTSLIP_DETAIL (CODE_ITEM, CODE_IMPORT_SLIP, QUANTITY, UNIT_PRICE) VALUES ('IT1','SLP01','10','100000')
INSERT INTO IMPORTSLIP_DETAIL (CODE_ITEM, CODE_IMPORT_SLIP, QUANTITY, UNIT_PRICE) VALUES ('IT2','SLP02','20','200000')
INSERT INTO IMPORTSLIP_DETAIL (CODE_ITEM, CODE_IMPORT_SLIP, QUANTITY, UNIT_PRICE) VALUES ('IT3','SLP03','30','300000')
SELECT * FROM IMPORTSLIP_DETAIL

INSERT INTO SALESSLIP_DETAIL (CODE_ITEM, COUPON_CODE, QUANTITY, UNIT_PRICE) VALUES ('IT1','CB01','12','140000')
INSERT INTO SALESSLIP_DETAIL (CODE_ITEM, COUPON_CODE, QUANTITY, UNIT_PRICE) VALUES ('IT2','CB02','14','160000')
INSERT INTO SALESSLIP_DETAIL (CODE_ITEM, COUPON_CODE, QUANTITY, UNIT_PRICE) VALUES ('IT3','CB03','16','180000')
SELECT * FROM SALESSLIP_DETAIL

-- CAU 4:

--CACH 1:
SELECT ITEM.CODE_ITEM, ITEM.CODE_CATEGORY, ITEM.CNUMBER, MANUFACTURER.NAME 
FROM ITEM 
INNER JOIN MANUFACTURER ON ITEM.CODE_MANUFACTURER = MANUFACTURER.CODE_MANUFACTURER
--CACH 2:
SELECT CODE_ITEM, CODE_CATEGORY, CNUMBER, MANUFACTURER.NAME 
FROM ITEM ,MANUFACTURER WHERE ITEM.CODE_MANUFACTURER = MANUFACTURER.CODE_MANUFACTURER

--CAU 5:
SELECT * FROM ITEM
SELECT * FROM SALESSLIP_DETAIL
SELECT * FROM SALES_SLIP
SELECT * FROM CUSTOMER


SELECT ITEM.CODE_ITEM, ITEM.CODE_CATEGORY, ITEM.CODE_MANUFACTURER, ITEM.CNUMBER, ITEM.ITEM_NAME, ITEM.UNIT
FROM     CUSTOMER INNER JOIN
                  SALES_SLIP ON CUSTOMER.CODE_CUSTOMER = SALES_SLIP.CODE_CUSTOMER INNER JOIN
                  SALESSLIP_DETAIL ON SALES_SLIP.COUPON_CODE = SALESSLIP_DETAIL.COUPON_CODE INNER JOIN
                  ITEM ON SALESSLIP_DETAIL.CODE_ITEM = ITEM.CODE_ITEM WHERE CUSTOMER.NAME = 'Nguyen Van An' 

--CAU 6:
CREATE PROC INSERT_CUSTOMER(
   @CODE_CUSTOMER        varchar(10),  
   @NAME                 varchar(150),
   @ADDRESS              varchar(150)
)AS
	IF NOT EXISTS(SELECT CODE_CUSTOMER FROM CUSTOMER WHERE  CODE_CUSTOMER = @CODE_CUSTOMER)
	INSERT INTO CUSTOMER (CODE_CUSTOMER, NAME, ADDRESS)
	VALUES (@CODE_CUSTOMER,@NAME,@ADDRESS)
	ELSE PRINT(N'CO LOI')

EXEC INSERT_CUSTOMER 'CUS04','VO HUY KHANG','LONG HO - VINH LONG'

SELECT * FROM CUSTOMER