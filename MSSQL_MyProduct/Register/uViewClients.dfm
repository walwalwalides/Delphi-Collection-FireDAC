inherited frmViewClients: TfrmViewClients
  Caption = 'Clients'
  ClientHeight = 387
  ClientWidth = 824
  ExplicitWidth = 830
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFeed: TPanel
    Top = 335
    Width = 824
    ExplicitTop = 335
    ExplicitWidth = 824
    inherited btnExit: TBitBtn
      Left = 745
      ExplicitLeft = 745
    end
    inherited btnNavigate: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pnlCentro: TPanel
    Width = 824
    Height = 335
    ExplicitWidth = 824
    ExplicitHeight = 335
    inherited pgcPrincipal: TPageControl
      Width = 822
      Height = 333
      ActivePage = tabManutencao
      ExplicitLeft = 0
      ExplicitWidth = 822
      ExplicitHeight = 333
      inherited tabListagem: TTabSheet
        ExplicitWidth = 814
        ExplicitHeight = 305
        inherited pnlListagemTopo: TPanel
          Width = 814
          ExplicitWidth = 814
          inherited lblIndice: TLabel
            Margins.Bottom = 0
          end
          inherited btnPesquisa: TBitBtn
            Top = 24
            Height = 21
            ExplicitTop = 24
            ExplicitHeight = 21
          end
        end
        inherited pnlListagemCentro: TPanel
          Width = 814
          Height = 245
          ExplicitWidth = 814
          ExplicitHeight = 245
          inherited grdListagem: TDBGrid
            Width = 812
            Height = 243
            Columns = <
              item
                Expanded = False
                FieldName = 'ClientsID'
                Title.Caption = 'Client ID'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cname'
                Title.Caption = 'Name'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Caddress'
                Title.Caption = 'Address'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Ccity'
                Title.Caption = 'City'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cneighborhood'
                Title.Caption = 'Neighborhood'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cstate'
                Title.Caption = 'State'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Czipcode'
                Title.Caption = 'Zipcode'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Ctelefon'
                Title.Caption = 'Telefon'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cbirthdate'
                Title.Caption = 'Birthdate'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      inherited tabManutencao: TTabSheet
        ExplicitWidth = 814
        ExplicitHeight = 305
        object Label1: TLabel
          Left = 512
          Top = 63
          Width = 39
          Height = 13
          Caption = 'ZipCode'
        end
        object Label2: TLabel
          Left = 512
          Top = 151
          Width = 36
          Height = 13
          Caption = 'Telefon'
        end
        object Label3: TLabel
          Left = 8
          Top = 245
          Width = 40
          Height = 13
          Caption = 'Birthday'
        end
        object edtClienteId: TLabeledEdit
          Tag = 1
          Left = 8
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 11
          EditLabel.Height = 13
          EditLabel.Caption = 'ID'
          MaxLength = 10
          NumbersOnly = True
          TabOrder = 0
        end
        object edtNome: TLabeledEdit
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
        object edtEndereco: TLabeledEdit
          Left = 8
          Top = 120
          Width = 481
          Height = 21
          EditLabel.Width = 67
          EditLabel.Height = 13
          EditLabel.Caption = 'Neighberhood'
          MaxLength = 60
          TabOrder = 3
        end
        object edtCidade: TLabeledEdit
          Left = 8
          Top = 168
          Width = 481
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'City'
          MaxLength = 50
          TabOrder = 5
        end
        object edtBairro: TLabeledEdit
          Left = 512
          Top = 120
          Width = 273
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'Address'
          MaxLength = 40
          TabOrder = 4
        end
        object edtEmail: TLabeledEdit
          Left = 8
          Top = 218
          Width = 665
          Height = 21
          EditLabel.Width = 24
          EditLabel.Height = 13
          EditLabel.Caption = 'Email'
          MaxLength = 100
          TabOrder = 7
        end
        object edtCEP: TMaskEdit
          Left = 512
          Top = 80
          Width = 193
          Height = 21
          EditMask = '99.999-999;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  .   -   '
        end
        object edtTelefone: TMaskEdit
          Left = 512
          Top = 168
          Width = 190
          Height = 21
          EditMask = '(99) 9999-9999;1;_'
          MaxLength = 14
          TabOrder = 6
          Text = '(  )     -    '
        end
        object DTPBirthdate: TDateTimePicker
          Left = 8
          Top = 261
          Width = 186
          Height = 21
          Date = 0.762079803243977900
          Time = 0.762079803243977900
          TabOrder = 8
        end
      end
    end
  end
  inherited DtsList: TDataSource
    DataSet = qrList
    Left = 652
    Top = 24
  end
  inherited qrList: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      
        'SELECT ClientsID,Cname,Caddress,Ccity,Cneighborhood,Cstate, Czip' +
        'code,Ctelefon,Cemail,Cbirthdate FROM Clients')
    Left = 725
    Top = 53
    object qrListClientsID: TFDAutoIncField
      FieldName = 'ClientsID'
      Origin = 'ClientsID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrListCname: TStringField
      FieldName = 'Cname'
      Origin = 'Cname'
      Size = 60
    end
    object qrListCaddress: TStringField
      FieldName = 'Caddress'
      Origin = 'Caddress'
      Size = 60
    end
    object qrListCcity: TStringField
      FieldName = 'Ccity'
      Origin = 'Ccity'
      Size = 50
    end
    object qrListCneighborhood: TStringField
      FieldName = 'Cneighborhood'
      Origin = 'Cneighborhood'
      Size = 40
    end
    object qrListCstate: TStringField
      FieldName = 'Cstate'
      Origin = 'Cstate'
      Size = 2
    end
    object qrListCzipcode: TStringField
      FieldName = 'Czipcode'
      Origin = 'Czipcode'
      Size = 10
    end
    object qrListCtelefon: TStringField
      FieldName = 'Ctelefon'
      Origin = 'Ctelefon'
      Size = 14
    end
    object qrListCemail: TStringField
      FieldName = 'Cemail'
      Origin = 'Cemail'
      Size = 100
    end
    object qrListCbirthdate: TSQLTimeStampField
      FieldName = 'Cbirthdate'
      Origin = 'Cbirthdate'
    end
  end
end
