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
      ExplicitWidth = 822
      ExplicitHeight = 333
      inherited tabListagem: TTabSheet
        ExplicitWidth = 814
        ExplicitHeight = 305
        inherited pnlListagemTopo: TPanel
          Width = 814
          ExplicitWidth = 814
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
                FieldName = 'clientid'
                Title.Caption = 'Client ID'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cname'
                Title.Caption = 'Name'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cadress'
                Title.Caption = 'Address'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ccity'
                Title.Caption = 'City'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cemail'
                Title.Caption = 'Email'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'csex'
                Title.Caption = 'Sex'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ctelefon'
                Title.Caption = 'Telefon'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cbirthdate'
                Title.Caption = 'Birthdate'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cinsertts'
                Title.Caption = 'Insert Datetime'
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
          Width = 18
          Height = 13
          Caption = 'Sex'
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
          Top = 104
          Width = 40
          Height = 13
          Caption = 'Birthday'
        end
        object lblInsertDate: TLabel
          Left = 379
          Top = 253
          Width = 55
          Height = 13
          Caption = 'Insert Date'
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
        object edtCity: TLabeledEdit
          Left = 8
          Top = 168
          Width = 481
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'City'
          MaxLength = 50
          TabOrder = 4
        end
        object edtAdress: TLabeledEdit
          Left = 512
          Top = 120
          Width = 273
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'Address'
          MaxLength = 40
          TabOrder = 3
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
          TabOrder = 6
        end
        object edtSex: TMaskEdit
          Left = 512
          Top = 80
          Width = 18
          Height = 21
          EditMask = '>a;1;_'
          MaxLength = 1
          TabOrder = 2
          Text = ' '
        end
        object edtTelefone: TMaskEdit
          Left = 512
          Top = 168
          Width = 190
          Height = 21
          EditMask = '(99) 9999-9999;1;_'
          MaxLength = 14
          TabOrder = 5
          Text = '(  )     -    '
        end
        object DTPBirthdate: TDateTimePicker
          Left = 314
          Top = 272
          Width = 186
          Height = 21
          Date = 0.762079803243977900
          Time = 0.762079803243977900
          TabOrder = 7
        end
        object DTPInsertDate: TDateTimePicker
          Left = 8
          Top = 123
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
      
        'SELECT ClientID,CName,CAdress,Ccity,Ctelefon,Cemail,Csex,Cbirthd' +
        'ate,Cinsertts FROM Clients')
    Left = 717
    Top = 37
    object qrListclientid: TIntegerField
      FieldName = 'clientid'
      Origin = 'clientid'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrListcname: TWideStringField
      FieldName = 'cname'
      Origin = 'cname'
      FixedChar = True
      Size = 45
    end
    object qrListcadress: TWideStringField
      FieldName = 'cadress'
      Origin = 'cadress'
      FixedChar = True
      Size = 100
    end
    object qrListccity: TWideStringField
      FieldName = 'ccity'
      Origin = 'ccity'
      Size = 50
    end
    object qrListctelefon: TWideStringField
      FieldName = 'ctelefon'
      Origin = 'ctelefon'
      FixedChar = True
      Size = 14
    end
    object qrListcemail: TWideStringField
      FieldName = 'cemail'
      Origin = 'cemail'
      FixedChar = True
      Size = 60
    end
    object qrListcsex: TWideStringField
      FieldName = 'csex'
      Origin = 'csex'
      FixedChar = True
      Size = 1
    end
    object qrListcbirthdate: TDateField
      FieldName = 'cbirthdate'
      Origin = 'cbirthdate'
    end
    object qrListcinsertts: TDateField
      FieldName = 'cinsertts'
      Origin = 'cinsertts'
    end
  end
end
