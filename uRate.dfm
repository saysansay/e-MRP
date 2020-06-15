inherited frmRate: TfrmRate
  Caption = 'Rate'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 10
    end
    inherited btnEdit: TcxButton
      TabOrder = 11
    end
    inherited btnDelete: TcxButton
      TabOrder = 14
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 15
    end
    inherited btnRefresh: TcxButton
      TabOrder = 16
    end
    inherited btnFind: TcxButton
      TabOrder = 17
    end
    inherited btnSave: TcxButton
      TabOrder = 12
    end
    inherited btnCancel: TcxButton
      TabOrder = 13
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [14]
      Left = 65
      Top = 41
      DataBinding.DataField = 'ratetype'
      DataBinding.DataSource = dsStgBase
      Properties.KeyFieldNames = 'ratetype'
      Properties.ListColumns = <
        item
          Caption = 'Retetype'
          FieldName = 'ratetype'
        end
        item
          Caption = 'Description'
          FieldName = 'description'
        end
        item
          Caption = 'Currency '
          FieldName = 'currency_code'
        end>
      Properties.ListSource = dmMRP.dsRateType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 278
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox [15]
      Left = 65
      Top = 68
      DataBinding.DataField = 'currency_code'
      DataBinding.DataSource = dsStgBase
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 7
      Width = 278
    end
    object cxDBTextEdit1: TcxDBTextEdit [16]
      Left = 65
      Top = 95
      DataBinding.DataField = 'rate'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 278
    end
    object cxDBDateEdit1: TcxDBDateEdit [17]
      Left = 65
      Top = 122
      DataBinding.DataField = 'validfrom'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 278
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Rate Type'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 278
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Currency'
      Control = cxDBLookupComboBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 278
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Rate'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 278
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Valid From'
      Control = cxDBDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 278
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM rate_tab')
  end
end
