object frmBaseMstDtl: TfrmBaseMstDtl
  Left = 0
  Top = 0
  Caption = 'BaseMstDtl'
  ClientHeight = 339
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 28
    Width = 505
    Height = 311
    Align = alClient
    TabOrder = 0
    ExplicitTop = 34
    object btnDNew: TcxButton
      Left = 420
      Top = 46
      Width = 75
      Height = 25
      Caption = 'New'
      TabOrder = 1
      OnClick = btnDNewClick
    end
    object btnDEdit: TcxButton
      Left = 420
      Top = 77
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 2
      OnClick = btnDEditClick
    end
    object btnDdelete: TcxButton
      Left = 420
      Top = 108
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 3
      OnClick = btnDdeleteClick
    end
    object grDetail: TcxGrid
      Left = 10
      Top = 46
      Width = 404
      Height = 255
      TabOrder = 0
      object grDetailDB: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Indicator = True
      end
      object grDetailLevel1: TcxGridLevel
        GridView = grDetailDB
      end
    end
    object cxButton1: TcxButton
      Left = 420
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Duplicate'
      TabOrder = 4
      OnClick = cxButton1Click
    end
    object btnImport: TcxButton
      Left = 420
      Top = 170
      Width = 75
      Height = 25
      Caption = 'Import'
      TabOrder = 5
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object LY0001: TdxLayoutGroup
      Parent = LY0002
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object LY0002: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object LY0003: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = LY0003
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnDNew
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = LY0003
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnDEdit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = LY0003
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnDdelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grDetail
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = LY0002
      AlignHorz = ahClient
      AlignVert = avClient
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = LY0003
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = LY0003
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnImport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 505
    Height = 28
    Align = dalTop
    BarManager = Bar10001
  end
  object Bar10001: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmMRP.imgbutton
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 16
    Top = 176
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Toolbar'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 539
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHNew'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHEdit'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHDelete'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHSave'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHCancel'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'btnHFind'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnHReport'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object btnHNew: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 0
    end
    object btnHEdit: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 1
    end
    object btnHDelete: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 4
    end
    object btnHSave: TdxBarButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 2
    end
    object btnHCancel: TdxBarButton
      Caption = 'Cancel'
      Category = 0
      Hint = 'Cancel'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 3
    end
    object btnHReport: TdxBarSubItem
      Caption = 'Report'
      Category = 0
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 8
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnHPreview'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnHDesign'
        end>
    end
    object btnHPreview: TdxBarButton
      Caption = 'Preview'
      Category = 0
      Hint = 'Preview'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 6
    end
    object btnHDesign: TdxBarButton
      Caption = 'Design'
      Category = 0
      Hint = 'Design'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 9
    end
    object btnHFind: TdxBarButton
      Caption = 'Find'
      Category = 0
      Hint = 'Find'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 5
    end
  end
  object qrMST: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 304
    Top = 124
  end
  object dsMST: TUniDataSource
    DataSet = qrMST
    OnStateChange = dsMSTStateChange
    Left = 336
    Top = 124
  end
  object qrDTL: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 304
    Top = 172
  end
  object dsDTL: TUniDataSource
    DataSet = qrDTL
    Left = 336
    Top = 172
  end
  object qrCMD: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 248
    Top = 176
  end
end
