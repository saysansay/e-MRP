inherited frmPurchasePart: TfrmPurchasePart
  Caption = 'Purchase Part/Expanse'
  OnShow = FormShow
  ExplicitWidth = 698
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 17
    end
    inherited btnEdit: TcxButton
      TabOrder = 18
    end
    inherited btnDelete: TcxButton
      TabOrder = 21
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 22
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 23
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 24
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 19
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 20
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 107
      Top = 41
      DataBinding.DataField = 'purch_partno'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 244
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 107
      Top = 68
      DataBinding.DataField = 'purch_partname'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 244
    end
    object cxDBCheckBox1: TcxDBCheckBox [16]
      Left = 10
      Top = 95
      Caption = 'Expanse'
      DataBinding.DataField = 'expanse'
      DataBinding.DataSource = dsStgBase
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Properties.OnChange = cxDBCheckBox1PropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [17]
      Left = 107
      Top = 122
      DataBinding.DataField = 'partno'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'partno'
      Properties.ListColumns = <
        item
          Caption = 'PartNo'
          FieldName = 'partno'
        end
        item
          Caption = 'PartName'
          FieldName = 'partname'
        end>
      Properties.ListSource = dmMRP.dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 244
    end
    object cxDBTextEdit3: TcxDBTextEdit [18]
      Left = 107
      Top = 149
      DataBinding.DataField = 'purch_uom'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 244
    end
    object cxDBTextEdit4: TcxDBTextEdit [19]
      Left = 107
      Top = 176
      DataBinding.DataField = 'buyer'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 244
    end
    object cxDBTextEdit5: TcxDBTextEdit [20]
      Left = 107
      Top = 203
      DataBinding.DataField = 'purchase_group'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 244
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox [21]
      Left = 107
      Top = 230
      DataBinding.DataField = 'primary_supplier'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'supplier_code'
      Properties.ListColumns = <
        item
          Caption = 'Supplier Code'
          FieldName = 'supplier_code'
        end
        item
          Caption = 'Supplier Name'
          FieldName = 'supplier_name'
        end>
      Properties.ListSource = dmMRP.dsSupplier
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 13
      Width = 244
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox [22]
      Left = 107
      Top = 257
      DataBinding.DataField = 'secondary_supplier'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'supplier_code'
      Properties.ListColumns = <
        item
          Caption = 'Supplier Code'
          FieldName = 'supplier_code'
        end
        item
          Caption = 'Supplier Name'
          FieldName = 'supplier_name'
        end>
      Properties.ListSource = dmMRP.dsSupplier
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 14
      Width = 244
    end
    object cxDBTextEdit6: TcxDBTextEdit [23]
      Left = 107
      Top = 284
      DataBinding.DataField = 'purch_price'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 244
    end
    object cxDBLookupComboBox4: TcxDBLookupComboBox [24]
      Left = 107
      Top = 311
      DataBinding.DataField = 'tax_code'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'taxcode'
      Properties.ListColumns = <
        item
          Caption = 'Tax Code'
          FieldName = 'taxcode'
        end>
      Properties.ListSource = dmMRP.dsTax
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 16
      Width = 244
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 9
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Purchase Part'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Part Name'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      CaptionOptions.Text = 'cxDBCheckBox1'
      CaptionOptions.Visible = False
      Control = cxDBCheckBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 101
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Inventory Part'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'UOM'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Buyer'
      Control = cxDBTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Purchase Group'
      Control = cxDBTextEdit5
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Primary Supplier'
      Control = cxDBLookupComboBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Secondary Supplier'
      Control = cxDBLookupComboBox3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Price'
      Control = cxDBTextEdit6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Tax Code'
      Control = cxDBLookupComboBox4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 10
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM purchasepart_tab')
  end
end
