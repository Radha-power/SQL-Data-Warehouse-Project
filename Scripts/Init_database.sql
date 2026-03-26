------SQL Data Warehouse Project.---------
---Create database 'Datawarehouse'

use master;
go

-----drop and recreate 'Datawarehouse' database
if exists(  select 1 from sys.databases where name = 'datawarehouse')
Begin
  alter database datawarehouse set single_user with Rollback immediate;
  drop database datawarehouse;
end;

Go  
create database Datawarehouse;

Use Datawarehouse;

----- Create Schema's---

Create Schema Bronze;
go
Create Schema Silver;
go
Create Schema Gold;
