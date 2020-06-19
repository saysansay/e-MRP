inherited frmSite: TfrmSite
  Caption = 'Site'
  ClientHeight = 403
  OnShow = FormShow
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    Height = 403
    ExplicitHeight = 403
    inherited btnNew: TcxButton
      TabOrder = 0
    end
    inherited btnEdit: TcxButton
      TabOrder = 1
    end
    inherited btnDelete: TcxButton
      TabOrder = 4
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 5
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 6
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 7
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 2
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 3
    end
    inherited btnFirst: TcxButton
      TabOrder = 8
    end
    inherited cxButton2: TcxButton
      TabOrder = 9
    end
    inherited txtRecord: TcxSpinEdit
      TabOrder = 10
    end
    inherited txtTotal: TcxSpinEdit
      TabOrder = 11
    end
    inherited btnNext: TcxButton
      TabOrder = 12
    end
    inherited cxButton1: TcxButton
      TabOrder = 13
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 133
      Top = 41
      DataBinding.DataField = 'site'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 14
      Width = 218
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 133
      Top = 68
      DataBinding.DataField = 'description'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 218
    end
    object cxDBCheckBox1: TcxDBCheckBox [16]
      Left = 10
      Top = 95
      Caption = 'MRP Gross'
      DataBinding.DataField = 'mrp'
      DataBinding.DataSource = dsStgBase
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 16
    end
    object cxDBCheckBox2: TcxDBCheckBox [17]
      Left = 10
      Top = 122
      Caption = 'Treacibility'
      DataBinding.DataField = 'treacibility'
      DataBinding.DataSource = dsStgBase
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
    end
    object cxDBCheckBox3: TcxDBCheckBox [18]
      Left = 10
      Top = 149
      Caption = 'WMS'
      DataBinding.DataField = 'wms'
      DataBinding.DataSource = dsStgBase
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N '
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 18
    end
    object cxDBTextEdit3: TcxDBTextEdit [19]
      Left = 133
      Top = 176
      DataBinding.DataField = 'qty_format'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 19
      Width = 218
    end
    object cxDBTextEdit4: TcxDBTextEdit [20]
      Left = 133
      Top = 203
      DataBinding.DataField = 'currency_format'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 20
      Width = 218
    end
    inherited DL100001Group_Root: TdxLayoutGroup
      ItemIndex = 1
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 6
    end
    inherited LY10002: TdxLayoutGroup
      ItemIndex = 3
      Index = 0
    end
    inherited dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Site'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Description'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 218
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
      CaptionOptions.Text = 'cxDBCheckBox2'
      CaptionOptions.Visible = False
      Control = cxDBCheckBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 101
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = LY10001
      CaptionOptions.Text = 'cxDBCheckBox3'
      CaptionOptions.Visible = False
      Control = cxDBCheckBox3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 101
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Qty Display Format'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Currency Display Format'
      Control = cxDBTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 6
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM site_tab')
  end
end
