/*{ ============================================
  Software Name : 	University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }*/

-- Create tables section -------------------------------------------------


-- Table Class

CREATE TABLE IF NOT EXISTS Class
(
  ID INTEGER NOT NULL,
  ClassNumber INTEGER NOT NULL DEFAULT 0,
  ClassName varchar(50) NOT NULL,
  CONSTRAINT PK_Class PRIMARY KEY (ClassName)
);

-- Table Student


CREATE TABLE IF NOT EXISTS Student
(
  ID INTEGER NOT NULL,
  Matricule varchar(12) NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  BIRTHDAY date NOT NULL,
  ClassName varchar(50),
  Sex char(1) NOT NULL,
  CONSTRAINT PK_Student PRIMARY KEY (ID),
  CONSTRAINT RelationshipClassName FOREIGN KEY (ClassName) REFERENCES Class (ClassName)
);

-- Create triggers for table Student

CREATE TRIGGER IF NOT EXISTS UpAddStudentNr AFTER UPDATE OF ClassName
 ON Student
 FOR EACH ROW
BEGIN
    /*UPDATE, INSERT, DELETE, SELECT Statements */  
    
 UPDATE class SET ClassNumber = ClassNumber +1 WHERE ClassName = new.ClassName; 
    
END;

CREATE TRIGGER IF NOT EXISTS UpDecStudentNr BEFORE UPDATE OF ClassName
 ON Student
 FOR EACH ROW
BEGIN
    /*UPDATE, INSERT, DELETE, SELECT Statements */
     UPDATE class SET ClassNumber = ClassNumber-1 WHERE ClassName = old.ClassName;
END;

CREATE TRIGGER IF NOT EXISTS InAddStudentNr AFTER INSERT
 ON Student
 FOR EACH ROW
BEGIN
    /*UPDATE, INSERT, DELETE, SELECT Statements */       
   UPDATE class SET ClassNumber = ClassNumber +1 WHERE ClassName = new.ClassName; 
END;

CREATE TRIGGER IF NOT EXISTS DelDecStudentNr AFTER DELETE
 ON Student
 FOR EACH ROW
BEGIN
    /*UPDATE, INSERT, DELETE, SELECT Statements */       
     UPDATE class SET ClassNumber = ClassNumber -1 WHERE ClassName = old.ClassName; 
END;




