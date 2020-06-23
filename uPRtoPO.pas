unit uPRtoPO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses,
  dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxButtonEdit,
  MemDS, DBAccess, Uni;

type
  TfrmPRtoPO = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup2: TdxLayoutGroup;
    grPRDBtbl: TcxGridDBTableView;
    grPRLevel1: TcxGridLevel;
    grPR: TcxGrid;
    dxLayoutItem3: TdxLayoutItem;
    cxButtonEdit1: TcxButtonEdit;
    dxLayoutItem4: TdxLayoutItem;
    qrPR: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRtoPO: TfrmPRtoPO;

implementation

{$R *.dfm}

uses dm;

end.
