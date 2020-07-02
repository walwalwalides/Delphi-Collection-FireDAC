{ ============================================
  Software Name : 	SaveMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Language;

interface

uses
  SysUtils, IniFiles;

const

  sFRENCH = 'Français';
  sGERMAN = 'Deutsch';

type

  TLanguage = class
    sLanguage             : string;
    // Textes pour les titres
    sTitle_Application    : string;
    sTitle_MainApplic     : string;
    // Textes pour les menus
    sMenuDatabase   	    : string;
    sMenuLogin       	    : string;
    sMenuUsers      	    : string;
    sMenuTasks      	    : string;
    sMenuGraphic    	    : string;
    sMenuTools      	    : string;
    sMenuSummary    	    : string;
    sMenuConfig		        : string;
    // Textes pour les boutons
    sButNew               : string;
    sButAdd               : string;
    sButUpd               : string;
    sButDel               : string;
    sButDatabase   	      : string;
    sButLogin      	      : string;
    sButUsers      	      : string;
    sButTasks      	      : string;
    sButSummary    	      : string;
    sButGraphic    	      : string;
    sButClipBoard 	      : string;
    sButPrintPortrait     : string;
    sButPrintLandscape    : string;
    // Textes pour les labels
    sLabelDatabase	      : string;
    sLabelHoursPerDay     : string;
    sLabelWorkingRate     : string;
    sLabelTotMonth	      : string;
    sLabelTask		        : string;
    sLabelMonth		        : string;
    sLabelNbrHrs		      : string;
    sLabelTaskDescr		    : string;
    sLabelDayDescr		    : string;
    sLabelSelYearMonth    : string;
    sLabelTotPlanned      : string;
    sLabelDiffMonth       : string;
    sLabelInitialReport   : string;
    sLabelBeginReport     : string;
    sLabelTotalReport     : string;
    // Textes pour les hints
    sHint_Database        : string;
    sHint_Save		        : string;
    sHint_Summary		      : string;
    sHint_Graphic		      : string;
    sHint_Users		        : string;
    sHint_Tasks		        : string;
    sHint_Preview		      : string;
    sHint_PrevCfg		      : string;
    sHint_Minutes		      : string;
    sHint_100 		        : string;
    sHint_CalcAuto        : string;
    // Textes pour les messages
    sMsgTaskUsed          : string;
    sMsgTaskMax           : string;
    sMsgNotFile           : string;
    sMsgQuestQuit         : string;
    sMsgFieldEmpty        : string;
    sMsgMatriculeExist    : string;
    sMsgUserExist         : string;
    sMsgUserNotExist      : string;
    // Textes pour les StringGrid
    sColTaskName	        : string;
    sColTotal   	        : string;
    sRowDayTotal 	        : string;
    // Textes pour les dialogue utilisateurs
    sUserDlgTitle	        : string;
    sUserAccess		        : string;
    sUserFirstName        : string;
    sUserLastName	        : string;
    sUserMatricule   	    : string;
    sUserUserType  	      : string;
    sUserConfirmation     : string;
    sUserWorkingRate      : string;
    sUserRightsAdmin  	  : string;
    sUserRightsUser   	  : string;
    // Textes pour le dialogue du mot de passe
    sTasksTitle		        : string;
    sTasksList		        : string;
    // Textes pour les périodes
    sGrpPeriod_Start	    : string;
    sGrpPeriod_End	      : string;
    sGrpPeriod_Year	      : string;
    sGrpPeriod_Month	    : string;
    // Textes pour le dialogue du résumé
    sSummaryTitle 	      : string;
    sSummaryBegPeriod     : string;
    sSummaryMonth         : string;
    sSummaryYear          : string;
    sSummaryHrsMonth      : string;
    sSummaryHrsReal       : string;
    sSummaryHrsDiff       : string;
    sSummaryMonthlyTotal  : string;
    sSummaryYearlyTotal   : string;
    // Textes pour la fenêtre des options
    sOpt_Titlte		        : string;
    sOpt_SheetHours		    : string;
    sOpt_GrpRadioHours	  : string;
    sOpt_RadioButMinutes	: string;
    sOpt_RadioBut100	    : string;
    sOpt_CheckCalcAuto	  : string;
    sOpt_HoursPerDay	    : string;
    sOpt_SheetColors	    : string;
    sOpt_ColorCells 	    : string;
    sOpt_ColorHeadCols    : string;
    sOpt_ColorHeadRows    : string;
    sOpt_ColorWeekEnd	    : string;
    sOpt_ColorTotItems	  : string;
    sOpt_ColorTotGlobal	  : string;
    sOpt_ColorCellSelect	: string;
    sOpt_ColorCrossSelect	: string;

    // Textes pour la fenêtre du graphique
    sGraphTitle 		      : string;
    sGraphFrom	  	      : string;
    sGraphTo  		        : string;
    sGraphTotPlanned	    : string;
    sGraphTotReal		      : string;
    sGraphDifference	    : string;
    sGraphDiffPerCent	    : string;
    sGraphOptGraphic	    : string;
    sGraphLabelHidedTask	: string;
    sGraphTaskNone		    : string;
    sGraphSummary		      : string;
    sGraphWithoutNull     : string;
    sGraphFullArea        : string;
    sGraphLegend          : string;
    //
    sGraphGrpLegend       : string;
    sGraphLegendLeft      : string;
    sGraphLegendTop       : string;
    sGraphLegendRight     : string;
    sGraphLegendBottom    : string;
    //
    sGraphTextsSize		    : string;
    sGraphTitleSize		    : string;
    sGraphMarksSize		    : string;
    sGraphLegendSize	    : string;
    // Textes pour la légende du graphique
    sLegendText           : string;
    sLegendStyles         : array[0..9] of string;
    //
    // Textes pour la configuration des rapports
    sRepCfgGrpInfos       : string;
    sRepCfgGraphic		    : string;
    sRepCfgSummary		    : string;
    sRepCfgDetail		      : string;
    //
    procedure ReadLanguage (sLanguage: string);
  end;

var

  Lang : TLanguage;

implementation



procedure TLanguage.ReadLanguage (sLanguage: string);
var
  i         : word;
  sSection  : string;
  IniFile   : TIniFile;
begin
  IniFile := TIniFile.Create(GetCurrentDir + '\' + sLanguage + '.lng');
  //=================================================================================
  //  Textes spécifiques à l'application
  //==================================================================================
  // Textes pour les titres
  sSection := '--- Texts for titles ---';
  sTitle_Application    := IniFile.ReadString (sSection, 'sTitle_Application', '');
  sTitle_MainApplic     := IniFile.ReadString (sSection, 'sTitle_MainApplic', '');
  // Textes pour les menus
  sSection := '--- Texts for menus ---';
  sMenuDatabase         := IniFile.ReadString (sSection, 'sMenuDatabase', '');
  sMenuLogin            := IniFile.ReadString (sSection, 'sMenuLogin', '');
  sMenuUsers            := IniFile.ReadString (sSection, 'sMenuUsers', '');
  sMenuTasks            := IniFile.ReadString (sSection, 'sMenuTasks', '');
  sMenuGraphic          := IniFile.ReadString (sSection, 'sMenuGraphic', '');
  sMenuTools            := IniFile.ReadString (sSection, 'sMenuTools', '');
  sMenuSummary          := IniFile.ReadString (sSection, 'sMenuSummary', '');
  sMenuConfig           := IniFile.ReadString (sSection, 'sMenuConfig', '');
  // Textes pour les boutons
  sSection := '--- Texts for buttons ---';
  sButNew               := IniFile.ReadString (sSection, 'sButNew', '');
  sButAdd               := IniFile.ReadString (sSection, 'sButAdd', '');
  sButUpd               := IniFile.ReadString (sSection, 'sButUpd', '');
  sButDel               := IniFile.ReadString (sSection, 'sButDel', '');
  sButDatabase          := IniFile.ReadString (sSection, 'sButDatabase', '');
  sButLogin             := IniFile.ReadString (sSection, 'sButLogin', '');
  sButUsers             := IniFile.ReadString (sSection, 'sButUsers', '');
  sButTasks             := IniFile.ReadString (sSection, 'sButTasks', '');
  sButSummary           := IniFile.ReadString (sSection, 'sButSummary', '');
  sButGraphic           := IniFile.ReadString (sSection, 'sButGraphic', '');
  sButClipBoard 	      := IniFile.ReadString (sSection, 'sButClipBoard', '');
  sButPrintPortrait     := IniFile.ReadString (sSection, 'sButPrintPortrait', '');
  sButPrintLandscape    := IniFile.ReadString (sSection, 'sButPrintLandscape', '');
  // Textes pour les labels
  sSection := '--- Texts for labels ---';
  sLabelDatabase        := IniFile.ReadString (sSection, 'sLabelDatabase', '');
  sLabelHoursPerDay     := IniFile.ReadString (sSection, 'sLabelHoursPerDay', '');
  sLabelWorkingRate     := IniFile.ReadString (sSection, 'sLabelWorkingRate', '');
  sLabelTotMonth        := IniFile.ReadString (sSection, 'sLabelTotMonth', '');
  sLabelTask            := IniFile.ReadString (sSection, 'sLabelTask', '');
  sLabelMonth           := IniFile.ReadString (sSection, 'sLabelMonth', '');
  sLabelNbrHrs          := IniFile.ReadString (sSection, 'sLabelNbrHrs', '');
  sLabelTaskDescr       := IniFile.ReadString (sSection, 'sLabelTaskDescr', '');
  sLabelDayDescr        := IniFile.ReadString (sSection, 'sLabelDayDescr', '');
  sLabelSelYearMonth    := IniFile.ReadString (sSection, 'sLabelSelYearMonth', '');
  sLabelTotPlanned      := IniFile.ReadString (sSection, 'sLabelTotPlanned', '');
  sLabelDiffMonth       := IniFile.ReadString (sSection, 'sLabelDiffMonth', '');
  sLabelInitialReport   := IniFile.ReadString (sSection, 'sLabelInitialReport', '');
  sLabelBeginReport     := IniFile.ReadString (sSection, 'sLabelBeginReport', '');
  sLabelTotalReport     := IniFile.ReadString (sSection, 'sLabelTotalReport', '');
  // Textes pour les hints
  sSection := '--- Texts for hints ---';
  sHint_Database        := IniFile.ReadString (sSection, 'sHint_Database', '');
  sHint_Save            := IniFile.ReadString (sSection, 'sHint_Save', '');
  sHint_Summary         := IniFile.ReadString (sSection, 'sHint_Summary', '');
  sHint_Graphic         := IniFile.ReadString (sSection, 'sHint_Graphic', '');
  sHint_Users           := IniFile.ReadString (sSection, 'sHint_Users', '');
  sHint_Tasks           := IniFile.ReadString (sSection, 'sHint_Tasks', '');
  sHint_Preview         := IniFile.ReadString (sSection, 'sHint_Preview', '');
  sHint_PrevCfg         := IniFile.ReadString (sSection, 'sHint_PrevCfg', '');
  sHint_Minutes         := IniFile.ReadString (sSection, 'sHint_Minutes', '');
  sHint_100             := IniFile.ReadString (sSection, 'sHint_100', '');
  sHint_CalcAuto        := IniFile.ReadString (sSection, 'sHint_CalcAuto', '');
  // Textes pour les messages
  sSection := '--- Texts for messages ---';
  sMsgTaskUsed          := IniFile.ReadString (sSection, 'sMsgTaskUsed', '');
  sMsgTaskMax           := IniFile.ReadString (sSection, 'sMsgTaskMax', '');
  sMsgNotFile           := IniFile.ReadString (sSection, 'sMsgNotFile', '');
  sMsgQuestQuit         := IniFile.ReadString (sSection, 'sMsgQuestQuit', '');
  sMsgFieldEmpty        := IniFile.ReadString (sSection, 'sMsgFieldEmpty', '');
  sMsgMatriculeExist    := IniFile.ReadString (sSection, 'sMsgMatriculeExist', '');
  sMsgUserExist         := IniFile.ReadString (sSection, 'sMsgUserExist', '');
  sMsgUserNotExist      := IniFile.ReadString (sSection, 'sMsgUserNotExist', '');
  // Textes pour les colonnes du StringGrid
  sSection := '--- Texts for StringGrid ---';
  sColTaskName          := IniFile.ReadString (sSection, 'sColTaskName', '');
  sColTotal             := IniFile.ReadString (sSection, 'sColTotal', '');
  sRowDayTotal          := IniFile.ReadString (sSection, 'sRowDayTotal', '');
    // Textes pour les dialogue utilisateurs
  sSection := '--- Texts for users dialogs ---';
  sUserDlgTitle		      := IniFile.ReadString (sSection, 'sUserDlgTitle', '');
  sUserAccess		        := IniFile.ReadString (sSection, 'sUserAccess', '');
  sUserFirstName        := IniFile.ReadString (sSection, 'sUserFirstName', '');
  sUserLastName		      := IniFile.ReadString (sSection, 'sUserLastName', '');
  sUserMatricule		    := IniFile.ReadString (sSection, 'sUserMatricule', '');
  sUserUserType		      := IniFile.ReadString (sSection, 'sUserUserType', '');
  sUserConfirmation	    := IniFile.ReadString (sSection, 'sUserConfirmation', '');
  sUserWorkingRate	    := IniFile.ReadString (sSection, 'sUserWorkingRate', '');
  sUserRightsAdmin		  := IniFile.ReadString (sSection, 'sUserRightsAdmin', '');
  sUserRightsUser		    := IniFile.ReadString (sSection, 'sUserRightsUser', '');
  // Textes pour la fenêtre des tâches
  sSection := '--- Texts for tasks dialog ---';
  sTasksTitle		        := IniFile.ReadString (sSection, 'sTasksTitle', '');
  sTasksList		        := IniFile.ReadString (sSection, 'sTasksList', '');
  // Textes pour choix de la période
  sSection := '--- Texts for periods ---';
  sGrpPeriod_Start      := IniFile.ReadString (sSection, 'sGrpPeriod_Start', '');
  sGrpPeriod_End        := IniFile.ReadString (sSection, 'sGrpPeriod_End', '');
  sGrpPeriod_Year       := IniFile.ReadString (sSection, 'sGrpPeriod_Year', '');
  sGrpPeriod_Month      := IniFile.ReadString (sSection, 'sGrpPeriod_Month', '');
  // Textes la fenêtre du récapitulatif
  sSection := '--- Texts for summary dialog ---';
  sSummaryTitle	  	    := IniFile.ReadString (sSection, 'sSummaryTitle', '');
  sSummaryBegPeriod  	  := IniFile.ReadString (sSection, 'sSummaryBegPeriod', '');
  sSummaryMonth  	      := IniFile.ReadString (sSection, 'sSummaryMonth', '');
  sSummaryYear  	      := IniFile.ReadString (sSection, 'sSummaryYear', '');
  sSummaryHrsMonth      := IniFile.ReadString (sSection, 'sSummaryHrsMonth', '');
  sSummaryHrsReal  	    := IniFile.ReadString (sSection, 'sSummaryHrsReal', '');
  sSummaryHrsDiff  	    := IniFile.ReadString (sSection, 'sSummaryHrsDiff', '');
  sSummaryMonthlyTotal  := IniFile.ReadString (sSection, 'sSummaryMonthlyTotal', '');
  sSummaryYearlyTotal   := IniFile.ReadString (sSection, 'sSummaryYearlyTotal', '');
  // Textes pour la fenêtre des options
  sSection := '--- Texts for options dialog ---';
  sOpt_Titlte	  	      := IniFile.ReadString (sSection, 'sOpt_Titlte', '');
  sOpt_SheetHours	  	  := IniFile.ReadString (sSection, 'sOpt_SheetHours', '');
  sOpt_GrpRadioHours	  := IniFile.ReadString (sSection, 'sOpt_GrpRadioHours', '');
  sOpt_RadioButMinutes  := IniFile.ReadString (sSection, 'sOpt_RadioButMinutes', '');
  sOpt_RadioBut100	    := IniFile.ReadString (sSection, 'sOpt_RadioBut100', '');
  sOpt_CheckCalcAuto	  := IniFile.ReadString (sSection, 'sOpt_CheckCalcAuto', '');
  sOpt_HoursPerDay	    := IniFile.ReadString (sSection, 'sOpt_HoursPerDay', '');
  sOpt_SheetColors  	  := IniFile.ReadString (sSection, 'sOpt_SheetColors', '');
  sOpt_ColorCells 	    := IniFile.ReadString (sSection, 'sOpt_ColorCells', '');
  sOpt_ColorHeadCols    := IniFile.ReadString (sSection, 'sOpt_ColorHeadCols', '');
  sOpt_ColorHeadRows    := IniFile.ReadString (sSection, 'sOpt_ColorHeadRows', '');
  sOpt_ColorWeekEnd	    := IniFile.ReadString (sSection, 'sOpt_ColorWeekEnd', '');
  sOpt_ColorTotItems	  := IniFile.ReadString (sSection, 'sOpt_ColorTotItems', '');
  sOpt_ColorTotGlobal	  := IniFile.ReadString (sSection, 'sOpt_ColorTotGlobal', '');
  sOpt_ColorCellSelect	:= IniFile.ReadString (sSection, 'sOpt_ColorCellSelect', '');
  sOpt_ColorCrossSelect	:= IniFile.ReadString (sSection, 'sOpt_ColorCrossSelect', '');
  // Textes pour la fenêtre du graphique
  sSection := '--- Texts for graphic dialog ---';
  sGraphTitle	  	      := IniFile.ReadString (sSection, 'sGraphTitle', '');
  sGraphFrom	  	      := IniFile.ReadString (sSection, 'sGraphFrom', '');
  sGraphTo  	  	      := IniFile.ReadString (sSection, 'sGraphTo', '');
  sGraphTotPlanned	    := IniFile.ReadString (sSection, 'sGraphTotPlanned', '');
  sGraphTotReal		      := IniFile.ReadString (sSection, 'sGraphTotReal', '');
  sGraphDifference	    := IniFile.ReadString (sSection, 'sGraphDifference', '');
  sGraphDiffPerCent	    := IniFile.ReadString (sSection, 'sGraphDiffPerCent', '');
  sGraphOptGraphic	    := IniFile.ReadString (sSection, 'sGraphOptGraphic', '');
  sGraphLabelHidedTask	:= IniFile.ReadString (sSection, 'sGraphLabelHidedTask', '');
  sGraphTaskNone		    := IniFile.ReadString (sSection, 'sGraphTaskNone', '');
  sGraphWithoutNull     := IniFile.ReadString (sSection, 'sGraphWithoutNull', '');
  sGraphSummary		      := IniFile.ReadString (sSection, 'sGraphSummary', '');
  sGraphFullArea        := IniFile.ReadString (sSection, 'sGraphFullArea', '');
  sGraphLegend          := IniFile.ReadString (sSection, 'sGraphLegend', '');
  //
  sGraphGrpLegend       := IniFile.ReadString (sSection, 'sGraphGrpLegend', '');
  sGraphLegendLeft      := IniFile.ReadString (sSection, 'sGraphLegendLeft', '');
  sGraphLegendTop       := IniFile.ReadString (sSection, 'sGraphLegendTop', '');
  sGraphLegendRight     := IniFile.ReadString (sSection, 'sGraphLegendRight', '');
  sGraphLegendBottom    := IniFile.ReadString (sSection, 'sGraphLegendBottom', '');
  //
  sGraphTextsSize       := IniFile.ReadString (sSection, 'sGraphTextsSize', '');
  sGraphTitleSize       := IniFile.ReadString (sSection, 'sGraphTitleSize', '');
  sGraphMarksSize       := IniFile.ReadString (sSection, 'sGraphMarksSize', '');
  sGraphLegendSize      := IniFile.ReadString (sSection, 'sGraphLegendSize', '');
  // Textes pour la légende du graphique
  sSection := '--- Texts for legend of graphic ---';
  sLegendText	:= IniFile.ReadString (sSection, 'sLegendText', '');
  for i := 0 to 9 do
    sLegendStyles[i] := IniFile.ReadString (sSection, IntToStr (i), '');
  // Textes pour la configuration des rapports
  sSection := '--- Texts for report config ---';
  sRepCfgGrpInfos	      := IniFile.ReadString (sSection, 'sRepCfgGrpInfos', '');
  sRepCfgGraphic	      := IniFile.ReadString (sSection, 'sRepCfgGraphic', '');
  sRepCfgSummary	      := IniFile.ReadString (sSection, 'sRepCfgSummary', '');
  sRepCfgDetail	  	    := IniFile.ReadString (sSection, 'sRepCfgDetail', '');
  //
  IniFile.Free;
end;


initialization
  Lang := TLanguage.Create;

finalization
  Lang.Free;



end.
