--PostgreSQL Script Connection
--Enter SQLScript in Query Tool

Create Table Client 
(
ClientID serial Not Null,
CName character(45) Not Null,
CTelefonFix character(13),
CTelefonMobil Character(13),
CEmail Character(40),
CSex Character(1) Not Null,
CBirthdate Date,
CInsertts timestamp without time zone ,
constraint Client_pkey Primary Key (ClientID)	
)

--INSERT RECORD

insert into Client values(1,'Client1',50000,45454,'WalWalWalides@gmail.com','M','12-12-1212');

-- UPDATE RECORD

Update Client Set CEmail='123' where CName='Client1';

--CREATE TRIGGER

Create Trigger Insert_New_Client
Before INSERT
On Client
For EACH ROW
Execute procedure INSERT_DATE();

-------------------------------------------- 
Create or replace function Log_Change ()
returns trigger as
$BODY$
Begin
if New.CEmail <>old.CEmail
then
insert into Client_Logs values(old.CLientID,old.CName,old.CEmail,new.CEmail);
end if; 
return New;
end;
$BODY$
Language plpgsql;

--CREATE FUNCTION

CREATE FUNCTION INSERT_DATE
returns Trigger as $$
New.CInsertts = Now();
RETURN New;
end;
$$
Language plpgsql; 
