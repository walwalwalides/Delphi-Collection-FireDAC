USE master;  
GO  

IF EXISTS (SELECT * from sysdatabases WHERE name='DB_Product')
BEGIN
    --Drop the Database
	DROP DATABASE DB_Product;
END;

--Delete Admins
IF EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'Admin01')
BEGIN 
	DROP LOGIN Admin01
END;

--Delete Users
IF EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'User01')
BEGIN 
	DROP LOGIN User01
END;

--Delete Customers 
IF EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'Customer01')
BEGIN 
	DROP LOGIN Customer01
END;