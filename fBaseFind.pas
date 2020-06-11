unit fBaseFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses,
  dxLayoutContainer, dxLayoutControl, Vcl.Menus, dxLayoutControlAdapters,
  Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutcxEditAdapters, cxContainer, cxTextEdit,
  MemDS, DBAccess, Uni;

type
  TfrmBaseFind = class(TForm)
    LYBF001Group_Root: TdxLayoutGroup;
    LYBF001: TdxLayoutControl;
    LYFB0002: TdxLayoutGroup;
    LYFB0003: TdxLayoutGroup;
    btnOK: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    grFindDBTableView1: TcxGridDBTableView;
    grFindLevel1: TcxGridLevel;
    grFind: TcxGrid;
    dxLayoutItem3: TdxLayoutItem;
    txtFind: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    btnFind: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    qrFind: TUniQuery;
    dsFind: TUniDataSource;
    procedure dsFindDataChange(Sender: TObject; Field: TField);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
    RetVal :string;
    procedure SetRetVal(value:string);
    function GetRetval :string;
    procedure FindSQL;
  public
    { Public declarations }
    sSQLFind :string;
    procedure ShowSQL(sSQL:string);overload;
    procedure ShowSQL (sSQL,sWHERE:string);overload;
    property ReturnValue : string read GetRetval write SetRetVal;
  end;

var
  frmBaseFind: TfrmBaseFind;

implementation

{$R *.dfm}

uses dm;

{ TfrmBaseFind }

procedure TfrmBaseFind.ShowSQL(sSQL: string);
begin
  grFindDBTableView1.DataController.BeginFullUpdate;
  grFindDBTableView1.DataController.ClearDetails;
  with qrFind do
  begin
    Close;
    SQL.Text :=sSQL;
    Open;
  end;
  grFindDBTableView1.DataController.CreateAllItems();
  grFindDBTableView1.DataController.EndFullUpdate;

end;

procedure TfrmBaseFind.btnFindClick(Sender: TObject);
begin
  grFindDBTableView1.DataController.BeginFullUpdate;
  grFindDBTableView1.DataController.ClearDetails;
  FindSQL;
  //ShowMessage(sSQLFind);
  grFindDBTableView1.DataController.CreateAllItems();
  grFindDBTableView1.DataController.EndFullUpdate;
end;

procedure TfrmBaseFind.dsFindDataChange(Sender: TObject; Field: TField);
begin
  RetVal := qrFind.Fields[0].AsString;
end;

procedure TfrmBaseFind.FindSQL;
begin
   with qrFind do
   begin
     Close;
     SQL.Text :=sSQLFind;
     ParamByName('f1').AsString :='%'+txtFind.Text+'%';
     Open;
   end;
end;

function TfrmBaseFind.GetRetval: string;
begin
  Result := RetVal;
end;

procedure TfrmBaseFind.SetRetVal(value: string);
begin
  RetVal :=value;
end;

procedure TfrmBaseFind.ShowSQL(sSQL, sWHERE: string);
begin
  grFindDBTableView1.DataController.BeginFullUpdate;
  grFindDBTableView1.DataController.ClearDetails;
  with qrFind do
  begin
    Close;
    SQL.Text :=sSQL +  sWHERE;
    Open;
  end;
  grFindDBTableView1.DataController.CreateAllItems();
  grFindDBTableView1.DataController.EndFullUpdate;
end;

end.
