object frmPRtoPO: TfrmPRtoPO
  Left = 0
  Top = 0
  Caption = 'Convert PR to PO'
  ClientHeight = 439
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 14
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 792
    Height = 439
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 200
    ExplicitWidth = 300
    ExplicitHeight = 250
    object grPR: TcxGrid
      Left = 10
      Top = 38
      Width = 772
      Height = 391
      TabOrder = 1
      object grPRDBtbl: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
      end
      object grPRLevel1: TcxGridLevel
        GridView = grPRDBtbl
      end
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 50
      Top = 10
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 0
      Text = 'cxButtonEdit1'
      Width = 167
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = grPR
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'PR NO'
      Control = cxButtonEdit1
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 167
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object qrPR: TUniQuery
    SQL.Strings = (
      
        'SELECT a.PRNO,a.SITE,a.REQUESTBY,b.PURCH_PARTNO,b.PURCH_PARTNAME' +
        ',b.PR_QTY,b.PURCH_UOM,b.TAX_CODE,')
    Left = 368
    Top = 168
  end
end
