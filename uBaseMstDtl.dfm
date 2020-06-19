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
    object grDetail: TcxGrid
      Left = 10
      Top = 76
      Width = 485
      Height = 225
      TabOrder = 1
      object grDetailDB: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Header = frmMrp.stlMenu
        Styles.InplaceEditFormItem = frmMrp.stlMenu
      end
      object grDetailLevel1: TcxGridLevel
        GridView = grDetailDB
      end
    end
    object dxBarDockControl2: TdxBarDockControl
      Left = 10
      Top = 46
      Width = 485
      Height = 24
      Align = dalNone
      BarManager = Bar10001
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
      ItemIndex = 2
      ShowBorder = False
      Index = 0
    end
    object LY0003: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = -1
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
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = LY0002
      Control = dxBarDockControl2
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
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
    object Bar10001Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Action'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 539
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BtnDNew'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDImport'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnHNew: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 0
      OnClick = btnHNewClick
    end
    object btnHEdit: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnHEditClick
    end
    object btnHDelete: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 4
      OnClick = btnHDeleteClick
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
      OnClick = btnHCancelClick
    end
    object btnHReport: TdxBarSubItem
      Caption = 'Print'
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
    object BtnDNew: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Style = frmMrp.stlMenu
      Visible = ivAlways
    end
    object btnDEdit: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Style = frmMrp.stlMenu
      Visible = ivAlways
    end
    object btnDDel: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Style = frmMrp.stlMenu
      Visible = ivAlways
    end
    object btnDImport: TdxBarButton
      Caption = 'Import'
      Category = 0
      Hint = 'Import'
      Style = frmMrp.stlMenu
      Visible = ivAlways
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
    OnStateChange = dsDTLStateChange
    Left = 336
    Top = 172
  end
  object qrCMD: TUniQuery
    Connection = dmMRP.dbMySQL
    Left = 248
    Top = 176
  end
  object dtlImport: TQImport3Wizard
    DataSet = qrDTL
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '/'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      'True')
    Formats.BooleanFalse.Strings = (
      'False')
    Formats.NullValues.Strings = (
      'Null')
    Formats.ShortDateFormat = 'M/d/yyyy'
    Formats.LongDateFormat = 'dddd, MMMM d, yyyy'
    Formats.ShortTimeFormat = 'h:mm AMPM'
    Formats.LongTimeFormat = 'h:mm:ss AMPM'
    FieldFormats = <>
    ErrorLogFileName = 'error.log'
    AddType = qatInsert
    Left = 376
    Top = 124
  end
end
