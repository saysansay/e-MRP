inherited frmPR: TfrmPR
  Caption = 'Purchase Requisition'
  ClientHeight = 435
  ClientWidth = 774
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 790
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 774
    Height = 407
    inherited grDetail: TcxGrid
      Top = 151
      Width = 754
      Height = 246
      TabOrder = 7
      ExplicitTop = 151
      ExplicitWidth = 754
      ExplicitHeight = 246
      inherited grDetailDB: TcxGridDBTableView
        OnCellDblClick = grDetailDBCellDblClick
        DataController.DataSource = dsDTL
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        object grDetailDBpurch_partno: TcxGridDBColumn
          Caption = 'Purchase Part'
          DataBinding.FieldName = 'purch_partno'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = grDetailDBpurch_partnoPropertiesButtonClick
        end
        object grDetailDBpurch_partname: TcxGridDBColumn
          Caption = 'Part Name'
          DataBinding.FieldName = 'purch_partname'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
        end
        object grDetailDBpr_qty: TcxGridDBColumn
          Caption = 'Qty'
          DataBinding.FieldName = 'pr_qty'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.AssignedValues.DisplayFormat = True
        end
        object grDetailDBpurch_uom: TcxGridDBColumn
          Caption = 'Uom'
          DataBinding.FieldName = 'purch_uom'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
        end
        object grDetailDBtax_code: TcxGridDBColumn
          Caption = 'Tax Code'
          DataBinding.FieldName = 'tax_code'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
        end
        object grDetailDBColumn1: TcxGridDBColumn
          Caption = 'Price'
          DataBinding.FieldName = 'price'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.AssignedValues.DisplayFormat = True
        end
        object grDetailDBamount: TcxGridDBColumn
          Caption = 'Amount'
          DataBinding.FieldName = 'amount'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.AssignedValues.DisplayFormat = True
        end
        object grDetailDBbuyer: TcxGridDBColumn
          Caption = 'Buyer'
          DataBinding.FieldName = 'buyer'
        end
      end
    end
    inherited dxBarDockControl2: TdxBarDockControl
      Top = 121
      Width = 754
      ExplicitTop = 121
      ExplicitWidth = 754
    end
    object cxDBTextEdit1: TcxDBTextEdit [2]
      Left = 95
      Top = 28
      DataBinding.DataField = 'prno'
      DataBinding.DataSource = dsMST
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 242
    end
    object cxDBDateEdit1: TcxDBDateEdit [3]
      Left = 426
      Top = 28
      DataBinding.DataField = 'pr_date'
      DataBinding.DataSource = dsMST
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 191
    end
    object cxDBTextEdit2: TcxDBTextEdit [4]
      Left = 95
      Top = 55
      DataBinding.DataField = 'request_by'
      DataBinding.DataSource = dsMST
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 242
    end
    object cxDBTextEdit3: TcxDBTextEdit [5]
      Left = 426
      Top = 55
      DataBinding.DataField = 'departement'
      DataBinding.DataSource = dsMST
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 191
    end
    object cxDBComboBox1: TcxDBComboBox [6]
      Left = 95
      Top = 82
      DataBinding.DataField = 'pr_type'
      DataBinding.DataSource = dsMST
      Properties.DropDownSizeable = True
      Properties.Items.Strings = (
        'REGULER'
        'EXPRESS'
        'OTHER')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 242
    end
    object cxDBCurrencyEdit1: TcxDBCurrencyEdit [7]
      Left = 426
      Top = 82
      DataBinding.DataField = 'total_gross'
      DataBinding.DataSource = dsMST
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Width = 191
    end
    inherited LY0001: TdxLayoutGroup
      ItemIndex = 1
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Parent = LY0002
      Index = 2
    end
    inherited dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = nil
      Index = -1
      Special = True
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup4
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Requisition No'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 242
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup6
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'Requisition Date'
      Control = cxDBDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 191
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup4
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Request By'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 242
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Departement'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 191
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup4
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'Type'
      Control = cxDBComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 242
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup
      Parent = LY0001
      AlignHorz = ahClient
      AlignVert = avClient
      Index = 1
      AutoCreated = True
    end
    object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
      Parent = LY0001
      AlignHorz = ahLeft
      AlignVert = avTop
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Gross Amount'
      Control = cxDBCurrencyEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 191
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 774
  end
  inherited Bar10001: TdxBarManager
    PixelsPerInch = 96
    inherited btnHSave: TdxBarButton
      OnClick = btnHSaveClick
    end
    inherited BtnDNew: TdxBarButton
      OnClick = btnDNewClick
    end
    inherited btnDEdit: TdxBarButton
      OnClick = btnDEditClick
    end
  end
  inherited qrMST: TUniQuery
    SQL.Strings = (
      'SELECT * FROM pr_head_tab')
    BeforePost = qrMSTBeforePost
    Left = 264
    Top = 148
  end
  inherited dsMST: TUniDataSource
    Left = 384
    Top = 156
  end
  inherited qrDTL: TUniQuery
    SQL.Strings = (
      'SELECT * FROM pr_detail_tab')
    MasterSource = dsMST
    MasterFields = 'prno'
    DetailFields = 'prno'
    BeforePost = qrDTLBeforePost
    AfterPost = qrDTLAfterPost
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prno'
        Value = nil
      end>
  end
  inherited qrCMD: TUniQuery
    Left = 264
    Top = 224
  end
  inherited dtlImport: TQImport3Wizard
    Formats.ShortDateFormat = 'M/d/yyyy'
    Formats.LongDateFormat = 'dddd, MMMM d, yyyy'
    Formats.ShortTimeFormat = 'h:mm AMPM'
    Formats.LongTimeFormat = 'h:mm:ss AMPM'
  end
end
