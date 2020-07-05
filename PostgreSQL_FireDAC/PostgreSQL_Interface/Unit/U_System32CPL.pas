unit U_System32CPL;

interface

{ System32CPL }
function System32CPL(CPL: integer): Boolean;

implementation



uses
  Windows,shellapi;

{
1ére méthode : en utilisant WinExec

2ème méthode : en utilisant ShellExecute
exemple:
ShellExecute(0,nil,pchar('Control.exe'), pchar('access.cpl,,2'),
  nil, SW_SHOWNORMAL);
...
}

function System32CPL(CPL: integer): Boolean;
var
handle :THandle;
begin

  try
    case CPL of
      { ---------------------------------------------------------------- }
      { Options d'accessibilité }
      { ---------------------------------------------------------------- }
      { Clavier }
      1: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL access.cpl',
        SW_SHOWNORMAL);
      { Son }
      2: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL access.cpl,,2',
        SW_SHOWNORMAL);
      { Affichage }
      3: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL access.cpl,,3',
        SW_SHOWNORMAL);
      { Souris }
      4: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL access.cpl,,4',
        SW_SHOWNORMAL);
      { Général }
      5: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL access.cpl,,5',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Ajouter ou supprimer des programmes }
      { ---------------------------------------------------------------- }
      { Modifier ou supprimer des programmes }
      6: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL appwiz.cpl',
        SW_SHOWNORMAL);
      { Ajouter de nouveaus programmes }
      7: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL appwiz.cpl,,1',
        SW_SHOWNORMAL);
      { Ajouter ou supprimer des composants Windows }
      8: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL appwiz.cpl,,2',
        SW_SHOWNORMAL);
      { Configurer les programmes par défaut }
      9: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL appwiz.cpl,,3',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { BDE Administrator }
      { ---------------------------------------------------------------- }
      10: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL bdeadmin.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés de Affichage }
      { ---------------------------------------------------------------- }
      { Thémes }
      11: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL desk.cpl',
        SW_SHOWNORMAL);
      { Bureau }
      12: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL desk.cpl,,0',
        SW_SHOWNORMAL);
      { Ecran de veille }
      13: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL desk.cpl,,1',
        SW_SHOWNORMAL);
      { Apparence }
      14: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL desk.cpl,,2',
        SW_SHOWNORMAL);
      { Paramétres }
      15: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL desk.cpl,,3',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Pare-feu Windows }
      { ---------------------------------------------------------------- }

      16: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL firewall.cpl',SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Assistant Ajout de matériel }
      { ---------------------------------------------------------------- }
      17: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL hdwwiz.cpl',SW_SHOWNORMAL);

      //  ShellExecute(Handle, PChar('open'), PChar('rundll32.exe'),PChar( 'shell32.dll,Control_RunDLL hdwwiz.cpl,,1'),nil, SW_NORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés de Internet }
      { ---------------------------------------------------------------- }
      { Général }
      18: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl',
        SW_SHOWNORMAL);
      { Sécurité }
      19: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,1',
        SW_SHOWNORMAL);
      { Confidentialité }
      20: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,2',
        SW_SHOWNORMAL);
      { Contenu }
      21: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,3',
        SW_SHOWNORMAL);
      { Connexions }
      22: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,4',
        SW_SHOWNORMAL);
      { Programmes }
      23: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,5',
        SW_SHOWNORMAL);
      { Avancé }
      24: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL InetCpl.cpl,,6',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Options régionales et linguistiques }
      { ---------------------------------------------------------------- }
      { Options régionales }
      25: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Intl.cpl',
        SW_SHOWNORMAL);
      { Langues }
      26: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Intl.cpl,,1',
        SW_SHOWNORMAL);
      { Options avancées }
      27: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Intl.cpl,,2',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { liaison sans fil }
      { ---------------------------------------------------------------- }
      { Infrarouge }
      28: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL irprops.cpl',
        SW_SHOWNORMAL);
      { Transfert d'images }
      29: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL irprops.cpl,,1',
        SW_SHOWNORMAL);
      { Matériel }
      30: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL irprops.cpl,,2',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Controleurs de jeu }
      { ---------------------------------------------------------------- }
      31: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Joy.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés de Souris }
      { ---------------------------------------------------------------- }
      { Boutons }
      32: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Main.cpl',
        SW_SHOWNORMAL);
      { Pointeurs }
      33: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Main.cpl,,1',
        SW_SHOWNORMAL);
      { Options de pointeur }
      34: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Main.cpl,,2',
        SW_SHOWNORMAL);
      { Roulette }
      35: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Main.cpl,,3',
        SW_SHOWNORMAL);
      { Matériel }
      36: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Main.cpl,,4',
        SW_SHOWNORMAL);

      { ---------------------------------------------------------------- }
      { Propriétés de Sons et préphériques audio }
      { ---------------------------------------------------------------- }
      { Volume }
      37: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Mmsys.cpl',
        SW_SHOWNORMAL);
      { Sons }
      38: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Mmsys.cpl,,1',
        SW_SHOWNORMAL);
      { Audio }
      39: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Mmsys.cpl,,2',
        SW_SHOWNORMAL);
      { Voix }
      40: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Mmsys.cpl,,3',
        SW_SHOWNORMAL);
      { Matériel }
      41: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Mmsys.cpl,,4',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Connexions réseau }
      { ---------------------------------------------------------------- }
      42: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL ncpa.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Assistant Configuration réseau }
      { ---------------------------------------------------------------- }
      43: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL netsetup.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Comptes d'utilisateurs }
      { ---------------------------------------------------------------- }
      44: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL nusrmgr.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Administrateur de sources de données ODBC }
      { ---------------------------------------------------------------- }
      45: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL ODBCCP32.CPL',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés de Options d'alimentation }
      { ---------------------------------------------------------------- }
      46: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL powercfg.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés systéme }
      { ---------------------------------------------------------------- }
      { Général }
      47: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl',
        SW_SHOWNORMAL);
      { Nom de l'ordinateur }
      48: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,1',
        SW_SHOWNORMAL);
      { Matériel }
      49: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,2',
        SW_SHOWNORMAL);
      { Avancé }
      50: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,3',
        SW_SHOWNORMAL);
      { Restauration du systéme }
      51: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,4',
        SW_SHOWNORMAL);
      { Mise à jour automatiques }
      52: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,5',
        SW_SHOWNORMAL);
      { Utilisation à distance }
      53: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL SysDm.cpl,,6',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Information concernant votre emplacement }
      { ---------------------------------------------------------------- }
      54: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL Telephon.cpl',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Propriétés de Date et heure }
      { ---------------------------------------------------------------- }
      { Date et heure }
      55: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL TimeDate.cpl',
        SW_SHOWNORMAL);
      { Fuseau horiare }
      56: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL TimeDate.cpl,,1',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Centre de sécurité Windows }
      { ---------------------------------------------------------------- }
      57: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL wscui.cpl',
        SW_SHOWNORMAL);

      { Paramétres d'alerte }
      58: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL wscui.cpl,,1',
        SW_SHOWNORMAL);


      { ---------------------------------------------------------------- }
      { Mises à jour automatiques }
      { ---------------------------------------------------------------- }
      59: WinExec('RunDLL32.exe Shell32.dll,Control_RunDLL wuaucpl.cpl',
        SW_SHOWNORMAL);

    end;
    Result := true;
  except
    Result := false;
  end;
  
end;

end.



//to be continued...


