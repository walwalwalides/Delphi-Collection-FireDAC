USE master;  
GO  
IF EXISTS (SELECT * from sysdatabases WHERE name='DB_Product')
BEGIN

	DROP DATABASE DB_Product;
END


CREATE DATABASE DB_Product;
GO
USE DB_Product;
GO
CREATE TABLE Typs (
TypID int IDENTITY(1,1) not null,
TypDescription varchar(40) not null unique,
Constraint pk_TypID primary key (TypID)); 


CREATE TABLE Marks (
MarkID int IDENTITY(1,1) not null,
MarkDescription varchar(40) not null unique,
MarkSiteWeb varchar(40),
Constraint pk_MarkID primary key (MarkID));  
 

--CREATE TABLE PRODUCTS
CREATE TABLE Products (
  ProductID varchar(10) primary key not null,
  TypID int not null,
  MarkID int not null,
  Model varchar(40) not null,
  SerialNumber varchar(40) not null,
  Price decimal(10,2) not null,
  
  constraint fk_TypID foreign key (TypID) references Typs(TypID),
  constraint fk_MarkID foreign key (MarkID) references Marks(MarkID),
  constraint chk_price check (price>0)
  );
  


-----------------------------------------------------------------------------------------------------------------------


-- CREATE ADMIN CONNECTION
IF NOT EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'Admin01')
BEGIN 
	CREATE LOGIN Admin01 with password='Admin01',
	DEFAULT_DATABASE=DB_Product;
END

-- DEFINE ADMIN CONNECTION

USE DB_Product;
GO
IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'Admin01')
BEGIN
CREATE USER Admin01 from login Admin01
exec sp_addrolemember 'db_datareader','Admin01'
exec sp_addrolemember 'db_datawriter','Admin01'
END;
GO


------------------------------------------------------------------------------------------------------------------------

-- CREATE USER CONNECTION
IF NOT EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'User01')
BEGIN 
	CREATE LOGIN User01 with password='User01',
	DEFAULT_DATABASE=DB_Product;
END

-- DEFINE USER CONNECTION

USE DB_Product;
GO
IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'User01')
BEGIN
CREATE USER User01 from login User01

--ALLOWING USER TASKS 
GRANT SELECT, INSERT, UPDATE ON DATABASE::DB_Product TO User01;
 

DENY DELETE ON DATABASE::DB_Product TO User01;
END;


-----------------------------------------------------------------------------------------------------------------

-- CREATE Customer01 CONNECTION
IF NOT EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'Customer01')
BEGIN 
	CREATE LOGIN Customer01 with password='Customer01',
	DEFAULT_DATABASE=DB_Product;
END

-- DEFINE Customer01 CONNCETION
USE DB_Product;
GO
IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'Customer01')
BEGIN
CREATE USER Customer01 from login Customer01


GRANT SELECT ON DATABASE::DB_Product TO Customer01;

-- ALLOWING Customer01 TASKS
DENY INSERT, UPDATE, DELETE ON DATABASE::DB_Product TO Customer01;
END;
GO




----------------------------------------------------------------------------------------------------------
USE DB_Product;
GO

INSERT INTO Typs(TypDescription) VALUES('Smartphone')  
INSERT INTO Typs(TypDescription) VALUES('PC Portable')
INSERT INTO Typs(TypDescription) VALUES('Tablet')
INSERT INTO Typs(TypDescription) VALUES('Scanner')
INSERT INTO Typs(TypDescription) VALUES('Router') 
INSERT INTO Typs(TypDescription) VALUES('Switch') 


INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('HP','https://www8.hp.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('Lenovo','https://www.lenovo.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('Samsung','https://www.samsung.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('Dell','https://www.dell.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('Cisco','https://www.cisco.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('D-Link','https://www.dlink.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('TP-Link','https://www.tp-link.com')
INSERT INTO Marks(MarkDescription,MarkSiteWeb) VALUES('Huawei','https://www.huawei.com')

-----------------------------Smartphone Samsung------------------------------------------------------
INSERT INTO Products VALUES('1111500111','1','3','galaxy s6','879941312','2800')
INSERT INTO Products VALUES('1114100444','1','3','galaxy s7','487262719','2600')
INSERT INTO Products VALUES('1115100535','1','3','galaxy s8','315901816','3800')
INSERT INTO Products VALUES('1112200772','1','3','galaxy s9','299764918','3100')
INSERT INTO Products VALUES('1120300602','1','3','galaxy s10','817397114','3300')




-----------------------------Router Huawei------------------------------------------------------

INSERT INTO Products VALUES('1114287560','5','8','HG532e','698006646','4900')
INSERT INTO Products VALUES('1118690388','5','8','HG532e','311785377','2200')
INSERT INTO Products VALUES('1112582077','5','8','HG8245H','840004783','3500')
INSERT INTO Products VALUES('1117407602','5','8','HG531','792898284','3900')
INSERT INTO Products VALUES('1114823107','5','8','HG8245H','848072909','2500')
INSERT INTO Products VALUES('1112457606','5','8','HG532e','300176368','2700')
INSERT INTO Products VALUES('1117989238','5','8','EchoLife HG520','669473450','3000')
INSERT INTO Products VALUES('1115058026','5','8','B715','484282660','3200')
INSERT INTO Products VALUES('1117831421','5','8','HG8245H','910309442','3200')
INSERT INTO Products VALUES('1116134616','5','8','EchoLife HG520','811661605','4900')
INSERT INTO Products VALUES('1116834267','5','8','HG8245H','554572290','4100')
INSERT INTO Products VALUES('1117252860','5','8','B715','740847495','2400')
INSERT INTO Products VALUES('1116068300','5','8','HG531','339611701','2200')
INSERT INTO Products VALUES('1116802226','5','8','HG8245H','314974691','5600')
INSERT INTO Products VALUES('1119571468','5','8','HG8245H','927697217','3100')
INSERT INTO Products VALUES('1118255789','5','8','HG8245H','618533717','4600')
INSERT INTO Products VALUES('1113075511','5','8','EchoLife HG520','941825610','3400')
INSERT INTO Products VALUES('1112774691','5','8','B715','478263022','2200')
INSERT INTO Products VALUES('1112538187','5','8','B715','657950464','4700')


-------------------------------Imprimante HP--------------------------------------------------

INSERT INTO Products VALUES('2117139458','3','1','Color LaserJet Pro M254nw','698006646','4900')
INSERT INTO Products VALUES('2126154461','3','1','XPS 13','311785377','2200')
INSERT INTO Products VALUES('2113647399','3','1','HP DesignJet T520','840004783','3500')
INSERT INTO Products VALUES('2123527893','3','1','OfficeJet 5232 tout-en-un','792898284','3900')
INSERT INTO Products VALUES('2118236015','3','1','HP DesignJet T520','848072909','2500')
INSERT INTO Products VALUES('2113392538','3','1','XPS 13','300176368','2700')
INSERT INTO Products VALUES('2124718821','3','1','Color LaserJet Pro M254nw','669473450','3000')
INSERT INTO Products VALUES('2118717024','3','1','HP DesignJet T520','484282660','3200')
INSERT INTO Products VALUES('2124395684','3','1','tout-en-un HP Pro 8725','910309442','3200')
INSERT INTO Products VALUES('2120921394','3','1','ENVY Photo 7830','811661605','4900')
INSERT INTO Products VALUES('2122353963','3','1','HP DesignJet T520','554572290','4100')
INSERT INTO Products VALUES('2123211051','3','1','DesignJet T520','740847495','2400')
INSERT INTO Products VALUES('2120785608','3','1','ENVY Photo 7830','339611701','2200')
INSERT INTO Products VALUES('2122288358','3','1','tout-en-un HP Pro 8725','314974691','5600')
INSERT INTO Products VALUES('2127958513','3','1','tout-en-un HP Pro 8725','927697217','3100')
INSERT INTO Products VALUES('2125264597','3','1','HP DesignJet T520','618533717','4600')
INSERT INTO Products VALUES('2114657729','3','1','Color LaserJet Pro M254nw','941825610','3400')
INSERT INTO Products VALUES('2114041784','3','1','DesignJet T520','478263022','2200')
INSERT INTO Products VALUES('2113557531','3','1','DesignJet T520','657950464','4700')
INSERT INTO Products VALUES('2113533135','3','1','tout-en-un HP Pro 8725','268507000','3200')
INSERT INTO Products VALUES('2129240640','3','1','OfficeJet 5232 tout-en-un','493303343','3700')
INSERT INTO Products VALUES('2129168997','3','1','ENVY Photo 7830','512665609','3900')
INSERT INTO Products VALUES('2112963900','3','1','HP DesignJet T520','807004913','2700')
INSERT INTO Products VALUES('2129603127','3','1','OfficeJet 5232 tout-en-un','348889854','5500')





------------------------Router DLINK-------------------------------------------------------------------
INSERT INTO Products VALUES('1311565111','5','6','DSL-2750U','879941322','2800')
INSERT INTO Products VALUES('1316899657','5','6','DIR-615','487262759','2600')
INSERT INTO Products VALUES('1318840919','5','6','DIR-600','315901866','3800')
INSERT INTO Products VALUES('1312944466','5','6','DSL-524T','299764918','3100')
INSERT INTO Products VALUES('1329494449','5','6','DSL-2640U','817397714','3300')
INSERT INTO Products VALUES('1325201935','5','6','DSL-524T','776358668','3200')
INSERT INTO Products VALUES('1314743812','5','6','DSL-2640U','593932338','2900')
INSERT INTO Products VALUES('1327703864','5','6','DSL-2640U','605332687','2500')
INSERT INTO Products VALUES('1328654950','5','6','DSL-2640U','816013652','5900')
INSERT INTO Products VALUES('1321192112','5','6','DSL-524T','855489766','2000')
INSERT INTO Products VALUES('1314322210','5','6','DSL-2750U','619119116','2000')
INSERT INTO Products VALUES('1323154668','5','6','DSL-2750U','817262399','4600')
INSERT INTO Products VALUES('1326625159','5','6','DIR-615','660171185','2800')
INSERT INTO Products VALUES('1324877679','5','6','DIR-600','948294637','4500')
INSERT INTO Products VALUES('1331079373','5','6','DSL-2640U','746082309','3100')
INSERT INTO Products VALUES('1313243932','5','6','DIR-615','615115528','5500')
INSERT INTO Products VALUES('1321532963','5','6','DIR-600','946655996','4700')
INSERT INTO Products VALUES('1318185592','5','6','DSL-2750U','767212707','5900')
INSERT INTO Products VALUES('1326694674','5','6','DIR-615','399667628','2500')
INSERT INTO Products VALUES('1329422398','5','6','DIR-615','683175536','5400')
INSERT INTO Products VALUES('1325039630','5','6','DSL-2640U','324323379','4500')
INSERT INTO Products VALUES('1317038515','5','6','DSL-524T','373260423','3000')
INSERT INTO Products VALUES('1322192040','5','6','DSL-524T','382766641','2600')
INSERT INTO Products VALUES('1316805838','5','6','DSL-2750U','674135894','3900')
INSERT INTO Products VALUES('1317139458','5','6','DSL-2750U','698006646','4900')




-----------------------------pc portable---------------------------------------------------

INSERT INTO Products VALUES('1413243932','2','2','Thinkpad X230','615115528','5500')
INSERT INTO Products VALUES('1421532963','2','2','Thinkpad T430','946655996','4700')
INSERT INTO Products VALUES('1418185592','2','2','G50','767212707','5900')
INSERT INTO Products VALUES('1426694674','2','2','Thinkpad E480','399667628','2500')
INSERT INTO Products VALUES('1429422398','2','2','Thinkpad X230','683175536','5400')
INSERT INTO Products VALUES('1425039630','2','2','G505','324323379','4500')
INSERT INTO Products VALUES('1417038515','2','2','Thinkpad X220','373260423','3000')
INSERT INTO Products VALUES('1422192040','2','2','Thinkpad X220','382766641','2600')
INSERT INTO Products VALUES('1416805838','2','2','G70','674135894','3900')
INSERT INTO Products VALUES('1417139458','2','2','G70','698006646','4900')
INSERT INTO Products VALUES('1426154461','2','2','G50','311785377','2200')
INSERT INTO Products VALUES('1413647399','2','2','Thinkpad X230','840004783','3500')
INSERT INTO Products VALUES('1423527893','2','2','G500','792898284','3900')
INSERT INTO Products VALUES('1418236015','2','2','Thinkpad X230','848072909','2500')
INSERT INTO Products VALUES('1413392538','2','2','G50','300176368','2700')
INSERT INTO Products VALUES('1424718821','2','2','G70','669473450','3000')
INSERT INTO Products VALUES('1418717024','2','2','Thinkpad X230','484282660','3200')
INSERT INTO Products VALUES('1424395684','2','2','Thinkpad E480','910309442','3200')
INSERT INTO Products VALUES('1420921394','2','2','G505','811661605','4900')
INSERT INTO Products VALUES('1422353963','2','2','Thinkpad E480','554572290','4100')
INSERT INTO Products VALUES('1423211051','2','2','Thinkpad X220','740847495','2400')
INSERT INTO Products VALUES('1420785608','2','2','G500','339611701','2200')
INSERT INTO Products VALUES('1422288358','2','2','Thinkpad E480','314974691','5600')
INSERT INTO Products VALUES('1427958513','2','2','Thinkpad E480','927697217','3100')
INSERT INTO Products VALUES('1425264597','2','2','Thinkpad E480','618533717','4600')
INSERT INTO Products VALUES('1414657729','2','2','G70','941825610','3400')
INSERT INTO Products VALUES('1414041784','2','2','Thinkpad X220','478263022','2200')
INSERT INTO Products VALUES('1413557531','2','2','Thinkpad X230','657950464','4700')
INSERT INTO Products VALUES('1413533135','2','2','Thinkpad E480','268507000','3200')
INSERT INTO Products VALUES('1429240640','2','2','Thinkpad T430','493303343','3700')
INSERT INTO Products VALUES('1429168997','2','2','G505','512665609','3900')
INSERT INTO Products VALUES('1412963900','2','2','Thinkpad X230','807004913','2700')
INSERT INTO Products VALUES('1429603127','2','2','G500','348889854','5500')
INSERT INTO Products VALUES('1419447019','2','2','G70','840899885','4300')



-----------------------------PC Portable HP ---------------------------------------------------


INSERT INTO Products VALUES('1520699756','2','1','Pavilion dv7','891903504','4600')
INSERT INTO Products VALUES('1519672715','2','1','Pavilion dv7','361337060','5900')
INSERT INTO Products VALUES('1520759047','2','1','Envy x360','483179017','4400')
INSERT INTO Products VALUES('1527522401','2','1','Pavilion g6','354453074','3800')
INSERT INTO Products VALUES('1514385412','2','1','Envy dv7','736090771','5200')
INSERT INTO Products VALUES('1528314981','2','1','Envy x360','384520752','4900')
INSERT INTO Products VALUES('1516957618','2','1','Pavilion g6','435882054','2100')
INSERT INTO Products VALUES('1529162332','2','1','Envy 13','314795811','4600')
INSERT INTO Products VALUES('1511849842','2','1','Pavilion dv7','677604991','5000')
INSERT INTO Products VALUES('1515307465','2','1','Envy 17','844137774','4500')
INSERT INTO Products VALUES('1521095399','2','1','Envy 13','797738889','2700')
INSERT INTO Products VALUES('1518955804','2','1','Envy 17','637789816','5400')
INSERT INTO Products VALUES('1525789838','2','1','Envy dv7','686252802','2400')
INSERT INTO Products VALUES('1518299733','2','1','Pavilion g6','562624876','4200')
INSERT INTO Products VALUES('1529424881','2','1','Envy 13','790847851','5900')
INSERT INTO Products VALUES('1518566191','2','1','Envy x360','546417236','3100')
INSERT INTO Products VALUES('1529600027','2','1','Envy dv7','537401328','2300')
INSERT INTO Products VALUES('1521895831','2','1','Pavilion dv7','645492211','2800')
INSERT INTO Products VALUES('1515388409','2','1','Pavilion g6','958788903','4000')
INSERT INTO Products VALUES('1522876423','2','1','Pavilion g6','528577626','5100')
INSERT INTO Products VALUES('1529449109','2','1','Envy 13','671754352','4100')
INSERT INTO Products VALUES('1529730529','2','1','Envy dv7','272945233','5900')
INSERT INTO Products VALUES('1521240526','2','1','Envy 17','406289615','5300')
INSERT INTO Products VALUES('1513426922','2','1','Pavilion g6','300775968','5900')
INSERT INTO Products VALUES('1519079504','2','1','Envy 13','883062372','5200')
INSERT INTO Products VALUES('1519268967','2','1','Pavilion dv7','455749023','5400')
INSERT INTO Products VALUES('1515117115','2','1','Pavilion g6','555089492','2300')
INSERT INTO Products VALUES('1530491854','2','1','Envy x360','391920878','2400')
INSERT INTO Products VALUES('1512791397','2','1','Pavilion dv7','453876730','5200')



GO






