{ ============================================
  Software Name : 	SaveMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ShellApi,
  uColors;

const

  // Display Mode
  nDISPMODE_NORMAL  = 1;
  nDISPMODE_SPLASH  = 2;

type
  TFrmAboutSplash = class(TForm)
    Panel: TPanel;
    //
    LabelProgName: TLabel;
    LabelVersion: TLabel;
    LabelDates: TLabel;
    LabelDevName: TLabel;
    labelAuthorName: TLabel;
    LabelProgDescription: TLabel;
    PanelBande: TPanel;
    //
    TimerEffect: TTimer;
    SpeedButtonQuit: TSpeedButton;
    ImageLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(const Sender: TObject);
    procedure TimerEffectTimer(const Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseClick(Sender: TObject);
  private
    nFormDisp : integer;
  public
  end;


procedure AboutSplashBox (sProg,
                          sDescr,
                          sDev,
                          sAuthor,
                          sVer,
                          sDates,
                          sEmail,
                          sEobj: String;
                    const bmpLogo: TBitmap;
                    const nDispMode,
                          nDelay: integer);

var
  FrmAboutSplash: TFrmAboutSplash;

implementation

{$R *.dfm}

uses
  Main;



procedure AboutSplashBox (sProg, sDescr, sDev, sAuthor, sVer, sDates, sEmail, sEobj: String;
                          const bmpLogo: TBitmap; const nDispMode, nDelay: integer);
begin
  if FrmAboutSplash = nil then
    FrmAboutSplash := TFrmAboutSplash.Create(FrmMain);
//    Application.CreateForm(TFrmAboutSplash, FrmAboutSplash);
  with FrmAboutSplash do begin
    nFormDisp := nDispMode;
    LabelProgName.Caption := sProg;
    LabelProgDescription.Caption := sDescr;
    LabelDevName.Caption  := sDev;
    labelAuthorName.Caption := sAuthor;
    LabelVersion.Caption := sVer;
    LabelDates.Caption := sDates;
    ImageLogo.Picture.Bitmap := bmpLogo;
//    ImageLogo.Picture.Bitmap.Transparent := TRUE;
//    ImageLogo.Picture.Bitmap.TransparentColor := Colors.ColorsList.clLightBlack;
//    ImageLogo.Picture.Bitmap.TransparentColor := clWhite;
//    ImageLogo.Picture.Bitmap.TransparentMode := tmFixed;
  end;

  FrmAboutSplash.SpeedButtonQuit.Visible := TRUE;
  if nDispMode = nDISPMODE_SPLASH then begin
    with FrmAboutSplash, TimerEffect do begin
      SpeedButtonQuit.Visible := FALSE;
      ClientHeight := Panel.Height + (2 * Panel.Top);
      if nDelay > 0 then begin
        Interval := nDelay;
        Enabled := TRUE;
      end;
    end;
  end;

  if nDelay > 0 then begin

    FrmAboutSplash.ShowModal;

    if FrmAboutSplash <> nil then begin
      FrmAboutSplash.Free;
      FrmAboutSplash := nil;
    end;
  end
  else begin

    FrmAboutSplash.Show;
    FrmAboutSplash.Repaint;
  end;
end;



procedure TFrmAboutSplash.FormCreate(Sender: TObject);
begin
  with ImageLogo.Picture.Bitmap do begin
    TransparentMode := tmAuto;
    Transparent := TRUE;
  end;
  {Define color Splash}
  Color := ColorsList.clBlack;
  Panel.Color := uColors.ColorsList.clWhite;
  PanelBande.Color := ColorsList.clBlack;
  Position := poScreenCenter;
end;


procedure TFrmAboutSplash.FormShow(const Sender: TObject);
var
  Style : LongInt;
begin

  Style := GetWindowLong(Handle, GWL_STYLE);
  Style := Style and not WS_CAPTION;
  SetWindowLong(Handle, GWL_STYLE, Style);
  SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);

  ClientHeight := Panel.Height + (2 * Panel.Top) - 1;
  ClientWidth := Panel.Width + (2 * Panel.Left) - 1;

  SpeedButtonQuit.Top := 2;
  SpeedButtonQuit.Left := Panel.Width - SpeedButtonQuit.Width - 3;
end;



procedure TFrmAboutSplash.CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmAboutSplash.TimerEffectTimer(const Sender: TObject);
begin
  Close;
end;


procedure TFrmAboutSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;


end.
