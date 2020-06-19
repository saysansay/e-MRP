inherited frmSupplier: TfrmSupplier
  Caption = 'Supplier'
  OnShow = FormShow
  ExplicitWidth = 698
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      Left = 580
      TabOrder = 19
      ExplicitLeft = 580
    end
    inherited btnEdit: TcxButton
      Left = 580
      TabOrder = 20
      ExplicitLeft = 580
    end
    inherited btnDelete: TcxButton
      Left = 580
      TabOrder = 23
      ExplicitLeft = 580
    end
    inherited btnDuplicate: TcxButton
      Left = 580
      TabOrder = 24
      OnClick = btnDuplicateClick
      ExplicitLeft = 580
    end
    inherited btnRefresh: TcxButton
      Left = 580
      TabOrder = 25
      OnClick = btnRefreshClick
      ExplicitLeft = 580
    end
    inherited btnFind: TcxButton
      Left = 580
      TabOrder = 26
      OnClick = btnFindClick
      ExplicitLeft = 580
    end
    inherited btnSave: TcxButton
      Left = 580
      TabOrder = 21
      OnClick = btnSaveClick
      ExplicitLeft = 580
    end
    inherited btnCancel: TcxButton
      Left = 580
      TabOrder = 22
      ExplicitLeft = 580
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 97
      Top = 41
      DataBinding.DataField = 'supplier_code'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 265
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 97
      Top = 68
      DataBinding.DataField = 'supplier_name'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 265
    end
    object cxDBTextEdit3: TcxDBTextEdit [16]
      Left = 97
      Top = 95
      DataBinding.DataField = 'address1'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 265
    end
    object cxDBTextEdit4: TcxDBTextEdit [17]
      Left = 97
      Top = 122
      DataBinding.DataField = 'address2'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Width = 265
    end
    object cxDBTextEdit5: TcxDBTextEdit [18]
      Left = 97
      Top = 149
      DataBinding.DataField = 'city'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 265
    end
    object cxDBTextEdit6: TcxDBTextEdit [19]
      Left = 97
      Top = 203
      DataBinding.DataField = 'phone'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 265
    end
    object cxDBTextEdit7: TcxDBTextEdit [20]
      Left = 97
      Top = 230
      DataBinding.DataField = 'fax'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 13
      Width = 265
    end
    object cxDBTextEdit8: TcxDBTextEdit [21]
      Left = 97
      Top = 257
      DataBinding.DataField = 'contact'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 14
      Width = 265
    end
    object cxDBTextEdit9: TcxDBTextEdit [22]
      Left = 97
      Top = 284
      DataBinding.DataField = 'contact_email'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 265
    end
    object cxDBTextEdit10: TcxDBTextEdit [23]
      Left = 97
      Top = 311
      DataBinding.DataField = 'contact_phone'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 16
      Width = 265
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [24]
      Left = 97
      Top = 338
      DataBinding.DataField = 'invoice_currency'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'currency_code'
      Properties.ListColumns = <
        item
          Caption = 'Currency'
          FieldName = 'currency_code'
        end>
      Properties.ListSource = dmMRP.dsCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 17
      Width = 265
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox [25]
      Left = 97
      Top = 365
      DataBinding.DataField = 'invoice_term'
      DataBinding.DataSource = dsStgBase
      Properties.KeyFieldNames = 'term_code'
      Properties.ListColumns = <
        item
          Caption = 'Payment Term'
          FieldName = 'term_code'
        end>
      Properties.ListSource = dmMRP.dsPayment
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 18
      Width = 265
    end
    object cxDBTextEdit11: TcxDBTextEdit [26]
      Left = 97
      Top = 176
      DataBinding.DataField = 'country'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 265
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 9
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Supplier No'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Supplier Name'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Address 1'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Address 2'
      Control = cxDBTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'City'
      Control = cxDBTextEdit5
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Phone'
      Control = cxDBTextEdit6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Fax'
      Control = cxDBTextEdit7
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Contact'
      Control = cxDBTextEdit8
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Contact Email'
      Control = cxDBTextEdit9
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Contact Phone'
      Control = cxDBTextEdit10
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Invoice Currency'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Invoice Term'
      Control = cxDBLookupComboBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Country'
      Control = cxDBTextEdit11
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 265
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM supplier_tab')
  end
end
