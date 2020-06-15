inherited frmLocation: TfrmLocation
  Caption = 'Location'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 12
    end
    inherited btnEdit: TcxButton
      TabOrder = 13
    end
    inherited btnDelete: TcxButton
      TabOrder = 16
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 17
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 18
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 19
    end
    inherited btnSave: TcxButton
      TabOrder = 14
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 15
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [14]
      Left = 89
      Top = 41
      DataBinding.DataField = 'warehouse'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'warehouse'
      Properties.ListColumns = <
        item
          Caption = 'Warehouse'
          FieldName = 'warehouse'
        end
        item
          Caption = 'Description'
          FieldName = 'description'
        end>
      Properties.ListSource = dmMRP.dsWarehouse
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 255
    end
    object cxDBTextEdit1: TcxDBTextEdit [15]
      Left = 89
      Top = 68
      DataBinding.DataField = 'location'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 255
    end
    object cxDBTextEdit2: TcxDBTextEdit [16]
      Left = 89
      Top = 95
      DataBinding.DataField = 'description'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 255
    end
    object cxDBComboBox1: TcxDBComboBox [17]
      Left = 89
      Top = 122
      DataBinding.DataField = 'location_type'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'STORAGE'
        'STAGING')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 255
    end
    object cxDBComboBox2: TcxDBComboBox [18]
      Left = 89
      Top = 149
      DataBinding.DataField = 'location_status'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'EMPTY'
        'RESERVE')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 10
      Width = 255
    end
    object cxDBTextEdit3: TcxDBTextEdit [19]
      Left = 89
      Top = 176
      DataBinding.DataField = 'location_group'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 255
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Warehouse'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Location'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Description'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Location Type'
      Control = cxDBComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Location Status'
      Control = cxDBComboBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Location Group'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 255
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM location_tab')
  end
end
