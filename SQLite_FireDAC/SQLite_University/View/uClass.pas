{ ============================================
  Software Name : 	SQLite_University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDeclare, UOptions, DMUniversity;

type
  TfrmClass = class(TForm)
    ButtonOk: TButton;
    PanelTasks: TPanel;
    SpeedButtonDel: TSpeedButton;
    SpeedButtonUpd: TSpeedButton;
    SpeedButtonAdd: TSpeedButton;
    lblCLassName: TLabel;
    ListBoxTasks: TListBox;
    EditTask: TEdit;
    lblCLassNr: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TestNbrClassMax;
    procedure SetPosCompos;
    procedure FormResize(Sender: TObject);
    procedure WMSizing(var Msg: TMessage); message WM_SIZING;
    procedure ButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonDelClick(Sender: TObject);
    procedure SpeedButtonUpdClick(Sender: TObject);
    procedure SpeedButtonAddClick(Sender: TObject);
    procedure ListBoxTasksClick(Sender: TObject);
  private

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure SetClassList;
  end;

var
  frmClass: TfrmClass;

implementation

{$R *.dfm}

const
  nMARGE = 4;
  nFRMWIDTH = 216;
  nFRMHEIGHT = 260;

procedure TfrmClass.SetPosCompos;
begin
  ButtonOk.Top := ClientHeight - ButtonOk.Height - nMARGE;
  PanelTasks.Height := ButtonOk.Top - (3 * nMARGE);
  EditTask.Top := PanelTasks.Height - EditTask.Height - nMARGE - nMARGE;
  SpeedButtonAdd.Top := EditTask.Top - SpeedButtonAdd.Height - nMARGE;
  SpeedButtonUpd.Top := SpeedButtonAdd.Top;
  SpeedButtonDel.Top := SpeedButtonAdd.Top;
  ListBoxTasks.Height := SpeedButtonAdd.Top - ListBoxTasks.Top - nMARGE;
end;

procedure TfrmClass.FormResize(Sender: TObject);
begin
  Width := nFRMWIDTH;
  if Height < nFRMHEIGHT then
    Height := nFRMHEIGHT;
  SetPosCompos;
end;

procedure TfrmClass.WMSizing(var Msg: TMessage);
var
  pForm: PRect;
begin
  pForm := PRect(Msg.LParam);
  pForm^.Right := pForm^.Left + nFRMWIDTH;
  if (pForm^.Bottom - pForm^.Top) < nFRMHEIGHT then
    pForm^.Bottom := pForm^.Top + nFRMHEIGHT;
  //
  SetPosCompos;
end;

procedure TfrmClass.SetClassList;
var
  i: integer;
begin
  DataModuleUniversity.GetAllClassLst;
  EditTask.Clear;
  ListBoxTasks.Clear;
  for i := 0 to Length(AppliData.asTasks) - 1 do
    ListBoxTasks.Items.Add(AppliData.asTasks[i]);
  TestNbrClassMax;
end;

procedure TfrmClass.TestNbrClassMax;
begin
  if ListBoxTasks.Count = nNBR_CLASSMAX then
  begin
    MessageDlg('You have reached the maximum number of tasks supported by the program.', mtWarning, [mbOk], 0);
    SpeedButtonAdd.Enabled := FALSE;
  end;
end;

procedure TfrmClass.ButtonOkClick(Sender: TObject);
begin
  ModalResult := mrYes
end;

procedure TfrmClass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with AppliData do
  begin
    nFrmTasksTop := Top;
    nFrmTasksLeft := Left;
    nFrmTasksHeight := Height;
  end;
  OptionsData.WriteFrmTasksCfg;
end;

procedure TfrmClass.FormCreate(Sender: TObject);
begin
  // Position := poMainFormCenter;
  // WindowState := wsMaximized;
  lblCLassName.caption := 'ClassName';
  Color := clWhite;
  OptionsData.ReadFrmTasksCfg;
  with AppliData do
  begin
    Top := nFrmTasksTop;
    Left := nFrmTasksLeft;
    Height := nFrmTasksHeight;
  end;
  Width := nFRMWIDTH;
  SetClassList;
  ButtonOk.Left := (ClientWidth - ButtonOk.Width) div 2;
  SetPosCompos;

end;

procedure TfrmClass.ListBoxTasksClick(Sender: TObject);
begin
  if (ListBoxTasks.ItemIndex = -1) then
    exit;

  EditTask.Text := ListBoxTasks.Items[ListBoxTasks.ItemIndex];

  with AppliData do
  begin
    if DataModuleUniversity.GetClassNumber(ListBoxTasks.Items[ListBoxTasks.ItemIndex]) <> -1 then
    begin
      lblCLassNr.caption := 'Nr : ' + RecClass.iClassNumber.ToString;
      if (RecClass.iClassNumber > 0) then
        SpeedButtonUpd.Enabled := FALSE // cause of relation between entity
        else
        begin
          SpeedButtonUpd.Enabled := True;
        end;

    end
    else
    begin
      lblCLassNr.caption := 'Nr : 0';
      SpeedButtonUpd.Enabled := True;
    end;
  end;

  // if TaskUsed(AppliData.anTasksID[ListBoxTasks.ItemIndex]) then
  // SpeedButtonDel.Enabled := FALSE
  // else
  // SpeedButtonDel.Enabled := TRUE;
end;

procedure TfrmClass.SpeedButtonAddClick(Sender: TObject);
var
  bFound: boolean;
  i: integer;
begin
  if EditTask.Text <> '' then
  begin
    // Teste si pas déjà dans la liste
    bFound := FALSE;
    for i := 0 to ListBoxTasks.Count - 1 do
    begin
      if EditTask.Text = ListBoxTasks.Items[i] then
      begin
        bFound := True;
        Continue;
      end;
    end;
    if not bFound then
      if DataModuleUniversity.AddCLass(ListBoxTasks.Count + 1, EditTask.Text) = True then
        SetClassList;
  end;
end;

procedure TfrmClass.SpeedButtonDelClick(Sender: TObject);

var
  nID: LongInt;
begin
  if ListBoxTasks.ItemIndex <> -1 then
  begin

    nID := AppliData.anTasksID[ListBoxTasks.ItemIndex];
    if DataModuleUniversity.DelClass(nID) = True then
    begin
      SetClassList;
      SpeedButtonAdd.Enabled := True;
    end;

  end;
end;

procedure TfrmClass.SpeedButtonUpdClick(Sender: TObject);
var
  nID: LongInt;
begin
  if EditTask.Text <> '' then
  begin
    nID := AppliData.anTasksID[ListBoxTasks.ItemIndex];
    if DataModuleUniversity.UpdClass(nID, EditTask.Text) = True then
      SetClassList;
  end;
end;

end.
