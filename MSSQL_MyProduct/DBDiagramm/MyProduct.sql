CREATE DATABASE MyProduct
GO

IF OBJECT_ID ('Categorie') IS NULL 
BEGIN
	CREATE TABLE Categorie(
	   CategorieId int IDENTITY(1,1) NOT NULL,
	   CATDescription  varchar(30) NULL,
	   PRIMARY KEY (CategorieId)
)
END

IF OBJECT_ID ('Products') IS NULL 
BEGIN
	CREATE TABLE Products(
		ProductId int IDENTITY(1,1) NOT NULL,
		Pname varchar(60) NULL,
		Pdescription varchar(255) null,
		Pvalue decimal(18,5) default 0.00000 null,
		Pquantity decimal(18,5) default 0.00000 null,
		CategorieId int null,
		PRIMARY KEY (ProductId),
 --    	CONSTRAINT FK_ProductCategorie 
		FOREIGN KEY (CategorieId) references Categorie(CategorieId)
	)
END


IF OBJECT_ID ('Clients') IS NULL 
BEGIN
	CREATE TABLE Clients(
		ClienteId int IDENTITY(1,1) NOT NULL,
		Cname varchar(60) NULL,
		Caddress varchar(60) null,
		Ccity varchar(50) null,
		Cneighborhood varchar(40) null,
		Cstate varchar(2) null,
		Czipcode varchar(10) null,
		Ctelefon varchar(14) null,  
		Cemail varchar(100) null,
		Cbirthdate datetime null
		PRIMARY KEY (ClienteId),
	)
END

  INSERT INTO Categorie (CATDescription) VALUES ('Analog electronics'),('Digital electronics')


  INSERT INTO Products (Pname, Pdescription, Pvalue, Pquantity, CategorieId)
       VALUES ('Motion detector MD', 
	           'A motion detector is a device that detects moving objects.',
			   100.00,
			   1,
			   1)

INSERT INTO Clients (Cname, Caddress, CCity, Cneighborhood, Cstate, CZipcode, CTelefon, Cemail, Cbirthdate)
VALUES ('WalWalWalides', '5 Street WalWalWalides', 'Erfurt', 'Anger 1', 'SP', 
        '10.100-100', '(00) 0000-0000', 'WalWalWalides@gmail.com','21/05/2019')

