inherited frmWarehouse: TfrmWarehouse
  Caption = 'Warehouse'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 13
    end
    inherited btnEdit: TcxButton
      TabOrder = 14
    end
    inherited btnDelete: TcxButton
      TabOrder = 17
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 18
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 19
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 20
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 15
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 16
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 70
      Top = 68
      DataBinding.DataField = 'warehouse'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 281
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [15]
      Left = 70
      Top = 41
      DataBinding.DataField = 'site'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'site'
      Properties.ListColumns = <
        item
          Caption = 'Site'
          FieldName = 'site'
        end
        item
          Caption = 'Description'
          FieldName = 'description'
        end>
      Properties.ListSource = dmMRP.dsSite
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 281
    end
    object cxDBTextEdit2: TcxDBTextEdit [16]
      Left = 70
      Top = 95
      DataBinding.DataField = 'description'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 281
    end
    object cxDBTextEdit3: TcxDBTextEdit [17]
      Left = 70
      Top = 122
      DataBinding.DataField = 'address1'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Width = 281
    end
    object cxDBTextEdit4: TcxDBTextEdit [18]
      Left = 70
      Top = 149
      DataBinding.DataField = 'address2'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 281
    end
    object cxDBTextEdit5: TcxDBTextEdit [19]
      Left = 70
      Top = 176
      DataBinding.DataField = 'city'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 281
    end
    object cxDBTextEdit6: TcxDBTextEdit [20]
      Left = 70
      Top = 203
      DataBinding.DataField = 'phone'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 281
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Warehouse'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Site'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Description'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Address'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Address 2'
      Control = cxDBTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'City'
      Control = cxDBTextEdit5
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Phone'
      Control = cxDBTextEdit6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 6
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM Warehouse_tab')
  end
end
