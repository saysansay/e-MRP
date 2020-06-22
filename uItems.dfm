inherited frmItems: TfrmItems
  Caption = 'Items Parts'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DL100001: TdxLayoutControl
    inherited btnNew: TcxButton
      TabOrder = 12
    end
    inherited btnEdit: TcxButton
      TabOrder = 13
    end
    inherited btnDelete: TcxButton
      TabOrder = 16
    end
    inherited btnDuplicate: TcxButton
      TabOrder = 17
      OnClick = btnDuplicateClick
    end
    inherited btnRefresh: TcxButton
      TabOrder = 18
      OnClick = btnRefreshClick
    end
    inherited btnFind: TcxButton
      TabOrder = 19
      OnClick = btnFindClick
    end
    inherited btnSave: TcxButton
      TabOrder = 14
      OnClick = btnSaveClick
    end
    inherited btnCancel: TcxButton
      TabOrder = 15
    end
    object cxDBTextEdit1: TcxDBTextEdit [14]
      Left = 65
      Top = 41
      DataBinding.DataField = 'partno'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 204
    end
    object cxDBTextEdit2: TcxDBTextEdit [15]
      Left = 65
      Top = 68
      DataBinding.DataField = 'partname'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 204
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox [16]
      Left = 65
      Top = 95
      DataBinding.DataField = 'part_type'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Description'
          FieldName = 'description'
        end>
      Properties.ListSource = dmMRP.dsPartType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 10
      Width = 204
    end
    object cxDBTextEdit3: TcxDBTextEdit [17]
      Left = 345
      Top = 41
      DataBinding.DataField = 'planner'
      DataBinding.DataSource = dsStgBase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 193
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox [18]
      Left = 345
      Top = 68
      DataBinding.DataField = 'product_code'
      DataBinding.DataSource = dsStgBase
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.KeyFieldNames = 'productcode'
      Properties.ListColumns = <
        item
          FieldName = 'productcode'
        end>
      Properties.ListSource = dmMRP.dsPCode
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 193
    end
    object cxPageControl1: TcxPageControl [19]
      Left = 10
      Top = 122
      Width = 581
      Height = 248
      TabOrder = 11
      Properties.ActivePage = tabInv
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 244
      ClientRectLeft = 4
      ClientRectRight = 577
      ClientRectTop = 24
      object tabStorage: TcxTabSheet
        Caption = 'Storage'
        ImageIndex = 0
        object dxLayoutControl1: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 573
          Height = 220
          Align = alClient
          TabOrder = 0
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 84
            Top = 10
            DataBinding.DataField = 'storage_width'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 0
            Width = 121
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 84
            Top = 37
            DataBinding.DataField = 'storage_height'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 1
            Width = 121
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 84
            Top = 64
            DataBinding.DataField = 'storage_depth'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 2
            Width = 121
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 84
            Top = 91
            DataBinding.DataField = 'storage_weigth'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 3
            Width = 121
          end
          object cxDBTextEdit11: TcxDBTextEdit
            Left = 84
            Top = 118
            DataBinding.DataField = 'min_storage_humadity'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 4
            Width = 121
          end
          object cxDBTextEdit12: TcxDBTextEdit
            Left = 84
            Top = 145
            DataBinding.DataField = 'max_storage_humadity'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 5
            Width = 121
          end
          object dxLayoutControl1Group_Root: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem21: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Width'
            Control = cxDBTextEdit4
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem22: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Height'
            Control = cxDBTextEdit5
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutItem23: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Depth'
            Control = cxDBTextEdit6
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object dxLayoutItem24: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Weigth'
            Control = cxDBTextEdit7
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object dxLayoutItem32: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Min.Humadity'
            Control = cxDBTextEdit11
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 4
          end
          object dxLayoutItem33: TdxLayoutItem
            Parent = dxLayoutControl1Group_Root
            CaptionOptions.Text = 'Max.Humadity'
            Control = cxDBTextEdit12
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 5
          end
        end
      end
      object tabInv: TcxTabSheet
        Caption = 'Inventory'
        ImageIndex = 1
        object dxLayoutControl2: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 573
          Height = 220
          Align = alClient
          TabOrder = 0
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 10
            Top = 10
            Caption = 'Allow Negative Onhand'
            DataBinding.DataField = 'negative_onhand_allow'
            DataBinding.DataSource = dsStgBase
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 0
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 92
            Top = 37
            DataBinding.DataField = 'dimension'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 1
            Width = 145
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 92
            Top = 64
            DataBinding.DataField = 'net_volume'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 2
            Width = 145
          end
          object cxDBTextEdit10: TcxDBTextEdit
            Left = 92
            Top = 91
            DataBinding.DataField = 'net_weight'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 3
            Width = 145
          end
          object cxDBCheckBox2: TcxDBCheckBox
            Left = 10
            Top = 118
            Caption = 'Active'
            DataBinding.DataField = 'part_status'
            DataBinding.DataSource = dsStgBase
            Properties.ValueChecked = 'A'
            Properties.ValueUnchecked = 'N'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 4
          end
          object cxDBCheckBox3: TcxDBCheckBox
            Left = 10
            Top = 145
            Caption = 'Lot'
            DataBinding.DataField = 'lot'
            DataBinding.DataSource = dsStgBase
            Properties.DisplayChecked = 'Y'
            Properties.DisplayUnchecked = 'N'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 5
          end
          object cxDBCheckBox4: TcxDBCheckBox
            Left = 10
            Top = 172
            Caption = 'Expire Date'
            DataBinding.DataField = 'expire_date'
            DataBinding.DataSource = dsStgBase
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 6
          end
          object cxDBComboBox1: TcxDBComboBox
            Left = 92
            Top = 199
            DataBinding.DataField = 'inv_valution_method'
            DataBinding.DataSource = dsStgBase
            Properties.Items.Strings = (
              'FIFO'
              'AVERAGE'
              'STANDARD COST')
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 7
            Width = 145
          end
          object cxDBLookupComboBox3: TcxDBLookupComboBox
            Left = 92
            Top = 226
            DataBinding.DataField = 'inv_uom'
            DataBinding.DataSource = dsStgBase
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'uom'
            Properties.ListColumns = <
              item
                FieldName = 'uom'
              end>
            Properties.ListSource = dmMRP.dsUom
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 8
            Width = 145
          end
          object cxDBTextEdit15: TcxDBTextEdit
            Left = 92
            Top = 253
            DataBinding.DataField = 'safety_stock'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 9
            Width = 145
          end
          object dxLayoutControl2Group_Root: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem25: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'cxDBCheckBox1'
            CaptionOptions.Visible = False
            Control = cxDBCheckBox1
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem26: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'Dimension'
            Control = cxDBTextEdit8
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutItem27: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'Net Volume'
            Control = cxDBTextEdit9
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object dxLayoutItem28: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'Net Weigth'
            Control = cxDBTextEdit10
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object dxLayoutItem29: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'cxDBCheckBox2'
            CaptionOptions.Visible = False
            Control = cxDBCheckBox2
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 101
            ControlOptions.ShowBorder = False
            Index = 4
          end
          object dxLayoutItem30: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'cxDBCheckBox3'
            CaptionOptions.Visible = False
            Control = cxDBCheckBox3
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 101
            ControlOptions.ShowBorder = False
            Index = 5
          end
          object dxLayoutItem31: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'cxDBCheckBox4'
            CaptionOptions.Visible = False
            Control = cxDBCheckBox4
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 101
            ControlOptions.ShowBorder = False
            Index = 6
          end
          object dxLayoutItem34: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'Valution Method'
            Control = cxDBComboBox1
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 7
          end
          object dxLayoutItem35: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'UOM'
            Control = cxDBLookupComboBox3
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 145
            ControlOptions.ShowBorder = False
            Index = 8
          end
          object dxLayoutItem38: TdxLayoutItem
            Parent = dxLayoutControl2Group_Root
            CaptionOptions.Text = 'Safety Stock'
            Control = cxDBTextEdit15
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 9
          end
        end
      end
      object tabOther: TcxTabSheet
        Caption = 'Other'
        ImageIndex = 2
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 573
          Height = 220
          Align = alClient
          TabOrder = 0
          object cxDBTextEdit13: TcxDBTextEdit
            Left = 75
            Top = 10
            DataBinding.DataField = 'hs_code'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 0
            Width = 121
          end
          object cxDBTextEdit14: TcxDBTextEdit
            Left = 75
            Top = 37
            DataBinding.DataField = 'safety_code'
            DataBinding.DataSource = dsStgBase
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            TabOrder = 1
            Width = 121
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem36: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Text = 'HS Code'
            Control = cxDBTextEdit13
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem37: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Text = 'Safety Code'
            Control = cxDBTextEdit14
            ControlOptions.OriginalHeight = 21
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
        end
      end
    end
    inherited LY10001: TdxLayoutGroup
      ItemIndex = 1
    end
    inherited LY10003: TdxLayoutGroup
      AlignHorz = ahClient
      ItemIndex = 5
    end
    inherited dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      AlignVert = avClient
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Part No'
      Control = cxDBTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 204
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Part Name'
      Control = cxDBTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 204
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Part Type'
      Control = cxDBLookupComboBox1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 204
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object LY0005: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      Index = -1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'Planner'
      Control = cxDBTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = LY10001
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignVert = avClient
      CaptionOptions.Text = 'Product Code'
      Control = cxDBLookupComboBox2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = LY10001
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = LY10001
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxPageControl1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  inherited qrStgBase: TUniQuery
    SQL.Strings = (
      'SELECT * FROM inv_parts_tab')
    BeforePost = qrStgBaseBeforePost
  end
end
