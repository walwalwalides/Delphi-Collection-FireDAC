inherited frmViewCategorie: TfrmViewCategorie
  Caption = 'Categorie'
  ClientHeight = 342
  ClientWidth = 773
  ExplicitWidth = 779
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFeed: TPanel
    Top = 290
    Width = 773
    ExplicitTop = 290
    ExplicitWidth = 773
    inherited btnNavigate: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pnlCentro: TPanel
    Width = 773
    Height = 290
    ExplicitWidth = 773
    ExplicitHeight = 290
    inherited pgcPrincipal: TPageControl
      Width = 771
      Height = 288
      ActivePage = tabManutencao
      ExplicitWidth = 771
      ExplicitHeight = 288
      inherited tabListagem: TTabSheet
        ExplicitWidth = 763
        ExplicitHeight = 260
        inherited pnlListagemTopo: TPanel
          Width = 763
          ExplicitWidth = 763
          inherited btnPesquisa: TBitBtn
            Top = 24
            Height = 22
            ExplicitTop = 24
            ExplicitHeight = 22
          end
        end
        inherited pnlListagemCentro: TPanel
          Width = 763
          Height = 200
          ExplicitWidth = 763
          ExplicitHeight = 200
          inherited grdListagem: TDBGrid
            Width = 761
            Height = 198
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            OnDblClick = nil
            OnKeyDown = nil
            Columns = <
              item
                Expanded = False
                FieldName = 'CategorieID'
                Width = 121
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CATDescription'
                Title.Caption = 'Description'
                Width = 530
                Visible = True
              end>
          end
        end
      end
      inherited tabManutencao: TTabSheet
        ExplicitWidth = 763
        ExplicitHeight = 260
        object edtCategoriaId: TLabeledEdit
          Tag = 1
          Left = 12
          Top = 23
          Width = 121
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'CategorieID'
          MaxLength = 10
          NumbersOnly = True
          TabOrder = 0
        end
        object edtDescription: TLabeledEdit
          Tag = 2
          Left = 12
          Top = 71
          Width = 413
          Height = 21
          EditLabel.Width = 58
          EditLabel.Height = 13
          EditLabel.Caption = 'Descricption'
          MaxLength = 30
          TabOrder = 1
        end
      end
    end
  end
  inherited DtsList: TDataSource
    DataSet = qrList
    Left = 669
    Top = 25
  end
  inherited qrList: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      'Select CategorieID, CATDescription from Categorie')
  end
end
