inherited frmItems: TfrmItems
  Caption = 'Items Parts'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 9
    end
    inherited btnEdit: TcxButton
      TabOrder = 10
    end
    inherited btnDelete: TcxButton
      TabOrder = 13
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 14
    end
    inherited btnRefresh: TcxButton
      TabOrder = 15
    end
    inherited btnFind: TcxButton
      TabOrder = 16
    end
    inherited btnSave: TcxButton
      TabOrder = 11
    end
    inherited btnCancel: TcxButton
      TabOrder = 12
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 65
      Top = 41
      DataBinding.DataField = 'partno'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 286
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 65
      Top = 68
      DataBinding.DataField = 'partname'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 286
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [16]
      Left = 65
      Top = 95
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Width = 286
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Part No'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 286
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Part Name'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 286
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Part Type'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 286
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM inv_parts_tab')
  end
end
