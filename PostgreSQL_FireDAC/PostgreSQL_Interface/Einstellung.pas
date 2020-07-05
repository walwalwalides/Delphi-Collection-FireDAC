unit einstellung;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, nrclasses, nrcomm, Vcl.StdCtrls,
  nrcommbox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, nratcmd, nrgsm, cxControls, cxContainer,
  cxEdit, cxLabel, cxTextEdit, dxBevel, RzShellDialogs, Data.DB,
  cxGroupBox, dxGDIPlusClasses, Vcl.ExtCtrls,ElPgCtl,
  ElXPThemedControl,
  Vcl.ComCtrls, cyGauge, cyAdvLed, cyAnimateGauge, LMDBaseControl,
  LMDBaseGraphicControl, LMDCustomLight, LMDDBLight, LMDCustomComponent,
  LMDTimer, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, cxMaskEdit, cxDropDownEdit, MemDS, DBAccess, Uni, cxRadioGroup,
  JvComponentBase,
  JvAppStorage, JvAppIniStorage,
  JvFormPlacement, dxSkinOffice2019Colorful, dxSkinTheBezier;

type
  Tfmeinstellung = class(TForm)
    // nrGSM-Deklarationen
    nrGsm1: TnrGsm;
    // nrComm-Deklarationen
    nrSetBMZCom: TnrComm;
    nrsetSmscom: TnrComm;

    // RzSaveDialaog-Deklarationen
    RzSaveDialog1: TRzSaveDialog;
    // ZylGSM-Deklarationen
    ZylGSM: TZylGSM;
    // Listbox-Deklarationen

    lstBaudRate: TListBox;

    // LMDHITimer-Deklarationen
    timer1: TLMDHiTimer;

    // ElPagecontrol-Deklarationen
    Peinstellung: TElPageControl;

    // cxTextedit-Deklarationen
    Etechnach: TcxTextEdit;
    Etechnr: TcxTextEdit;
    Etechtelefone: TcxTextEdit;
    Eemail: TcxTextEdit;
    Etechvor: TcxTextEdit;

    // ElTabsheet-Deklarationen
    SHtechnikerinfo: TElTabSheet;
    ShComports: TElTabSheet;
    ShEmail: TElTabSheet;

    // cxGroupeBox-Deklarationen
    GbCominfo: TcxGroupBox;
    GBautoGSMsuch: TcxGroupBox;
    GBemail: TcxGroupBox;
    GbTechinfo: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;

    // nrDeviceBox-Deklarationen
    DevboxBMZ: TnrDeviceBox;
    DevBoxGSM: TnrDeviceBox;

    // cxButton-Deklarationen
    BconfigBMA: TcxButton;
    bconfigGSM: TcxButton;
    bsuchGSM: TcxButton;
    Babsuch: TcxButton;
    Babbrechnen: TcxButton;
    Bspeichern: TcxButton;
    bUpdate: TcxButton;

    // cyAnimateGauge-Deklarationen
    Pbarsuch: TcyAnimateGauge;

    // Image-Deklarationen
    ImgPanaMed1: TImage;
    imgpanamed2: TImage;
    Imgpanamed3: TImage;

    // cxLabel-Deklarationen
    cxLabel1: TcxLabel;
    Lemail: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;

    LschnittstelleBMZ: TcxLabel;
    LschnittstelleGSM: TcxLabel;
    LsuchGSM: TcxLabel;

    // cxTextEdit-Deklarationen
    Ekonto: TcxTextEdit;
    ESmtpserver: TcxTextEdit;
    Ebenutzer: TcxTextEdit;
    Ekennwort: TcxTextEdit;
    Ehauptempf: TcxTextEdit;

    ShUpdate: TElTabSheet;
    cxLabel12: TcxLabel;
    Lsoftversion: TcxLabel;
    IdFTP1: TIdFTP;
    Bcheckversion: TcxButton;
    Lcheckversion: TcxLabel;
    ipwFTP1: TipwFTP;
    bdelete: TcxButton;
    langeinstellung: TsiLangLinked;
    Bdevmgr: TcxButton;
    ShSicherung: TElTabSheet;
    LblSicherung: TcxLabel;
    CBoxProTrans: TcxComboBox;
    GrBoxUpdate: TcxGroupBox;
    RGUpdate: TcxRadioGroup;

    RB1: TcxRadioButton;
    RB2: TcxRadioButton;
    RB3: TcxRadioButton;

    LOftUpdate: TcxLabel;
    TEdtZeit: TcxMaskEdit;
    IniUpdate: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;

    // Hier sind Proceduren
    procedure SetzecomBMZGSM;
    procedure setzeComPara;
    procedure SetzeComPara2;
    procedure BemaileinstellungClick(Sender: TObject);
    procedure SetzeComEinstellungenBMZ;
    procedure SetzeComEinstellungenSMS;
    procedure BspeichernClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BabbrechnenClick(Sender: TObject);
    procedure EtechnrEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EtechnachEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EtechtelefoneEditing(Sender: TObject; var CanEdit: Boolean);
    procedure DevboxBMZChange(Sender: TObject);
    procedure DevBoxGSMChange(Sender: TObject);
    procedure StatusPort;
    procedure scale(F: TForm; devbox1, devbox2: TnrDeviceBox; edt1, edt2, edt3: TcxTextEdit; bt1, Bt2: TcxButton; bconfig1, bconfig2: TcxButton;
      Gbox1, Gbox2: TcxGroupBox);
    procedure BconfigBMAClick(Sender: TObject);
    procedure btnDetectClick(Sender: TObject);
    procedure ZylGSMDetect(Sender: TObject; const Port: TCommPort; const BaudRate: TBaudRate; var Cancel: Boolean);
    procedure bconfigGSMClick(Sender: TObject);
    procedure bsuchGSMClick(Sender: TObject);
    procedure EkontoPropertiesChange(Sender: TObject);
    procedure ESmtpserverPropertiesChange(Sender: TObject);
    procedure EbenutzerPropertiesChange(Sender: TObject);
    procedure EkennwortPropertiesChange(Sender: TObject);
    procedure EhauptempfPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ShComportsShow(Sender: TObject);
    procedure SHtechnikerinfoShow(Sender: TObject);
    procedure timer1Timer(Sender: TObject);
    procedure bUpdateClick(Sender: TObject);
    procedure ShEmailShow(Sender: TObject);
    procedure EkontoEditing(Sender: TObject; var CanEdit: Boolean);
    procedure ESmtpserverEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EbenutzerEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EkennwortEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EhauptempfEditing(Sender: TObject; var CanEdit: Boolean);
    procedure EemailKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EhauptempfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EemailPropertiesChange(Sender: TObject);
    procedure EtechnrPropertiesChange(Sender: TObject);
    procedure EtechnachPropertiesChange(Sender: TObject);
    procedure BabsuchClick(Sender: TObject);
    procedure EtechnrKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EtechnachKeyPress(Sender: TObject; var Key: Char);
    procedure EtechnachEnter(Sender: TObject);
    procedure EtechnrEnter(Sender: TObject);
    procedure EemailEnter(Sender: TObject);
    procedure EtechtelefoneEnter(Sender: TObject);
    procedure EtechvorEnter(Sender: TObject);
    procedure EtechvorKeyPress(Sender: TObject; var Key: Char);
    procedure EtechtelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure BcheckversionClick(Sender: TObject);
    procedure bdeleteClick(Sender: TObject);
    procedure nrSetBMZComFatalError(Sender: TObject; ErrorCode, Detail: Cardinal; ErrorMsg: string; var RaiseException: Boolean);
    procedure ZylGSMConnect(Sender: TObject; Port: TCommPort);
    procedure BdevmgrClick(Sender: TObject);
    procedure EtechnrExit(Sender: TObject);
    procedure EtechnachKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EtechvorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EtechnrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EtechtelefoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure TEdtZeitPropertiesChange(Sender: TObject);
    procedure RB2Click(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure ShUpdateShow(Sender: TObject);

  private

    { Private-Deklarationen }
    FCancelDetect: Boolean;
    procedure WMGetMinMaxInfo(var AMsg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    function CtrlDown: Boolean;

  public
    { Public-Deklarationen }
    sComPortName: string;
    beinstelclose: Boolean;
    comerror: Cardinal;

  type
    TFelddaten = record
      Editfeld1: string[50];
      Editfeld2: string[50];
      Editfeld3: string[50];
    end;

  var
    datensatz: TFelddaten;
    Datei: file of TFelddaten;
    boolconfigdialog: Boolean;
    intradio: integer;

  end;

var

  fmeinstellung: Tfmeinstellung;
  // Boolean-Deklaration
  anderungbool: Boolean;
  anderungBMZbool: Boolean;
  anderungGSMbool: Boolean;
  timerbool: Boolean;
  speicherbool: Boolean;
  // integer-Deklarationen
  iComPort: integer;
  iComPort2: integer;
  iBaudRate: integer;
  iDatenbits: integer;
  iBaudRate2: integer;
  iDatenbits2: integer;
  k: integer;
  // String-Deklarationen

  sParity: string;
  sComPortName2: string;
  sParity2: string;
  sStoppBit2: string;
  sStoppBit: string;

implementation

{$R *.dfm}

uses
  Toollib, mmsystem, shellApi,  TlHelp32, U_System32CPL, ClipBrd;

procedure Tfmeinstellung.WMGetMinMaxInfo(var AMsg: TWMGetMinMaxInfo);
begin
  inherited;
  with AMsg.MinMaxInfo^ do
  begin
    ptMinTrackSize := Point(560, 599);
    ptMaxTrackSize := Point(560, 599);
  end;
end;

procedure Tfmeinstellung.SetzecomBMZGSM;

begin
  if length(tblsetEinstellung.Fieldbyname('ComportBMZ').Asstring) <> 0 then
  begin
    sComPortName := tblsetEinstellung.Fieldbyname('ComportBMZ').Asstring;
    iComPort := tblsetEinstellung.Fieldbyname('ComportnrBmz').AsInteger;
    iBaudRate := tblsetEinstellung.Fieldbyname('BaudrateBMZ').AsInteger;
    sParity := tblsetEinstellung.Fieldbyname('ParitätBMZ').Asstring;
    sStoppBit := tblsetEinstellung.Fieldbyname('StoppbitBMZ').Asstring;
    iDatenbits := tblsetEinstellung.Fieldbyname('DatenbitBMZ').AsInteger;
    LschnittstelleBMZ.Caption := 'Schnittstelle (' + IntToStr(iBaudRate) + ', ' + IntToStr(iDatenbits) + ', ' + sParity + ', ' + sStoppBit + ')';
    LschnittstelleBMZ.Visible := true;
  end;
  if length(tblsetEinstellung.Fieldbyname('ComportGSM').Asstring) <> 0 then
  begin
    sComPortName2 := tblsetEinstellung.Fieldbyname('ComportGSM').Asstring;
    iComPort2 := tblsetEinstellung.Fieldbyname('ComportnrGSm').AsInteger;
    iBaudRate2 := tblsetEinstellung.Fieldbyname('BaudrateGSM').AsInteger;
    sParity2 := tblsetEinstellung.Fieldbyname('ParitätGSM').Asstring;
    sStoppBit2 := tblsetEinstellung.Fieldbyname('StoppbitGSM').Asstring;
    iDatenbits2 := tblsetEinstellung.Fieldbyname('DatenbitGSM').AsInteger;
    LschnittstelleGSM.Caption := 'Schnittstelle (' + IntToStr(iBaudRate2) + ', ' + IntToStr(iDatenbits2) + ', ' + sParity2 + ', ' + sStoppBit2 + ')';
    LschnittstelleGSM.Visible := true;
  end;
end;

procedure Tfmeinstellung.SetzeComEinstellungenBMZ;
var
  BaudRate: DWORD;
  parity: byte;
  stopBit: byte;
  strPar: string;
  strStopBit: string;
  Datenbits: byte;
begin
  BaudRate := nrSetBMZCom.BaudRate;
  parity := ord(nrSetBMZCom.parity);
  stopBit := ord(nrSetBMZCom.StopBits);
  Datenbits := ord(nrSetBMZCom.ByteSize);

  case parity of
    0:
      strPar := 'n';
    1:
      strPar := 'o';
    2:
      strPar := 'e';
    3:
      strPar := 'm';
    4:
      strPar := 's';
  end;

  case stopBit of
    0:
      strStopBit := '1';
    1:
      strStopBit := '1,5';
    2:
      strStopBit := '2';
  end;
  sComPortName := nrSetBMZCom.ComName;
  iComPort := nrSetBMZCom.ComPortNo;
  iBaudRate := BaudRate;
  iDatenbits := Datenbits;
  sParity := strPar;
  sStoppBit := strStopBit;

  LschnittstelleBMZ.Caption := 'Schnittstelle (' + IntToStr(iBaudRate) + ', ' + IntToStr(iDatenbits) + ', ' + sParity + ', ' + sStoppBit + ')';
end;

procedure Tfmeinstellung.SetzeComEinstellungenSMS;
var
  BaudRate: DWORD;
  parity: byte;
  stopBit: byte;
  strPar: string;
  strStopBit: string;
  Datenbits: byte;
begin
  BaudRate := nrsetSmscom.BaudRate;
  parity := ord(nrsetSmscom.parity);
  stopBit := ord(nrsetSmscom.StopBits);
  Datenbits := ord(nrsetSmscom.ByteSize);

  case parity of
    0:
      strPar := 'n';
    1:
      strPar := 'o';
    2:
      strPar := 'e';
    3:
      strPar := 'm';
    4:
      strPar := 's';
  end;

  case stopBit of
    0:
      strStopBit := '1';
    1:
      strStopBit := '1,5';
    2:
      strStopBit := '2';
  end;
  sComPortName2 := nrsetSmscom.ComName;
  iComPort2 := nrsetSmscom.ComPortNo;
  iBaudRate2 := BaudRate;
  iDatenbits2 := Datenbits;
  sParity2 := strPar;
  sStoppBit2 := strStopBit;

  LschnittstelleGSM.Caption := 'Schnittstelle (' + IntToStr(iBaudRate2) + ', ' + IntToStr(iDatenbits2) + ', ' + sParity2 + ', ' + sStoppBit2 + ')';
end;

procedure Tfmeinstellung.setzeComPara;
begin
  if iComPort <> -1 then
  begin
    nrSetBMZCom.ComPortNo := iComPort;
    nrSetBMZCom.BaudRate := iBaudRate;

    if sParity = 'n' then
      nrSetBMZCom.parity := pNone;

    if sParity = 'e' then
      nrSetBMZCom.parity := pEven;

    if sParity = 'o' then
      nrSetBMZCom.parity := pOdd;

    if sParity = 'm' then
      nrSetBMZCom.parity := pMark;

    if sParity = 's' then
      nrSetBMZCom.parity := pSpace;

    if sStoppBit = '1' then
      nrSetBMZCom.StopBits := sbOne;

    if sStoppBit = '1,5' then
      nrSetBMZCom.StopBits := sbOneAndHalf;

    if sStoppBit = '2' then
      nrSetBMZCom.StopBits := sbTwo;
    nrSetBMZCom.ByteSize := iDatenbits;

    LschnittstelleBMZ.Caption := 'Schnittstelle (' + IntToStr(iBaudRate) + ', ' + IntToStr(iDatenbits) + ', ' + sParity + ', ' + sStoppBit + ')';
  end
  else
  begin
    LschnittstelleBMZ.Caption := 'Schnittstelle (Keine Einstellungen)';
  end;
  LschnittstelleBMZ.Visible := true;
end;

procedure Tfmeinstellung.SetzeComPara2;
begin
  if iComPort2 <> -1 then
  begin
    nrsetSmscom.ComPortNo := iComPort2;
    nrsetSmscom.BaudRate := iBaudRate2;

    if sParity = 'n' then
      nrsetSmscom.parity := pNone;

    if sParity = 'e' then
      nrsetSmscom.parity := pEven;

    if sParity = 'o' then
      nrsetSmscom.parity := pOdd;

    if sParity = 'm' then
      nrsetSmscom.parity := pMark;

    if sParity = 's' then
      nrsetSmscom.parity := pSpace;

    if sStoppBit = '1' then
      nrsetSmscom.StopBits := sbOne;

    if sStoppBit = '1,5' then
      nrsetSmscom.StopBits := sbOneAndHalf;

    if sStoppBit = '2' then
      nrsetSmscom.StopBits := sbTwo;

    nrsetSmscom.ByteSize := iDatenbits2;

    LschnittstelleGSM.Caption := 'Schnittstelle (' + IntToStr(iBaudRate2) + ', ' + IntToStr(iDatenbits2) + ', ' + sParity2 + ', ' + sStoppBit2 + ')';
  end
  else
  begin
    LschnittstelleGSM.Caption := 'Schnittstelle (Keine Einstellungen)';
  end;
  LschnittstelleGSM.Visible := true;

end;

procedure Tfmeinstellung.ShComportsShow(Sender: TObject);
begin
  // fmtoollib.PlayResSound('SOUND14',SND_ASYNC)  ;
  ImgPanaMed1.Left := 388;
  imgpanamed2.Left := 388;
  Imgpanamed3.Left := 388;

  ImgPanaMed1.Visible := true;
  imgpanamed2.Visible := true;
  Imgpanamed3.Visible := true;

  timer1.Interval := 0;
  timer1.Enabled := true;

end;

procedure Tfmeinstellung.ShEmailShow(Sender: TObject);
begin
  ImgPanaMed1.Left := 388;
  imgpanamed2.Left := 388;
  Imgpanamed3.Left := 388;

  ImgPanaMed1.Visible := true;
  imgpanamed2.Visible := true;
  Imgpanamed3.Visible := true;

  timer1.Interval := 0;
  timer1.Enabled := true;
end;

procedure Tfmeinstellung.SHtechnikerinfoShow(Sender: TObject);
begin

  // fmtoollib.PlayResSound('SOUND14',SND_ASYNC)  ;
  ImgPanaMed1.Left := 388;
  imgpanamed2.Left := 388;
  Imgpanamed3.Left := 388;

  ImgPanaMed1.Visible := true;
  imgpanamed2.Visible := true;
  Imgpanamed3.Visible := true;

  timer1.Interval := 0;
  timer1.Enabled := true;

end;

procedure Tfmeinstellung.ShUpdateShow(Sender: TObject);
begin
  if RB1.Checked then
    intradio := 1;
  if RB2.Checked then
  begin
    intradio := 2;
    TEdtZeit.Enabled := true;
  end;

end;

procedure Tfmeinstellung.BabbrechnenClick(Sender: TObject);
var
  pPort: TCommPort;
  pBaudRate: TBaudRate;
begin
  if FCancelDetect = false then
    FCancelDetect := true;

  // if anderungbool = true then
  // begin
  // if MessageDlg('Wollen Sie die Anderungen speichern ?', mtWarning, [mbYes, mbNo], 0) = mryes then
  // Bspeichern.Click
  // else
  // begin
  // close;
  //
  // end;
  // end
  // else
  //
  close;
end;

procedure Tfmeinstellung.BdevmgrClick(Sender: TObject);
begin
  // ShellExecute(Handle, PChar('open'), PChar('rundll32.exe'),PChar( 'shell32.dll,Control_RunDLL hdwwiz.cpl'),nil, SW_NORMAL);
  System32CPL(17);
end;

procedure Tfmeinstellung.BemaileinstellungClick(Sender: TObject);
begin
  Lemail.Style.TextColor := clBlue;
  Fmemaileinstellung.ShowModal;
end;

procedure Tfmeinstellung.BspeichernClick(Sender: TObject);
var
  c: integer;
begin

//  if (boolconfigdialog = false) then
//  begin
//    MessageDlg('Bei Auswahl von COM-Port.Sie müssen die Parametrisierung einstellen !!!', mtWarning, [mbOK], 0);
//    exit;
//  end;
  if (Etechnach.Text = 'Unbekannt') or (Etechnach.Text = '') then
  begin
    MessageDlg('Bitte Name eintragen!!!', mtWarning, [mbOK], 0);
    SHtechnikerinfo.Show;
    Etechnach.SetFocus;
    exit;
  end;

  if (Etechnr.Text = 'Unbekannt') or (Eemail.Text = '') then
  begin
    MessageDlg('Bitte Techniker ID eintragen!!!', mtWarning, [mbOK], 0);
    SHtechnikerinfo.Show;
    Etechnr.SetFocus;
    exit;
  end;

  if (Eemail.Text = 'Unbekannt@') or (Eemail.Text = '') then
  begin
    MessageDlg('Bitte Email Adresse eintragen!!!', mtWarning, [mbOK], 0);
    SHtechnikerinfo.Show;
    Eemail.SetFocus;
    exit;
  end;

  if (DmtoolLib.eMailIsValid(LowerCase(Eemail.Text)) = false) and (Eemail.Text <> '') then
  begin
    MessageDlg('Die Email Adresse ist ungültig!!!', mtError, [mbOK], 0);
    SHtechnikerinfo.Show;
    Eemail.SetFocus;
    exit;
  end;

  if (anderungBMZbool = true) and (LschnittstelleBMZ.Style.TextColor <> clBlue) then
  begin
    MessageDlg('BMZ Konfiguration unvollständig,ComPort Einstellung prüfen', mtWarning, [mbOK], 0);
    BconfigBMA.Click;

    exit
  end;

  if (anderungGSMbool = true) and (LschnittstelleGSM.Style.TextColor <> clBlue) then
  begin
    MessageDlg('GSM Konfiguration unvollständig,ComPort Einstellung prüfen', mtWarning, [mbOK], 0);
    bconfigGSM.Click;
    exit
  end;

  fmstart.CheckComPort;
  speicherbool := true;

  SetzeComEinstellungenBMZ;
  SetzeComEinstellungenSMS;
  fmstart.Ltechnr.Caption := Etechnr.Text;
  fmstart.Ltechname.Caption := Etechnach.Text;
  FmUebersicht.Etelephone.Text := Etechtelefone.Text;

  tblsetEinstellung.close;
  tblsetEinstellung.TableName := 'Einstellung';
  tblsetEinstellung.Open;
  if (tblsetEinstellung.RecordCount <> 0) then
    tblsetEinstellung.Edit
  else
    tblsetEinstellung.Append;

  tblsetEinstellung.Fieldbyname('TechnikerNachname').Asstring := Etechnach.Text;
  tblsetEinstellung.Fieldbyname('TechnikerVorname').Asstring := Etechvor.Text;
  tblsetEinstellung.Fieldbyname('TechnikerID').Asstring := Etechnr.Text;
  tblsetEinstellung.Fieldbyname('Tel_Nr').Asstring := Etechtelefone.Text;
  tblsetEinstellung.Fieldbyname('Temail').Asstring := Eemail.Text;

  tblsetEinstellung.Fieldbyname('BaudrateBMZ').AsInteger := iBaudRate;
  tblsetEinstellung.Fieldbyname('ParitätBMZ').Asstring := sParity;
  tblsetEinstellung.Fieldbyname('StoppbitBMZ').Asstring := sStoppBit;
  tblsetEinstellung.Fieldbyname('DatenbitBMZ').AsInteger := iDatenbits;
  tblsetEinstellung.Fieldbyname('ComportBMZ').Asstring := sComPortName;
  tblsetEinstellung.Fieldbyname('ComportnrBMZ').AsInteger := iComPort;
  tblsetEinstellung.Fieldbyname('BaudrateGSM').AsInteger := iBaudRate2;
  tblsetEinstellung.Fieldbyname('ParitätGSM').Asstring := sParity2;
  tblsetEinstellung.Fieldbyname('StoppbitGSM').Asstring := sStoppBit2;
  tblsetEinstellung.Fieldbyname('DatenbitGSM').AsInteger := iDatenbits2;
  tblsetEinstellung.Fieldbyname('ComportGSM').Asstring := sComPortName2;
  tblsetEinstellung.Fieldbyname('ComportnrGSM').AsInteger := iComPort2;
  tblsetEinstellung.Post;
  tblsetEinstellung.close;

  FmUebersicht.nrSetBMZCom.ComPortNo := iComPort;
  FmUebersicht.nrSetBMZCom.ByteSize := iDatenbits;
  FmUebersicht.nrSetBMZCom.BaudRate := iBaudRate;
  FmUebersicht.nrSetBMZCom.parity := nrSetBMZCom.parity;
  FmUebersicht.nrSetBMZCom.StopBits := nrSetBMZCom.StopBits;

  FmUebersicht.nrsetSmscom.ComPortNo := iComPort2;
  FmUebersicht.nrsetSmscom.ByteSize := iDatenbits2;
  FmUebersicht.nrsetSmscom.BaudRate := iBaudRate2;
  FmUebersicht.nrsetSmscom.parity := nrsetSmscom.parity;
  FmUebersicht.nrsetSmscom.StopBits := nrsetSmscom.StopBits;

  tblemaileinstellung.close;
  tblemaileinstellung.TableName := 'EmailEinstellung';
  tblemaileinstellung.Open;
  if tblemaileinstellung.RecordCount <> 0 then
    tblemaileinstellung.Edit
  else
    tblemaileinstellung.Append;

  tblemaileinstellung.Fieldbyname('Konto').Asstring := Ekonto.Text;
  tblemaileinstellung.Fieldbyname('SMTPserver').Asstring := ESmtpserver.Text;
  tblemaileinstellung.Fieldbyname('Benutzer').Asstring := Ebenutzer.Text;
  tblemaileinstellung.Fieldbyname('Kennwort').Asstring := Ekennwort.Text;
  tblemaileinstellung.Fieldbyname('Empfänger').Asstring := Eemail.Text;
  tblemaileinstellung.Post;
  tblemaileinstellung.close;
  beinstelclose := true;

  if (ShEmail.TabEnabled = true) and (anderungbool = true) then
    MessageDlg('Einstellungen Email wurden gespeichert.', mtInformation, [mbOK], 0)
  else if (anderungbool = true) then
    MessageDlg('Einstellungen wurden gespeichert.', mtInformation, [mbOK], 0);

  ImgPanaMed1.Left := 388;
  imgpanamed2.Left := 388;
  Imgpanamed3.Left := 388;
  ImgPanaMed1.Visible := true;
  imgpanamed2.Visible := true;
  Imgpanamed3.Visible := true;
  { Update Möglichkeit }

  // Kein Update
  if RB3.Checked then
    DmtoolLib.scheduleKeinUpdate('CloudWartung', DmtoolLib.strAppPfad + 'CWU.exe');
  // Jeden Tag um ...
  if RB2.Checked then
    DmtoolLib.ScheduleRunAtTime('CloudWartung', DmtoolLib.strAppPfad + 'CWU.exe');
  // Bei Anmeldung eines Benutzer
  if RB1.Checked then
    DmtoolLib.ScheduleRunlogon('CloudWartung', DmtoolLib.strAppPfad + 'CWU.exe');

  timer1.Interval := 1500;
  timer1.Enabled := true;

  DmtoolLib.DialogBoxAutoClose('Information', 'Bitte Warten... ', 1);

  JvFormStorage1.Active := true;

end;

procedure Tfmeinstellung.btnDetectClick(Sender: TObject);
var
  pPort: TCommPort;
  pBaudRate: TBaudRate;
  portnr: string;
begin
  FCancelDetect := false;
  if ZylGSM.DetectGSM(pPort, pBaudRate) then
  begin
    ShowMessage('Port = ' + ZylGSM.CommPortToString(pPort) + ' BaudRate = ' + IntToStr(ZylGSM.BaudRateToInt(pBaudRate)));
    sComPortName2 := ZylGSM.CommPortToString(pPort);
    iBaudRate2 := ZylGSM.BaudRateToInt(pBaudRate);
    portnr := Copy(sComPortName2, 4, length(sComPortName2));
    iComPort2 := strtoint(portnr);
    sParity2 := 'n';
    sStoppBit2 := '1';
    iDatenbits2 := 8;
    LschnittstelleGSM.Caption := 'Schnittstelle (' + IntToStr(iBaudRate2) + ', ' + IntToStr(iDatenbits2) + ', ' + sParity2 + ', ' + sStoppBit2 + ')';
    LschnittstelleGSM.Style.TextColor := clBlue;
    DevBoxGSM.ItemIndex := DevBoxGSM.Items.IndexOf(ZylGSM.CommPortToString(pPort));
    lstBaudRate.ItemIndex := lstBaudRate.Items.IndexOf(IntToStr(ZylGSM.BaudRateToInt(pBaudRate)));
    SetzeComPara2;
  end
  else
  begin
    ShowMessage('Keine GSM Schnittstelle gefunden');
  end;
  // if FmNEWPassword.Installbool = true then
  // begin
  // application.Terminate;
  // ShellExecute(Handle, 'open', pchar('CloudWartung.exe'), nil, nil, SW_SHOWNORMAL);
  // end;
end;

procedure Tfmeinstellung.bUpdateClick(Sender: TObject);
begin
  if ShellExecute(Application.Handle, 'open', PChar('UpdateNETBMA.exe'), nil, nil, SW_NORMAL) <= 32 then
    MessageDlg('Update zur Zeit nicht möglich', mtError, [mbOK], 0);
end;

// überprüfen, ob eine diese Datei ist benutzt ?
function IsFileInUse(FileName: TFileName): Boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not FileExists(FileName) then
    exit;
  HFileRes := CreateFile(PChar(FileName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

// ob ein file geoffnet ist
function IsFileOpened(const FileName: string): Boolean;
var
  FileHandle: integer;
begin
  Result := false;
  if FileExists(FileName) then
  begin
    FileHandle := FileOpen(FileName, fmShareExclusive);
    if FileHandle > 0 then
      FileClose(FileHandle)
    else
      Result := true;
  end;

end;

// delete ordner
function DelTree(DirName: string): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
  DirBuf: array [0 .. 255] of Char;
begin
  try
    Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0);
    Fillchar(DirBuf, Sizeof(DirBuf), 0);
    StrPCopy(DirBuf, DirName);
    with SHFileOpStruct do
    begin
      Wnd := 0;
      pFrom := @DirBuf;
      wFunc := FO_DELETE;
      fFlags := FOF_ALLOWUNDO;
      fFlags := fFlags or FOF_NOCONFIRMATION;
      fFlags := fFlags or FOF_SILENT;
    end;
    Result := (SHFileOperation(SHFileOpStruct) = 0);
  except
    Result := false;
  end;
end;

function StopProcess(ExeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
      (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function IsExeRunning(const AExeName: string): Boolean;
var
  h: THandle;
  p: TProcessEntry32;
begin
  Result := false;
  p.dwSize := Sizeof(p);
  h := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    Process32First(h, p);
    repeat
      Result := AnsiUpperCase(AExeName) = AnsiUpperCase(p.szExeFile);
    until Result or (not Process32Next(h, p));
  finally
    CloseHandle(h);
  end;

end;

function KillTask(ExeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      // UpperCase function creates a copy of MixedString with all letters converted to upper case.
      UpperCase(ExeFileName))) then
      Result := integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfmeinstellung.BcheckversionClick(Sender: TObject);
var
  i: integer;
  dir: string;
  searchResult: TSearchRec;
  myFile: TextFile;
  Text: string;
  Txt: TextFile;
  s: string;
  AllText: string;

begin

  KillTask(DmtoolLib.strAppPfad + 'Updatecheck');
  // if not (DirectoryExists(dir)) then DelTree('Update');

  dir := ExtractFilePath(ParamStr(0)) + 'Updatecheck\';

  try // find all files in read_ftp folder and delete all
    begin
      FindFirst(dir + '\*.*', faAnyFile, searchResult);
      DeleteFile(dir + '\' + searchResult.Name);
      while FindNext(searchResult) = 0 do
      begin
        DeleteFile(dir + '\' + searchResult.Name);
      end;
      FindClose(searchResult);
      rmdir(dir);
    end;
  except
    // delphi is my power?
  end;

  if not(DirectoryExists(dir)) then // if folder not found, create it :)
  begin
    CreateDir(dir);
  end;

  ChDir(dir);

  try // connect and download files from FTP
    begin
      IdFTP1.Connect;
      IdFTP1.ChangeDir('/Update/');
      IdFTP1.List('*.txt', true);

      for i := 0 to IdFTP1.DirectoryListing.Count - 1 do
      begin
        IdFTP1.Get(IdFTP1.DirectoryListing.Items[i].FileName, IdFTP1.DirectoryListing.Items[i].FileName, false, false);
      end;
      IdFTP1.Disconnect;
      IdFTP1.Free;
    end;
  except
    // delphi is my power?
  end;

  AllText := '';;
  // if not (DirectoryExists(dir+ 'Update2.txt')) then exit;
  Assignfile(Txt, dir + 'Update2.txt');

  // DeleteFiles(ExtractFilePath(ParamStr(0)),'*.txt');
  Reset(Txt);
  while not Eof(Txt) do
  begin
    Readln(Txt, s);
    AllText := AllText + s;
    Lcheckversion.Caption := s;
  end;

  Lcheckversion.Visible := true;
  CloseFile(Txt);
  // RemoveDir('Update')    ;
  StopProcess('Update');
  if IsExeRunning('Update') then
    ShowMessage('hallo1');
  if IsFileInUse(dir + 'Update2.txt') then
    ShowMessage('Hallo2');

  // Write out all content as a single string.



  // DeleteDirectory('Update');

end;

procedure Tfmeinstellung.bsuchGSMClick(Sender: TObject);
var
  pPort: TCommPort;
  pBaudRate: TBaudRate;
  portnr: string;
begin
  Babsuch.Visible := true;
  bsuchGSM.Enabled := false;
  Pbarsuch.Visible := true;
  Pbarsuch.Animate := true;
  FCancelDetect := false;
  GBautoGSMsuch.Cursor := crHourGlass;
  fmeinstellung.Cursor := crHourGlass;
  if ZylGSM.DetectGSM(pPort, pBaudRate) then
  begin
    ShowMessage('Port = ' + ZylGSM.CommPortToString(pPort) + ' BaudRate = ' + IntToStr(ZylGSM.BaudRateToInt(pBaudRate)));

    sComPortName2 := ZylGSM.CommPortToString(pPort);
    iBaudRate2 := ZylGSM.BaudRateToInt(pBaudRate);
    portnr := Copy(sComPortName2, 4, length(sComPortName2));
    iComPort2 := strtoint(portnr);
    sParity2 := 'n';
    sStoppBit2 := '1';
    iDatenbits2 := 8;

    LschnittstelleGSM.Caption := 'Schnittstelle (' + IntToStr(iBaudRate2) + ', ' + IntToStr(iDatenbits2) + ', ' + sParity2 + ', ' + sStoppBit2 + ')';
    LschnittstelleGSM.Style.TextColor := clBlue;
    DevBoxGSM.ItemIndex := DevBoxGSM.Items.IndexOf(ZylGSM.CommPortToString(pPort));
    lstBaudRate.ItemIndex := lstBaudRate.Items.IndexOf(IntToStr(ZylGSM.BaudRateToInt(pBaudRate)));
    SetzeComPara2;
    Pbarsuch.Visible := false;
    Pbarsuch.Animate := false;
    bsuchGSM.Enabled := true;
    fmeinstellung.Cursor := crDefault;
    Babsuch.Visible := true;
    GBautoGSMsuch.Cursor := crDefault;
  end
  else
  begin

    Pbarsuch.Visible := false;
    Pbarsuch.Animate := false;
    fmeinstellung.Cursor := crDefault;
    LsuchGSM.Caption := 'GSM Port nicht gefunden !!! ';
    // ShowMessage('GSM nicht gefunden');
    DmtoolLib.DialogBoxAutoClose('Fehler', 'GSM nicht gefunden', 2);
    bsuchGSM.Enabled := true;
    Babsuch.Visible := false;
    GBautoGSMsuch.Cursor := crDefault;
  end;
end;

procedure Tfmeinstellung.bconfigGSMClick(Sender: TObject);
begin
  nrsetSmscom.ConfigDialog;
  SetzeComEinstellungenSMS;
  LschnittstelleGSM.Visible := true;
  LschnittstelleGSM.Style.TextColor := clBlue;
end;

procedure Tfmeinstellung.bdeleteClick(Sender: TObject);
var
  OLDNAME, NEWNAME: string;
begin
  // SetCurrentDir('Update');
  // if DelTree('Update') then ShowMessage('ordner gelöscht') else ShowMessage('Ordner nicht gelöscht');
  // DeleteFiles(ExtractFilePath(ParamStr(0)),'*.txt');

  // change folder name
  // oldName := 'Update';
  // newName := ChangeFileExt(oldName, 'lala');
  // RenameFile(oldName, newName);

  DmtoolLib.DeleteFiles('temp', 'ABMA-MUSTER_12345.pdf');

end;

procedure Tfmeinstellung.BabsuchClick(Sender: TObject);
var
  pPort: TCommPort;
  pBaudRate: TBaudRate;
begin
  FCancelDetect := true;
end;

procedure Tfmeinstellung.BconfigBMAClick(Sender: TObject);
begin
  nrSetBMZCom.Active := true;
  nrSetBMZCom.Active := false;
  if ((comerror = 1) or (comerror = 2)) and (FmUebersicht.uebersichtbool = false) then
  begin
    comerror := 0;
    exit;
  end;

  nrSetBMZCom.ConfigDialog;
  SetzeComEinstellungenBMZ;
  LschnittstelleBMZ.Visible := true;
  LschnittstelleBMZ.Style.TextColor := clBlue;
  boolconfigdialog := true;
end;

procedure Tfmeinstellung.EbenutzerEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EbenutzerPropertiesChange(Sender: TObject);
begin
  if (pos('@', Ehauptempf.Text) <> 0) and (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '')
    and (Ekennwort.Text <> '') and (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EemailEnter(Sender: TObject);
begin
  if Eemail.Text = 'Unbekannt@' then
    Eemail.Clear;
end;

procedure Tfmeinstellung.EemailKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  snach: string;
begin
  Ehauptempf.Text := Eemail.Text;
  if (Shift = [ssCtrl]) and (Key = ord('C')) then
  begin
    Eemail.Properties.Alignment.Horz := TAlignment(0);
    ShowMessage('Text kopieren');
    Clipboard.AsText := Eemail.SelText;
  end

  else if (Shift = [ssCtrl]) and (Key = ord('X')) then
  begin

    Clipboard.AsText := Eemail.SelText;
    snach := Eemail.Text;
    Delete(snach, Eemail.SelStart + 1, Eemail.SelLength);
    Eemail.Text := snach
  end
  else if (Shift = [ssCtrl]) and (Key = ord('A')) then
    Eemail.SelectAll
  else if (Shift = [ssCtrl]) and (Key = ord('V')) then
  begin
    Eemail.Properties.Alignment.Horz := TAlignment(2);
    snach := Eemail.Text;
    Eemail.Clear;
    ShowMessage('Text einfügen');
    Insert(Clipboard.AsText, snach, Eemail.SelStart + 1);

  end;

end;

procedure Tfmeinstellung.EemailPropertiesChange(Sender: TObject);
begin
  if (pos('@', Eemail.Text) <> 0) and ((Etechnach.Text) <> '') and ((Etechnr.Text) <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EhauptempfEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EhauptempfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Eemail.Text := Ehauptempf.Text;
end;

procedure Tfmeinstellung.EhauptempfPropertiesChange(Sender: TObject);
begin
  if (pos('@', Ehauptempf.Text) <> 0) and (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '')
    and (Ekennwort.Text <> '') and (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EkennwortEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EkennwortPropertiesChange(Sender: TObject);
begin
  if (pos('@', Ehauptempf.Text) <> 0) and (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '')
    and (Ekennwort.Text <> '') and (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EkontoEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EkontoPropertiesChange(Sender: TObject);
begin
  if (pos('@', Ehauptempf.Text) <> 0) and (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '')
    and (Ekennwort.Text <> '') and (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.ESmtpserverEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.ESmtpserverPropertiesChange(Sender: TObject);
begin
  if (pos('@', Ehauptempf.Text) <> 0) and (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '')
    and (Ekennwort.Text <> '') and (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EtechnachEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EtechnachEnter(Sender: TObject);
begin
  if Etechnach.Text = 'Unbekannt' then
    Etechnach.Clear;

end;

function Tfmeinstellung.CtrlDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Control] And 128) <> 0);
end;

procedure Tfmeinstellung.EtechnachKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  snach: string;

begin

  if (Shift = [ssCtrl]) and (Key = ord('C')) then
  begin
    Etechnach.Properties.Alignment.Horz := TAlignment(0);
    ShowMessage('Text kopieren');
    Clipboard.AsText := Etechnach.SelText;
  end

  else if (Shift = [ssCtrl]) and (Key = ord('X')) then
  begin

    Clipboard.AsText := Etechnach.SelText;
    snach := Etechnach.Text;
    Delete(snach, Etechnach.SelStart + 1, Etechnach.SelLength);
    Etechnach.Text := snach
  end
  else if (Shift = [ssCtrl]) and (Key = ord('A')) then
    Etechnach.SelectAll
  else if (Shift = [ssCtrl]) and (Key = ord('V')) then
  begin
    Etechnach.Properties.Alignment.Horz := TAlignment(2);
    snach := Etechnach.Text;
    Etechnach.Clear;
    ShowMessage('Text einfügen');
    Insert(Clipboard.AsText, snach, Etechnach.SelStart + 1);

  end
end;

procedure Tfmeinstellung.EtechnachKeyPress(Sender: TObject; var Key: Char);

const
  Backspace = #8;
  Enter = #13;
  AllowKeys: set of Char = ['A' .. 'Z', 'a' .. 'z', 'ä', 'ö', 'ü', 'Ä', 'Ö', 'Ü', Backspace, Enter];
var
  snach: string;
begin
  // if Key = '.' then Key := FormatSettings.DecimalSeparator;
  if not((Key in AllowKeys) or (Key = FormatSettings.DecimalSeparator) and (pos(Key, Etechnr.Text) = 0)) then
  begin
    if (CtrlDown = true) then
    begin

    end
    else
    begin
      ShowMessage('Ungültiges Zeichen : ' + Key);
      Key := #0;
    end;

  end
  else
  begin

  end;
end;

procedure Tfmeinstellung.EtechnachPropertiesChange(Sender: TObject);
begin
  if (pos('@', Eemail.Text) <> 0) and ((Etechnach.Text) <> '') and ((Etechnr.Text) <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EtechnrEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EtechnrEnter(Sender: TObject);
begin
  if Etechnr.Text = 'Unbekannt' then
    Etechnr.Clear;
end;

procedure Tfmeinstellung.EtechnrExit(Sender: TObject);
begin
  if length(Etechnr.Text) < 4 then
  begin
    ShowMessage('ID müssen mindestens 4 Zeichen ');
    Etechnr.SetFocus;
  end;

end;

procedure Tfmeinstellung.EtechnrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

const
  Backspace = #8;
  Enter = #13;
  AllowKeys: set of Char = ['0' .. '9', Backspace, Enter, 'A' .. 'Z', 'a' .. 'z'];
var
  snach: string;
  i: integer;

begin

  if (Shift = [ssCtrl]) and (Key = ord('C')) then
  begin
    Etechnr.Properties.Alignment.Horz := TAlignment(0);
    ShowMessage('Text kopieren');
    Clipboard.AsText := Etechnr.SelText;
  end

  else if (Shift = [ssCtrl]) and (Key = ord('X')) then
  begin

    Clipboard.AsText := Etechnr.SelText;
    snach := Etechnr.Text;
    Delete(snach, Etechnr.SelStart + 1, Etechnr.SelLength);
    Etechnr.Text := snach
  end
  else if (Shift = [ssCtrl]) and (Key = ord('A')) then
    Etechnr.SelectAll
  else if (Shift = [ssCtrl]) and (Key = ord('V')) then
  begin
    Etechnr.Properties.Alignment.Horz := TAlignment(2);
    snach := Etechnr.Text;
    Etechnr.Clear;
    Insert(Clipboard.AsText, snach, Etechnr.SelStart + 1);
    ShowMessage('Text einfügen');
    for i := 0 to snach.length - 1 do
    begin
      if snach[i] In AllowKeys then
      begin
        ShowMessage('Ungültiges Zeichen : ' + snach[i]);
        Etechnr.Clear;
        exit
      end;
    end;
    if length(Etechnr.Text) < 4 then
    begin
      ShowMessage('ID müssen mindestens 4 Zeichen ');
      Etechnr.SetFocus;
    end;

  end;
end;

procedure Tfmeinstellung.EtechnrKeyPress(Sender: TObject; var Key: Char);
const
  Backspace = #8;
  Enter = #13;
  AllowKeys: set of Char = ['0' .. '9', Backspace, Enter, 'A' .. 'Z', 'a' .. 'z'];
begin
  // if Key = '.' then Key := FormatSettings.DecimalSeparator;
  if not((Key in AllowKeys) or (Key = FormatSettings.DecimalSeparator) and (pos(Key, Etechnr.Text) = 0)) then
  begin
    if (CtrlDown = true) then
    begin

    end
    else
    begin
      ShowMessage('Ungültiges Zeichen : ' + Key);
      Key := #0;
    end;

  end
  else
  begin

  end;
end;

procedure Tfmeinstellung.EtechnrPropertiesChange(Sender: TObject);
var
  s: string;
begin
  s := Etechnr.Text;

  if s.length = 4 then
    Etechnr.Style.Color := clGreen
  else
    if (s.length < 4) or (s.Length>4) then
    Etechnr.Style.Color := RGB(218, 41, 28);
  // Etechnr.Style.Color := RGB(249, 249, 249);
  if (s.length > 0) and (s.length <= 4) then
  begin
    Etechnr.StyleElements := [seBorder];

  end
  else
  begin
    Etechnr.Style.Color := clWindow;
    Etechnr.StyleElements := [seFont, seClient, seBorder];

  end;

  if (pos('@', Eemail.Text) <> 0) and ((Etechnach.Text) <> '') and ((Etechnr.Text) <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
end;

procedure Tfmeinstellung.EtechtelefoneEditing(Sender: TObject; var CanEdit: Boolean);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.EtechtelefoneEnter(Sender: TObject);
begin
  if Etechtelefone.Text = 'Unbekannt' then
    Etechtelefone.Clear;
end;

procedure Tfmeinstellung.EtechtelefoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  snach: string;

begin

  if (Shift = [ssCtrl]) and (Key = ord('C')) then
  begin
    Etechtelefone.Properties.Alignment.Horz := TAlignment(0);
    ShowMessage('Text kopieren');
    Clipboard.AsText := Etechtelefone.SelText;
  end

  else if (Shift = [ssCtrl]) and (Key = ord('X')) then
  begin

    Clipboard.AsText := Etechtelefone.SelText;
    snach := Etechtelefone.Text;
    Delete(snach, Etechtelefone.SelStart + 1, Etechtelefone.SelLength);
    Etechtelefone.Text := snach
  end
  else if (Shift = [ssCtrl]) and (Key = ord('A')) then
    Etechtelefone.SelectAll
  else if (Shift = [ssCtrl]) and (Key = ord('V')) then
  begin
    Etechtelefone.Properties.Alignment.Horz := TAlignment(2);
    snach := Etechtelefone.Text;
    Etechtelefone.Clear;
    ShowMessage('Text einfügen');
    Insert(Clipboard.AsText, snach, Etechtelefone.SelStart + 1);

  end;
end;

procedure Tfmeinstellung.EtechtelefoneKeyPress(Sender: TObject; var Key: Char);
const
  Backspace = #8;
  Enter = #13;
  AllowKeys: set of Char = ['0' .. '9', '/', '-', Backspace, Enter];
begin
  // if Key = '.' then Key := FormatSettings.DecimalSeparator;
  if not((Key in AllowKeys) or (Key = FormatSettings.DecimalSeparator) and (pos(Key, Etechnr.Text) = 0)) then
  begin
    if (CtrlDown = true) then
    begin

    end
    else
    begin
      ShowMessage('Ungültiges Zeichen : ' + Key);
      Key := #0;
    end;

  end
  else
  begin

  end;
end;

procedure Tfmeinstellung.EtechvorEnter(Sender: TObject);
begin
  if Etechvor.Text = 'Unbekannt' then
    Etechvor.Clear;
end;

procedure Tfmeinstellung.EtechvorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  snach: string;

begin

  if (Shift = [ssCtrl]) and (Key = ord('C')) then
  begin
    Etechvor.Properties.Alignment.Horz := TAlignment(0);
    ShowMessage('Text kopieren');
    Clipboard.AsText := Etechvor.SelText;
  end

  else if (Shift = [ssCtrl]) and (Key = ord('X')) then
  begin

    Clipboard.AsText := Etechvor.SelText;
    snach := Etechvor.Text;
    Delete(snach, Etechvor.SelStart + 1, Etechvor.SelLength);
    Etechvor.Text := snach
  end
  else if (Shift = [ssCtrl]) and (Key = ord('A')) then
    Etechvor.SelectAll
  else if (Shift = [ssCtrl]) and (Key = ord('V')) then
  begin
    Etechvor.Properties.Alignment.Horz := TAlignment(2);
    snach := Etechvor.Text;
    Etechvor.Clear;
    ShowMessage('Text einfügen');
    Insert(Clipboard.AsText, snach, Etechvor.SelStart + 1);

  end;
end;

procedure Tfmeinstellung.EtechvorKeyPress(Sender: TObject; var Key: Char);
const
  Backspace = #8;
  Enter = #13;
  AllowKeys: set of Char = ['A' .. 'Z', 'a' .. 'z', Backspace, Enter, 'ä', 'ö', 'ü', 'Ä', 'Ö', 'Ü'];
begin
  // if Key = '.' then Key := FormatSettings.DecimalSeparator;
  if not((Key in AllowKeys) or (Key = FormatSettings.DecimalSeparator) and (pos(Key, Etechnr.Text) = 0)) then
  begin
    if (CtrlDown = true) then
    begin

    end
    else
    begin
      ShowMessage('Ungültiges Zeichen : ' + Key);
      Key := #0;
    end;

  end
  else
  begin

  end;
end;

procedure Tfmeinstellung.FormActivate(Sender: TObject);
begin
  JvFormStorage1.Active := false;
end;

procedure Tfmeinstellung.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fmanlagenr.backbool := true;
  fmstart.Cursor := crDefault;
  if comerror <> 1 then
  begin
    if FmUebersicht.Visible = false then
      fmstart.Show
  end
  else
    comerror := 0;
  if ((anderungbool = true) and (beinstelclose = false)) then
  begin
    if MessageDlg('Änderungen speichern ?', mtWarning, [mbYes, mbNo], 0) = mryes then
    begin
      if { (BaudRate <> 0) and (DevboxBMZ.ItemIndex<>-1)and }
        (pos('@', Eemail.Text) <> 0) and ((Etechnach.Text) <> '') and ((Etechnr.Text) <> '') and (pos('@', Ehauptempf.Text) <> 0) and
        (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '') and (Ekennwort.Text <> '') and
        (Ehauptempf.Text <> '') then
      begin
        Bspeichern.Click;
        JvFormStorage1.Active := true;
        close;
      end
      else
        MessageDlg('Alle Pflichtfelder müssen ausgefüllt werden', mtWarning, [mbOK], 0);
    end
    else
    begin
      close;
      JvFormStorage1.Active := false;

    end;
  end
  else
    close;

  // with fmeinstellung do
  // fmtoollib.PlayResSound('SOUND6',SND_aSYNC)  ;
  // animatewindow(handle,400,aw_center or aw_hide );
  timer1.Enabled := false;
  ShEmail.Show;
  ShComports.Show;
  SHtechnikerinfo.Show;
  ShEmail.TabEnabled := false;
  Fmstart.CheckComPort;
end;

procedure Tfmeinstellung.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((ssAlt in Shift) and (Key = $45)) then
  begin
    ShEmail.TabEnabled := true;
    DmtoolLib.PlayResSound('SOUND1', SND_SYNC);
  end;

end;

procedure Tfmeinstellung.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (Bspeichern.Enabled = true) then
  begin
    Bspeichern.Click;
  end;
end;

procedure Tfmeinstellung.FormShow(Sender: TObject);
var
  Datei: file of TFelddaten;
  datensatz: TFelddaten;
begin
  ShEmail.PageIndex := Peinstellung.PageCount - 1; // einstellung
  Fmanlagenr.backbool := false;
  if FmNewPassword.Visible = false then
    fmstart.Hide;
  boolconfigdialog := true;
  anderungBMZbool := false;
  anderungGSMbool := false;

  speicherbool := false;
  timerbool := false;
  SHtechnikerinfo.Show;

  timer1.Interval := 1000;
  timer1.Enabled := true;
  GbTechinfo.Clear;
  GbCominfo.Clear;
  GBemail.Clear;
  // Pana-Med Symbole
  ImgPanaMed1.Visible := true;
  imgpanamed2.Visible := true;
  Imgpanamed3.Visible := true;

  beinstelclose := false;
  anderungbool := false;
  tblsetEinstellung.Open;
  if comerror = 1 then
    ShComports.Show;

  fmeinstellung.SetzecomBMZGSM; // Setz die Einstellung von BMZ und GSM ein.

  setzeComPara;
  SetzeComPara2;
  if (iBaudRate = 0) OR (DevboxBMZ.ItemIndex = -1) then
    LschnittstelleBMZ.Visible := false
  else
    LschnittstelleBMZ.Visible := true;
  if (iBaudRate2 = 0) OR (DevBoxGSM.ItemIndex = -1) then
    LschnittstelleGSM.Visible := false
  else
    LschnittstelleGSM.Visible := true;
  beinstelclose := false;
  // Fmeinstellung.scale(fmeinstellung,DevboxBMZ,DevBoxGSM,Etechnr,Etechname,Etechtelefone,Babbrechnen,Bspeichern,bconfigBMA,bconfigGSM,GbCominfo,GbTechinfo);

  if tblsetEinstellung.RecordCount = 0 then
  begin
    tblsetEinstellung.Append;
    tblsetEinstellung.Fieldbyname('TechnikerNachname').Asstring := 'Unbekannt';
    tblsetEinstellung.Fieldbyname('TechnikerVorname').Asstring := 'Unbekannt';
    tblsetEinstellung.Fieldbyname('TechnikerID').Asstring := 'Unbekannt';
    tblsetEinstellung.Fieldbyname('Tel_Nr').Asstring := 'Unbekannt';
    tblsetEinstellung.Fieldbyname('Temail').Asstring := 'Unbekannt@';
    tblsetEinstellung.Fieldbyname('Pdfpfad').Asstring := 'Unbekannt';
    tblsetEinstellung.Post;
  end;
  Etechnr.Text := tblsetEinstellungTechnikerID.Asstring;
  Etechnach.Text := tblsetEinstellungTechnikerNachname.Asstring;
  Etechvor.Text := tblsetEinstellungTechnikerVorname.Asstring;
  Etechtelefone.Text := tblsetEinstellungTel_Nr.Asstring;
  Eemail.Text := tblsetEinstellungTemail.Asstring;
  tblemaileinstellung.Open;
  if tblemaileinstellung.RecordCount = 0 then
  begin
    tblemaileinstellung.Append;
    tblemaileinstellung.Fieldbyname('Konto').Asstring := 'wartungstool@pana-med.de';
    tblemaileinstellung.Fieldbyname('SMTPserver').Asstring := 'mail.pana-med.de';
    tblemaileinstellung.Fieldbyname('Benutzer').Asstring := 'wartungstool';
    tblemaileinstellung.Fieldbyname('Kennwort').Asstring := 'jaNerud';
    tblemaileinstellung.Fieldbyname('Empfänger').Asstring := 'Unbekannt@';
    tblemaileinstellung.Post;
  end;

  Ekonto.Text := tblemaileinstellungKonto.Asstring;
  ESmtpserver.Text := tblemaileinstellungSMTPserver.Asstring;
  Ebenutzer.Text := tblemaileinstellungBenutzer.Asstring;
  Ekennwort.Text := tblemaileinstellungkennwort.Asstring;
  Ehauptempf.Text := tblemaileinstellungEmpfänger.Asstring;
  fmeinstellung.Lsoftversion.Caption := fmstart.Stbarversion.Panels[0].Text;
end;

procedure Tfmeinstellung.nrSetBMZComFatalError(Sender: TObject; ErrorCode, Detail: Cardinal; ErrorMsg: string; var RaiseException: Boolean);
begin
  if (ErrorCode = 1) and (Detail = 0) then
  begin

    if pos('Das System kann die angegebene Datei nicht finden', ErrorMsg) <> 0 then
    begin
      RaiseException := false;
      fmeinstellung.comerror := 1;
      if MessageDlg('Sie habe  kein Com-Port gewählt !!!', mtError, [mbOK], 0) = mrOk then
        exit;
    end;

    if pos('Zugriff verweigert', ErrorMsg) <> 0 then
    begin
      RaiseException := false;
      fmeinstellung.comerror := 2;
      if MessageDlg('die gewählte Com-Port ist nicht frei !!!', mtError, [mbOK], 0) = mrOk then
        exit;
    end;

  end;

end;

procedure Tfmeinstellung.RB1Click(Sender: TObject);
begin
  with RB1 do
  begin
    TEdtZeit.Enabled := false;
    if (not Checked) or (intradio = 1) then
    begin
      anderungbool := false;

    end

    else if (intradio <> 1) then
      anderungbool := true;
  end;
end;

procedure Tfmeinstellung.RB2Click(Sender: TObject);
begin
  with RB2 do
  begin
    TEdtZeit.Enabled := true;
    if (not Checked) or (intradio = 2) then
    begin
      anderungbool := false;

    end
    else if (intradio <> 2) then
      anderungbool := true;
  end;

end;

procedure Tfmeinstellung.timer1Timer(Sender: TObject);
var
  i: integer;

begin

  if { (BaudRate <> 0) and (DevboxBMZ.ItemIndex<>-1)and }
    (pos('@', Eemail.Text) <> 0) and ((Etechnach.Text) <> '') and ((Etechnr.Text) <> '') and (pos('@', Ehauptempf.Text) <> 0) and
    (pos('@', Ekonto.Text) <> 0) and (Ekonto.Text <> '') and (ESmtpserver.Text <> '') and (Ebenutzer.Text <> '') and (Ekennwort.Text <> '') and
    (Ehauptempf.Text <> '') then
    Bspeichern.Enabled := true
  else
    Bspeichern.Enabled := false;
  timerbool := false;
  if timer1.Interval = 1500 then
  begin

    GbTechinfo.Clear;
    GbCominfo.Clear;
    GBemail.Clear;

    ImgPanaMed1.Visible := true;
    imgpanamed2.Visible := true;
    Imgpanamed3.Visible := true;
    if speicherbool = true then
      DmtoolLib.PlayResSound('SOUND17', SND_aSYNC);
    for i := 0 to 3 do
    begin
      ImgPanaMed1.Left := (ImgPanaMed1.Left) - 90;
      imgpanamed2.Left := (imgpanamed2.Left) - 90;
      Imgpanamed3.Left := (Imgpanamed3.Left) - 90;
    end;

    timer1.Interval := 1000;
  end
  else if timer1.Interval = 1000 then

  begin
    ImgPanaMed1.Visible := true;
    imgpanamed2.Visible := true;
    Imgpanamed3.Visible := true;
    if speicherbool = false then
      DmtoolLib.PlayResSound('SOUND5', SND_aSYNC);
    sleep(350);
    for i := 0 to 3 do
    begin
      ImgPanaMed1.Left := (ImgPanaMed1.Left) + 90;
      imgpanamed2.Left := (imgpanamed2.Left) + 90;
      Imgpanamed3.Left := (Imgpanamed3.Left) + 90;

    end;
    timer1.Interval := 0;
    i := 0;
    GbTechinfo.Clear;
    GbCominfo.Clear;;
    GBemail.Clear;

    if (speicherbool = true) then
    begin
      timer1.Enabled := false;
      close;

    end;

  end;

end;

procedure Tfmeinstellung.StatusPort;
var
  // Integer-Deklarationen
  xBmz: integer;
  xSmS: integer;
  // String-Deklarationen
  shilf: string;

begin
  nrSetBMZCom.Update;
  nrsetSmscom.Update;
  xBmz := nrSetBMZCom.GetDeviceIndex;
  xSmS := nrsetSmscom.GetDeviceIndex;
  if (xBmz = -1) and (xSmS <> -1) then
  begin
    LschnittstelleBMZ.Caption := '``ComPort BMZ Schnittestelle´´ Eingang : nicht Vorhanden ';
    LschnittstelleBMZ.Style.TextColor := clRed;
    LschnittstelleBMZ.Visible := true;
    MessageDlg('Der Com-Port für die Verbindung mit der Zentrale ist nicht vorhanden.' + Char(13) +
      'Bitte Überprüfen sie ,ob sie mit dem Gerät richtig verbunden sind.', mtWarning, [mbOK], 4);
  end;

  if (xSmS = -1) and (xBmz <> -1) then
  begin

    LschnittstelleGSM.Caption := '``SMS´´ Eingang : "ComPort" nicht Vorhand';
    LschnittstelleGSM.Style.TextColor := clRed;
    LschnittstelleGSM.Visible := true;

    MessageDlg('Der Com-Port Für``SMS´´Sendung ist nicht vorhanden.' + Char(13) +
      'Bitte Überprüfen sie ,ob sie mit dem Gerät richtig verbunden sind.', mtWarning, [mbOK], 4);
  end;

  if (xSmS = -1) and (xBmz = -1) then
  begin
    LschnittstelleGSM.Caption := '``SMS´´ Eingang : "Com-Port" nicht Vorhanden';
    LschnittstelleBMZ.Caption := '``BMZ´´ Eingang : "Com-Port" nicht Vorhanden ';

    LschnittstelleGSM.Style.TextColor := clRed;
    LschnittstelleBMZ.Style.TextColor := clRed;
    LschnittstelleGSM.Visible := true;
    LschnittstelleBMZ.Visible := true;
    // MessageDlg('Keine ComPort sind Vorhand...!!!'+char(13)+
    // 'Bitte Überprüfen Sie ,Ob sie mit Richtig verbunden sind.', mtWarning, [mbOK], 4);

  end;

end;

procedure Tfmeinstellung.TEdtZeitPropertiesChange(Sender: TObject);
begin
  anderungbool := true;
end;

procedure Tfmeinstellung.ZylGSMConnect(Sender: TObject; Port: TCommPort);
var
  d: integer;
begin

end;

procedure Tfmeinstellung.ZylGSMDetect(Sender: TObject; const Port: TCommPort; const BaudRate: TBaudRate; var Cancel: Boolean);
begin
  LsuchGSM.Caption := 'Suche auf ' + ZylGSM.CommPortToString(Port) + ' BaudRate : ' + IntToStr(ZylGSM.BaudRateToInt(BaudRate));
  Cancel := FCancelDetect;
end;

procedure Tfmeinstellung.scale(F: TForm; devbox1, devbox2: TnrDeviceBox; edt1, edt2, edt3: TcxTextEdit; bt1, Bt2: TcxButton;
  bconfig1, bconfig2: TcxButton; Gbox1, Gbox2: TcxGroupBox);

begin
  F.Height := 480;
  F.Width := 480;

  devbox1.Height := 21;
  devbox1.Width := 220;

  devbox2.Height := 21;
  devbox2.Width := 220;

  edt1.Width := 220;
  edt1.Height := 21;

  edt2.Width := 220;
  edt2.Height := 21;

  edt3.Width := 220;
  edt3.Height := 21;

  bt1.Height := 27;
  bt1.Width := 120;

  Bt2.Height := 27;
  Bt2.Width := 120;

  bconfig1.Height := 21;
  bconfig1.Width := 42;
  bconfig1.Top := 28;
  bconfig1.Left := 352;

  bconfig2.Height := 21;
  bconfig2.Width := 42;

  Gbox1.Height := 160;
  Gbox1.Width := 410;

  Gbox2.Height := 160;
  Gbox2.Width := 410;

end;

procedure Tfmeinstellung.DevboxBMZChange(Sender: TObject);
begin
  boolconfigdialog := false;
  anderungbool := true;
  anderungBMZbool := true;
end;

procedure Tfmeinstellung.DevBoxGSMChange(Sender: TObject);
begin
  anderungbool := true;
  anderungGSMbool := true;
end;

begin
  anderungbool := false;

end.
