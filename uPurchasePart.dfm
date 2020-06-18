inherited frmPurchasePart: TfrmPurchasePart
  Caption = 'Purchase Part/Expanse'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 8
    end
    inherited btnEdit: TcxButton
      TabOrder = 9
    end
    inherited btnDelete: TcxButton
      TabOrder = 12
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 13
    end
    inherited btnRefresh: TcxButton
      TabOrder = 14
    end
    inherited btnFind: TcxButton
      TabOrder = 15
    end
    inherited btnSave: TcxButton
      TabOrder = 10
    end
    inherited btnCancel: TcxButton
      TabOrder = 11
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 85
      Top = 41
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 506
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 85
      Top = 68
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 506
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = LY10001
      CaptionOptions.Text = 'cxDBTextEdit1'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = LY10001
      CaptionOptions.Text = 'cxDBTextEdit2'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM purchasepart_tab')
  end
end
