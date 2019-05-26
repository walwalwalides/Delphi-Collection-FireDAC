{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit cActualTableMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,System.SysUtils, cActualConecMMSQL;

type
  TActualTableMSSQL = class(TActualMMSQL)

  private
    function  TabelaExiste(aTableName:String):Boolean;

  protected

  public
    constructor Create(AConecMain:TFDConnection);
    destructor Destroy; override;

    procedure Categorie;
    procedure Cliente;
    procedure Products;
end;

implementation

{ TActualTableMSSQL }

constructor TActualTableMSSQL.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
  Categorie;
  Cliente;
  Products;
end;

destructor TActualTableMSSQL.Destroy;
begin
  inherited;
end;

function TActualTableMSSQL.TabelaExiste(aTableName: String): Boolean;
Var Qry:TFDQuery;
Begin
  Try
    Result:=False;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT OBJECT_ID (:TableName) As ID ');
    Qry.ParamByName('TableName').AsString:=aTableName;
    Qry.Open;

    if Qry.FieldByName('ID').AsInteger>0 then
       Result:=True;

  Finally
    Qry.Close;
    if Assigned(Qry) then
       FreeAndNil(Qry);
  End;
end;




procedure TActualTableMSSQL.Categorie;
begin
  if not TabelaExiste('Categorie') then
  begin
    ExecuteMSSQLDataBase(
      'CREATE TABLE Categorie( '+
      '	 CategorieId int IDENTITY(1,1) NOT NULL, '+
      '	 CATDescription  varchar(30) NULL, '+
      '	 PRIMARY KEY (CategorieId) '+
      '	) '
    );
  end;
end;

procedure TActualTableMSSQL.Cliente;
begin
  if not TabelaExiste('clients') then
  begin
    ExecuteMSSQLDataBase(
      '	CREATE TABLE clients (  '+
      '		ClientsID int IDENTITY(1,1) NOT NULL, '+
      '		Cname varchar(60) NULL, '+
      '		Caddress varchar(60) null, '+
      '		Ccity varchar(50) null, '+
      '		Cneighborhood varchar(40) null, '+
      '		Cstate varchar(2) null, '+
      '		Ccodezip varchar(10) null, '+
      '		Ctelefon varchar(14) null, '+
      '		Cemail varchar(100) null,      '+
      '		CBirthdate datetime null '+
      '		PRIMARY KEY (clienteId) '+
      '	) '
    );
  end;
end;

procedure TActualTableMSSQL.Products;
begin
  if not TabelaExiste('Products') then
  begin
    ExecuteMSSQLDataBase(
      '	CREATE TABLE Productss(  '+
      '		ProductID int IDENTITY(1,1) NOT NULL, '+
      '		Pname varchar(60) NULL, '+
      '		Pdescription varchar(255) null, '+
      '		Pvalue decimal(18,5) default 0.00000 null, '+
      '		Pquantity decimal(18,5) default 0.00000 null, '+
      '		CategorieID int null, '+
      '		PRIMARY KEY (ProductsID), '+
//      '		CONSTRAINT FK_ProductssCategorie '+
      '		FOREIGN KEY (CategorieID) references Categorie(CategorieID) '+
      '	) '
    );
  end;
end;






end.
