inherited frmViewProducts: TfrmViewProducts
  Caption = 'Products'
  ClientHeight = 399
  ClientWidth = 862
  ExplicitWidth = 868
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 408
    Top = 200
    Width = 50
    Height = 50
  end
  inherited pnlFeed: TPanel
    Top = 347
    Width = 862
    ExplicitTop = 347
    ExplicitWidth = 862
    DesignSize = (
      862
      52)
    inherited btnNavigate: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pnlCentro: TPanel
    Width = 862
    Height = 347
    ExplicitWidth = 862
    ExplicitHeight = 347
    inherited pgcPrincipal: TPageControl
      Width = 860
      Height = 345
      ActivePage = tabManutencao
      ExplicitWidth = 860
      ExplicitHeight = 345
      inherited tabListagem: TTabSheet
        ExplicitWidth = 852
        ExplicitHeight = 317
        inherited pnlListagemTopo: TPanel
          Width = 852
          ExplicitWidth = 852
        end
        inherited pnlListagemCentro: TPanel
          Width = 852
          Height = 257
          ExplicitWidth = 852
          ExplicitHeight = 257
          inherited grdListagem: TDBGrid
            Width = 850
            Height = 255
            Columns = <
              item
                Expanded = False
                FieldName = 'ProductID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PDescription'
                Title.Caption = 'Product Description'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PValue'
                Title.Caption = 'Product Value'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PQuantity'
                Title.Caption = 'Product Quantity'
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CategorieID'
                Width = 129
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DescriptionPCAT'
                Title.Caption = 'Categorie Description'
                Width = 200
                Visible = True
              end>
          end
        end
      end
      inherited tabManutencao: TTabSheet
        ExplicitLeft = 5
        ExplicitTop = 23
        ExplicitWidth = 852
        ExplicitHeight = 317
        object Label1: TLabel
          Left = 8
          Top = 107
          Width = 53
          Height = 13
          Caption = 'Description'
        end
        object Label2: TLabel
          Left = 8
          Top = 222
          Width = 26
          Height = 13
          Caption = 'Value'
        end
        object Label3: TLabel
          Left = 146
          Top = 222
          Width = 42
          Height = 13
          Caption = 'Quantity'
        end
        object Label4: TLabel
          Left = 504
          Top = 61
          Width = 47
          Height = 13
          Caption = 'Categorie'
        end
        object edtProductID: TLabeledEdit
          Tag = 1
          Left = 8
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = 'ProductID'
          MaxLength = 10
          NumbersOnly = True
          TabOrder = 0
        end
        object edtName: TLabeledEdit
          Tag = 2
          Left = 8
          Top = 80
          Width = 481
          Height = 21
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Name'
          MaxLength = 60
          TabOrder = 1
        end
        object edtDescription: TMemo
          Left = 8
          Top = 124
          Width = 825
          Height = 89
          TabOrder = 3
        end
        object lkpCategorie: TDBLookupComboBox
          Left = 504
          Top = 80
          Width = 329
          Height = 21
          KeyField = 'CategorieID'
          ListField = 'CATDescription'
          ListSource = dtsCategorie
          TabOrder = 2
        end
        object edtValue: TJvValidateEdit
          Left = 40
          Top = 219
          Width = 44
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          TabOrder = 4
        end
        object edtQuantity: TJvValidateEdit
          Left = 194
          Top = 219
          Width = 44
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          TabOrder = 5
        end
      end
    end
  end
  inherited DtsList: TDataSource
    DataSet = qrList
    Left = 573
    Top = 25
  end
  object dtsCategorie: TDataSource [4]
    DataSet = qrCategorie
    Left = 757
    Top = 33
  end
  inherited qrList: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      
        'SELECT  ProductID,PName,PDescription,PValue,PQuantity,P.Categori' +
        'eID,CATDescription As DescriptionPCAT'
      
        'FROM Products as p LEFT JOIN Categorie as c on c.CategorieID = p' +
        '.CategorieID'
      '')
    Left = 629
  end
  object qrCategorie: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      'Select CategorieID, CATDescription from Categorie')
    Left = 685
    Top = 25
  end
end
