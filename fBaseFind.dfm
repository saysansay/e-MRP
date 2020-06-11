object frmBaseFind: TfrmBaseFind
  Left = 0
  Top = 0
  Caption = 'Base Find'
  ClientHeight = 274
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LYBF001: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 521
    Height = 274
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 80
    ExplicitWidth = 300
    ExplicitHeight = 250
    object btnOK: TcxButton
      Left = 355
      Top = 239
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 3
    end
    object btnCancel: TcxButton
      Left = 436
      Top = 239
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
    end
    object grFind: TcxGrid
      Left = 10
      Top = 41
      Width = 501
      Height = 192
      TabOrder = 2
      object grFindDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsFind
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.Indicator = True
      end
      object grFindLevel1: TcxGridLevel
        GridView = grFindDBTableView1
      end
    end
    object txtFind: TcxTextEdit
      Left = 80
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 350
    end
    object btnFind: TcxButton
      Left = 436
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Find'
      TabOrder = 1
      OnClick = btnFindClick
    end
    object LYBF001Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object LYFB0002: TdxLayoutGroup
      Parent = LYBF001Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object LYFB0003: TdxLayoutGroup
      Parent = LYBF001Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = LYFB0003
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnOK
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = LYFB0003
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = LYFB0002
      AlignVert = avClient
      Control = grFind
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Search Value '
      Control = txtFind
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFind
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = LYFB0002
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
  end
  object qrFind: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 128
    Top = 144
  end
  object dsFind: TUniDataSource
    DataSet = qrFind
    OnDataChange = dsFindDataChange
    Left = 168
    Top = 144
  end
end
