object frmStgBase: TfrmStgBase
  Left = 0
  Top = 0
  Caption = 'Setting Base'
  ClientHeight = 380
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object DL100001: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 682
    Height = 380
    Align = alClient
    TabOrder = 0
    object btnNew: TcxButton
      Left = 597
      Top = 10
      Width = 75
      Height = 25
      Caption = 'New'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 6
      OnClick = btnNewClick
    end
    object btnEdit: TcxButton
      Left = 597
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Edit'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 7
      OnClick = btnEditClick
    end
    object btnDelete: TcxButton
      Left = 597
      Top = 134
      Width = 75
      Height = 25
      Caption = 'Delete'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 10
      OnClick = btnDeleteClick
    end
    object btnDuplicate: TcxButton
      Left = 597
      Top = 165
      Width = 75
      Height = 25
      Caption = 'Duplicate'
      OptionsImage.ImageIndex = 6
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 11
    end
    object btnRefresh: TcxButton
      Left = 597
      Top = 196
      Width = 75
      Height = 25
      Caption = 'Refresh'
      OptionsImage.ImageIndex = 7
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 12
    end
    object btnFind: TcxButton
      Left = 597
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Find'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 13
    end
    object btnSave: TcxButton
      Left = 597
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Save'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 8
    end
    object btnCancel: TcxButton
      Left = 597
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Cancel'
      OptionsImage.ImageIndex = 3
      OptionsImage.Images = dmMRP.imgbutton
      TabOrder = 9
      OnClick = btnCancelClick
    end
    object btnFirst: TcxButton
      Left = 10
      Top = 10
      Width = 35
      Height = 25
      Caption = '<<'
      TabOrder = 0
      OnClick = btnFirstClick
    end
    object cxButton2: TcxButton
      Left = 51
      Top = 10
      Width = 35
      Height = 25
      Caption = '<'
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object txtRecord: TcxSpinEdit
      Left = 139
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 2
      Width = 50
    end
    object txtTotal: TcxSpinEdit
      Left = 228
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 3
      Width = 50
    end
    object btnNext: TcxButton
      Left = 284
      Top = 10
      Width = 35
      Height = 25
      Caption = '>'
      TabOrder = 4
      OnClick = btnNextClick
    end
    object cxButton1: TcxButton
      Left = 325
      Top = 10
      Width = 35
      Height = 25
      Caption = '>>'
      TabOrder = 5
      OnClick = cxButton1Click
    end
    object DL100001Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object LY10001: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object LY10002: TdxLayoutGroup
      Parent = DL100001Group_Root
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ItemIndex = 2
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnNew
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = LY10002
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnEdit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnDelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = btnDuplicate
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton5'
      CaptionOptions.Visible = False
      Control = btnRefresh
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton6'
      CaptionOptions.Visible = False
      Control = btnFind
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = LY10002
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = LY10002
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object LY10003: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = DL100001Group_Root
      AlignHorz = ahClient
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'First'
      CaptionOptions.Visible = False
      Control = btnFirst
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 35
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 35
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'Record '
      Control = txtRecord
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'Total'
      Control = txtTotal
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnNext
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 35
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = LY10003
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 35
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  object qrStgBase: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 296
    Top = 280
  end
  object dsStgBase: TUniDataSource
    DataSet = qrStgBase
    OnStateChange = dsStgBaseStateChange
    OnDataChange = dsStgBaseDataChange
    Left = 328
    Top = 280
  end
  object qrCMD: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 312
    Top = 328
  end
end
