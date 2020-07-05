{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2020                            }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uConfiguration;

interface

uses
  uiConfig;

Type
  TConfig = class(TInterfacedObject, IConfig)
  private
    fTypeDataBase: Integer;

  public
    function getTypeDataBase: Integer;
    procedure setTypeDataBase(const Value: Integer);
    Constructor Create;
  end;

function configuration: IConfig;

implementation

uses
  SysUtils,IOutils, IniFiles;

const
  cInifile = 'Option.ini';


var
  mConfig: IConfig = Nil;
  Ini: TIniFile;

function configuration: IConfig;
begin
  if not Assigned(mConfig) then
    mConfig := TConfig.Create;
  Result := mConfig;
end;

{ TConfig }

constructor TConfig.Create;
 var
   siniFilename :string;
begin
  sIniFilename := TPath.Combine(ExpandFileName(GetCurrentDir), cInifile);
  Ini := TIniFile.Create(siniFilename);
end;

function TConfig.getTypeDataBase: Integer;
begin
  Result := Ini.ReadInteger('CONNECTION', 'DATABASE', 0);
end;

procedure TConfig.setTypeDataBase(const Value: Integer);
begin
  Ini.WriteInteger('CONNECTION', 'DATABASE', Value);
  fTypeDataBase := Value;
end;

end.
