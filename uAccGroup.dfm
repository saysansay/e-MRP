inherited frmAccGroup: TfrmAccGroup
  Caption = 'Accounting Group'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 8
    end
    inherited btnEdit: TcxButton
      TabOrder = 9
    end
    inherited btnDelete: TcxButton
      TabOrder = 12
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 13
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 14
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 15
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 10
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 11
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 100
      Top = 41
      DataBinding.DataField = 'accgroup'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 251
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 100
      Top = 68
      DataBinding.DataField = 'description'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 251
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Accounting Group'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 251
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Description'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 251
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM accgroup_tab')
  end
  inherited qrCMD: TUniQuery
    Left = 368
    Top = 280
  end
end
