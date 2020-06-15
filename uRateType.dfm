inherited frmRateType: TfrmRateType
  Caption = 'Rate Type'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 9
    end
    inherited btnEdit: TcxButton
      TabOrder = 10
    end
    inherited btnDelete: TcxButton
      TabOrder = 13
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 14
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 15
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 16
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 11
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 12
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 68
      Top = 41
      DataBinding.DataField = 'ratetype'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 283
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 68
      Top = 68
      DataBinding.DataField = 'description'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 283
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [16]
      Left = 68
      Top = 95
      DataBinding.DataField = 'currency_code'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'currency_code'
      Properties.ListColumns = <
        item
          Caption = 'Currency'
          FieldName = 'currency_code'
        end
        item
          Caption = 'Description'
          FieldName = 'description'
        end>
      Properties.ListSource = dmMRP.dsCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Width = 283
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Rate Type'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 283
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Description'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 283
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Currency'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 283
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM ratetype_tab')
  end
end
