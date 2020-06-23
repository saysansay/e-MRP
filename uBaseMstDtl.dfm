object frmBaseMstDtl: TfrmBaseMstDtl
  Left = 0
  Top = 0
  Caption = 'BaseMstDtl'
  ClientHeight = 339
  ClientWidth = 653
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 28
    Width = 653
    Height = 311
    Align = alClient
    TabOrder = 0
    object grDetail: TcxGrid
      Left = 10
      Top = 76
      Width = 633
      Height = 225
      PopupMenu = PopDetail
      TabOrder = 1
      object grDetailDB: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Header = frmMrp.Header
        Styles.InplaceEditFormItem = frmMrp.stlMenu
      end
      object grDetailLevel1: TcxGridLevel
        GridView = grDetailDB
      end
    end
    object dxBarDockControl2: TdxBarDockControl
      Left = 10
      Top = 46
      Width = 633
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
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
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
      Parent = LY0002
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grDetail
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 2
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
    Width = 653
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
          ItemName = 'btnHRefresh'
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
          ItemName = 'btnDCopy'
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
      ImageIndex = 0
    end
    object btnDEdit: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 1
    end
    object btnDDel: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 3
      OnClick = btnDDelClick
    end
    object btnDCopy: TdxBarButton
      Caption = 'Duplicate Row'
      Category = 0
      Hint = 'Duplicate Row'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 6
      OnClick = btnDCopyClick
    end
    object btnDSave: TdxBarButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 2
    end
    object btnDCancel: TdxBarButton
      Caption = 'Cancel'
      Category = 0
      Hint = 'Cancel'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 3
    end
    object btnHRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Style = frmMrp.stlMenu
      Visible = ivAlways
      ImageIndex = 7
    end
  end
  object qrMST: TUniQuery
    Connection = dmMRP.dbMySQL
    Options.StrictUpdate = False
    Options.AutoPrepare = True
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
    Options.StrictUpdate = False
    Options.AutoPrepare = True
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
  object PopDetail: TdxBarPopupMenu
    BarManager = Bar10001
    ItemLinks = <
      item
        Visible = True
        ItemName = 'BtnDNew'
      end
      item
        Visible = True
        ItemName = 'btnDEdit'
      end
      item
        Visible = True
        ItemName = 'btnDDel'
      end
      item
        Visible = True
        ItemName = 'btnDCopy'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'btnDSave'
      end
      item
        Visible = True
        ItemName = 'btnDCancel'
      end>
    UseOwnFont = False
    Left = 128
    Top = 172
    PixelsPerInch = 96
  end
  object popupHeader: TdxRibbonPopupMenu
    BarManager = Bar10001
    ItemLinks = <>
    UseOwnFont = False
    Left = 232
    Top = 132
    PixelsPerInch = 96
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 40
    Top = 8
    object dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel
      ItemOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      ItemOptions.CaptionOptions.Font.Color = clWindowText
      ItemOptions.CaptionOptions.Font.Height = -12
      ItemOptions.CaptionOptions.Font.Name = 'Tahoma'
      ItemOptions.CaptionOptions.Font.Style = []
      ItemOptions.CaptionOptions.UseDefaultFont = False
      PixelsPerInch = 96
    end
  end
end
