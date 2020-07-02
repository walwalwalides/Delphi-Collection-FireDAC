{ ============================================
  Software Name : 	SaveMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Tasks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,
  Utils, Declare, UOptions, StringUtils, DMSales;

type
  TFrmTasks = class(TForm)
    ButtonOk: TButton;
    PanelTasks: TPanel;
    ListBoxTasks: TListBox;
    EditTask: TEdit;
    SpeedButtonDel: TSpeedButton;
    SpeedButtonUpd: TSpeedButton;
    SpeedButtonAdd: TSpeedButton;
    LabelTasksList: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SetPosCompos;
    procedure FormResize(Sender: TObject);
    procedure WMSizing(var Msg: TMessage); message WM_SIZING;

    procedure TestNbrTasksMax;
    procedure ListBoxTasksClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure SpeedButtonUpdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Declarations privées }
  public
    { Déclarations publiques }
    procedure SetTasksList;
  end;

var
  FrmTasks: TFrmTasks;

implementation

{$R *.dfm}

const
  nMARGE = 4;
  nFRMWIDTH = 216;
  nFRMHEIGHT = 260;

procedure TFrmTasks.FormCreate(Sender: TObject);
begin
  OptionsData.ReadFrmTasksCfg;
  with AppliData do
  begin
    Top := nFrmTasksTop;
    Left := nFrmTasksLeft;
    Height := nFrmTasksHeight;
  end;
  Width := nFRMWIDTH;
  SetTasksList;
  ButtonOk.Left := (ClientWidth - ButtonOk.Width) div 2;
  SetPosCompos;
end;

procedure TFrmTasks.SetPosCompos;
begin
  ButtonOk.Top := ClientHeight - ButtonOk.Height - nMARGE;
  PanelTasks.Height := ButtonOk.Top - (3 * nMARGE);
  EditTask.Top := PanelTasks.Height - EditTask.Height - nMARGE - nMARGE;
  SpeedButtonAdd.Top := EditTask.Top - SpeedButtonAdd.Height - nMARGE;
  SpeedButtonUpd.Top := SpeedButtonAdd.Top;
  SpeedButtonDel.Top := SpeedButtonAdd.Top;
  ListBoxTasks.Height := SpeedButtonAdd.Top - ListBoxTasks.Top - nMARGE;
end;

procedure TFrmTasks.FormResize(Sender: TObject);
begin
  Width := nFRMWIDTH;
  if Height < nFRMHEIGHT then
    Height := nFRMHEIGHT;
  SetPosCompos;
end;

procedure TFrmTasks.WMSizing(var Msg: TMessage);
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

procedure TFrmTasks.SetTasksList;
var
  i: integer;
begin
  DataModuleSales.GetAllTasks(AppliData.nUserID);
  EditTask.Clear;
  ListBoxTasks.Clear;
  for i := 0 to Length(AppliData.asTasks) - 1 do
    ListBoxTasks.Items.Add(AppliData.asTasks[i]);
  TestNbrTasksMax;
end;

procedure TFrmTasks.TestNbrTasksMax;
begin
  if ListBoxTasks.Count = nNBR_TASKSMAX then
  begin
    MessageDlg('You have reached the maximum number of tasks supported by the program.', mtWarning, [mbOk], 0);
    SpeedButtonAdd.Enabled := FALSE;
  end;
end;

procedure TFrmTasks.ListBoxTasksClick(Sender: TObject);
begin
  EditTask.Text := ListBoxTasks.Items[ListBoxTasks.ItemIndex];
  if HrsUtils.TaskUsed(AppliData.anTasksID[ListBoxTasks.ItemIndex]) then
    SpeedButtonDel.Enabled := FALSE
  else
    SpeedButtonDel.Enabled := TRUE;
end;

procedure TFrmTasks.ButtonAddClick(Sender: TObject);
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
        bFound := TRUE;
        Continue;
      end;
    end;
    if not bFound then
      if DataModuleSales.AddTask(AppliData.nUserID, EditTask.Text) = TRUE then
        SetTasksList;
  end;
end;

procedure TFrmTasks.SpeedButtonUpdClick(Sender: TObject);
var
  nID: LongInt;
begin
  if EditTask.Text <> '' then
  begin
    nID := AppliData.anTasksID[ListBoxTasks.ItemIndex];
    if DataModuleSales.UpdTask(nID, EditTask.Text) = TRUE then
      SetTasksList;
  end;
end;

procedure TFrmTasks.ButtonDelClick(Sender: TObject);
var
  nID: LongInt;
begin
  if ListBoxTasks.ItemIndex <> -1 then
  begin
    if HrsUtils.TaskUsed(AppliData.anTasksID[ListBoxTasks.ItemIndex]) then
      MessageDlg('The task is already used. It is therefore no longer possible to delete it.', mtWarning, [mbOk], 0)
    else
    begin
      nID := AppliData.anTasksID[ListBoxTasks.ItemIndex];
      if DataModuleSales.DelTask(nID) = TRUE then
      begin
        SetTasksList;
        SpeedButtonAdd.Enabled := TRUE;
      end;
    end;
  end;
end;

procedure TFrmTasks.ButtonOkClick(Sender: TObject);
begin
  ModalResult := mrYes
end;

procedure TFrmTasks.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTasks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with AppliData do
  begin
    nFrmTasksTop := Top;
    nFrmTasksLeft := Left;
    nFrmTasksHeight := Height;
  end;
  OptionsData.WriteFrmTasksCfg;
end;

end.
