--PostgreSQL Script Connection
--Enter SQLScript in Query Tool

Create Table Clients
(
ClientID serial Not Null,
CName character(45) Not Null,
CAdress Character(100),
CCity Character(50),
CTelefon character(14),
CEmail Character(60),
CSex Character(1) Not Null,
CBirthdate Date,
CInsertts timestamp without time zone ,
constraint Client_pkey Primary Key (ClientID)
)


--INSERT RECORD

Insert into Clients values(1,'Client1','3 Welcome Street','New York','(00) 0000-0000','WalWalWalides@gmail.com','M','12.12.2012');

-- UPDATE RECORD

Update Clients Set CEmail='123' where CName='Client1';

--CREATE FUNCTION

CREATE FUNCTION INSERT_DATE()
returns Trigger as $$
Begin
New.CInsertts = Now();
RETURN New;
end;
$$
Language plpgsql; 

--CREATE TRIGGER

Create Trigger Insert_New_Clients
Before INSERT
On Clients
For EACH ROW
Execute procedure INSERT_DATE();

-------------------------------------------- 
Create or replace function Log_Change ()
returns trigger as
$BODY$
Begin
if New.CEmail <>old.CEmail
then
insert into Clients_Logs values(old.CLientID,old.CName,old.CEmail,new.CEmail);
end if; 
return New;
end;
$BODY$
Language plpgsql;


