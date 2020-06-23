unit uBaseMstDtl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses, dxBar,
  dxLayoutContainer, dxLayoutControl, Vcl.Menus, dxLayoutControlAdapters,
  Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni, QImport3Wizard, cxLabel,
  cxBarEditItem, dxRibbon, dxLayoutLookAndFeels;

type
  TfrmBaseMstDtl = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxBarDockControl1: TdxBarDockControl;
    Bar10001: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    LY0001: TdxLayoutGroup;
    LY0002: TdxLayoutGroup;
    LY0003: TdxLayoutGroup;
    btnHNew: TdxBarButton;
    btnHEdit: TdxBarButton;
    btnHDelete: TdxBarButton;
    btnHSave: TdxBarButton;
    btnHCancel: TdxBarButton;
    grDetailDB: TcxGridDBTableView;
    grDetailLevel1: TcxGridLevel;
    grDetail: TcxGrid;
    dxLayoutItem4: TdxLayoutItem;
    qrMST: TUniQuery;
    dsMST: TUniDataSource;
    qrDTL: TUniQuery;
    dsDTL: TUniDataSource;
    btnHReport: TdxBarSubItem;
    btnHPreview: TdxBarButton;
    btnHDesign: TdxBarButton;
    btnHFind: TdxBarButton;
    qrCMD: TUniQuery;
    Bar10001Bar1: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    dxLayoutItem2: TdxLayoutItem;
    BtnDNew: TdxBarButton;
    btnDEdit: TdxBarButton;
    btnDDel: TdxBarButton;
    btnDCopy: TdxBarButton;
    dtlImport: TQImport3Wizard;
    PopDetail: TdxBarPopupMenu;
    btnDSave: TdxBarButton;
    btnDCancel: TdxBarButton;
    popupHeader: TdxRibbonPopupMenu;
    btnHRefresh: TdxBarButton;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsMSTStateChange(Sender: TObject);
    procedure btnDNewClick(Sender: TObject);
    procedure btnDEditClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnHNewClick(Sender: TObject);
    procedure btnHEditClick(Sender: TObject);
    procedure btnHDeleteClick(Sender: TObject);
    procedure btnHCancelClick(Sender: TObject);
    procedure dsDTLStateChange(Sender: TObject);
    procedure btnDCopyClick(Sender: TObject);
    procedure btnDDelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FParentID :string;
    FParentNo :string;
    FField    :string;
    FTable   :string;
    FStatus :string;
    procedure SetStatus(value: string);
    function GetStatus :string;
    procedure SetParent(value :string);
    function GetParent : string;
    procedure SetParentNo(value : string);
    function  GetParentNo :string;
    procedure SetField(Value : string);
    function GetField:string;
    procedure setTable(value:string);
    function getTable:string;
    procedure CopyRow;
  protected
     procedure OpenMST(sSQL :string);
     procedure OpenDTL(sSQL :string);
     function ParentNotEmpty(FParentID:string):Boolean;
     function AutoNumber(Prefix,Separator,Suffix,FTableName :string):string;
     procedure AssingStatus;
     procedure DeleteDetail(ParentNo,FTable,FField :string);
  public
    { Public declarations }
    property ParentID :string read GetParent write SetParent;
    property Status :string read GetStatus write SetStatus;
    property ParentNo :string read GetParentNo write SetParentNo;
    property FieldDetail :string read GetField write SetField;
    property TableDetail :string read getTable write setTable;
  end;

var
  frmBaseMstDtl: TfrmBaseMstDtl;

implementation

{$R *.dfm}

uses dm, eMRP;

procedure TfrmBaseMstDtl.AssingStatus;
begin
   if not qrMST.IsEmpty then
  begin
     Status :=qrMST.FieldByName('flag').AsString;
     //m9001.Caption :=Status;
  end;
end;

function TfrmBaseMstDtl.AutoNumber(Prefix, Separator, Suffix,
  FTableName: string): string;
begin
  with qrCMD do
  begin
    Close;
    SQL.Text :='SELECT MAX(id)no FROM '+FTableName;
    Open;
  end;
  if qrCMD.FieldByName('no').AsString = '' then
     Result :=Prefix + Separator + Suffix + Separator +FormatDateTime('mmyy',Now)+Separator+ FormatFloat('000000',1)
  else
     Result :=Prefix + Separator + Suffix + Separator + FormatDateTime('mmyy',Now)+Separator+FormatFloat('000000',qrCMD.FieldByName('no').AsInteger);

end;

procedure TfrmBaseMstDtl.btnDCopyClick(Sender: TObject);
begin
  CopyRow;
end;

procedure TfrmBaseMstDtl.btnDDelClick(Sender: TObject);
begin
   if not qrDTL.IsEmpty then
  begin
    if MessageDlg('Delete this record ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       qrDTL.Delete;
  end
  else
    MessageDlg('Data is empty!',mtConfirmation,[mbOK],0);
end;

procedure TfrmBaseMstDtl.btnDEditClick(Sender: TObject);
begin
  qrDTL.Edit;
end;

procedure TfrmBaseMstDtl.btnDNewClick(Sender: TObject);
begin
   if ParentNotEmpty (ParentID) = True then
      MessageDlg('Data header can not empty!',mtInformation,[mbOK],0)
   else
     qrDTL.Insert;
end;

procedure TfrmBaseMstDtl.btnHCancelClick(Sender: TObject);
begin
  
  if qrMST.State in [dsInsert,dsEdit] then
     qrMST.Cancel;
end;

procedure TfrmBaseMstDtl.btnHDeleteClick(Sender: TObject);
begin
    if Status ='OPEN' then
    begin
      if MessageDlg('delete this transaction ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        qrMST.Delete;
        DeleteDetail(ParentNo,TableDetail,FieldDetail);
      end;
    end
    else
       MessageDlg('this transaction cannot be deleted?',mtConfirmation,[mbOK],0);

end;

procedure TfrmBaseMstDtl.btnHEditClick(Sender: TObject);
begin
  qrMST.Edit;
end;

procedure TfrmBaseMstDtl.btnHNewClick(Sender: TObject);
begin
  qrMST.Insert;
end;

procedure TfrmBaseMstDtl.CopyRow;
    var varCopyData: Variant;
    i: Integer;
begin
  if not qrDTL.IsEmpty then
  begin
    with dsDTL.DataSet do
    begin
      varCopyData := VarArrayCreate([0, FieldCount-1], varVariant);
      for i := 1 to FieldCount-1 do
        varCopyData[i] := Fields[i].Value;

      Insert;
      for i := 0 to FieldCount-1 do
        Fields[i].Value := varCopyData[i];
    end;
  end
    else
      MessageDlg('Data is empty !',mtInformation,[mbOK],0);
end;

procedure TfrmBaseMstDtl.cxButton1Click(Sender: TObject);
begin
  CopyRow;
end;

procedure TfrmBaseMstDtl.DeleteDetail(ParentNo,FTable,FField: string);
begin
  with qrCMD do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='DELETE FROM '+FTable +' WHERE '+FField +' ='+QuotedStr(ParentNo);
    Execute;
  end;
end;

procedure TfrmBaseMstDtl.dsDTLStateChange(Sender: TObject);
begin
  if qrDTL.State in [dsInsert,dsEdit] then
  begin
    BtnDNew.Enabled :=False;
    btnDEdit.Enabled :=False;
    btnDDel.Enabled :=False;
    btnDCopy.Enabled :=False;
  end
  else
    begin
      BtnDNew.Enabled :=True;
      btnDEdit.Enabled :=True;
      btnDDel.Enabled :=True;
      btnDCopy.Enabled :=True;
    end;
    if qrDTL.IsEmpty then 
    begin
      BtnDNew.Enabled :=True;
      btnDEdit.Enabled :=False;
      btnDDel.Enabled :=False;
      btnDCopy.Enabled :=False;
    end;

end;

procedure TfrmBaseMstDtl.dsMSTStateChange(Sender: TObject);
begin
  if qrMST.State in [dsInsert,dsEdit] then
  begin
    btnHNew.Enabled :=False;
    btnHEdit.Enabled :=False;
    btnHDelete.Enabled :=False;
    btnHSave.Enabled :=True;
    btnHCancel.Enabled :=True;
    btnHFind.Enabled :=False;
    btnHReport.Enabled :=False;
  end
  else
    begin
      btnHNew.Enabled :=True;
      btnHEdit.Enabled :=True;
      btnHDelete.Enabled :=True;
      btnHSave.Enabled :=False;
      btnHCancel.Enabled :=False;
      btnHFind.Enabled :=True;
      btnHReport.Enabled :=True;
    end;
    if qrMST.IsEmpty then
    begin
      btnHNew.Enabled :=True;
      btnHEdit.Enabled :=False;
      btnHDelete.Enabled :=False;
      btnHSave.Enabled :=False;
      btnHCancel.Enabled :=False;
      btnHFind.Enabled :=False;
      btnHReport.Enabled :=False;
    end;
    
end;

procedure TfrmBaseMstDtl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
  frmBaseMstDtl :=nil;
end;

procedure TfrmBaseMstDtl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
     SelectNext(ActiveControl,True,True);
end;

function TfrmBaseMstDtl.GetField: string;
begin
  Result :=FField;
end;

function TfrmBaseMstDtl.GetParent: string;
begin
  Result :=FParentID;
end;

function TfrmBaseMstDtl.GetParentNo: string;
begin
  Result :=FParentNo;
end;

function TfrmBaseMstDtl.GetStatus: string;
begin
  Result :=FStatus;
end;

function TfrmBaseMstDtl.getTable: string;
begin
  Result :=FTable;
end;

procedure TfrmBaseMstDtl.OpenDTL(sSQL: string);
begin
  with qrDTL do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=sSQL;
    Open;
  end;
end;

procedure TfrmBaseMstDtl.OpenMST(sSQL: string);
begin
  with qrMST do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=sSQL;
    Open;
  end;
end;

function TfrmBaseMstDtl.ParentNotEmpty(FParentID: string): Boolean;
begin
  if FParentID <> '' then
     Result :=True
  else
     Result :=False;
end;

procedure TfrmBaseMstDtl.SetField(Value: string);
begin
  FField :=value;
end;

procedure TfrmBaseMstDtl.SetParent(value: string);
begin
  FParentID :=value;
end;

procedure TfrmBaseMstDtl.SetParentNo(value: string);
begin
  FParentNo :=value;
end;

procedure TfrmBaseMstDtl.SetStatus(value: string);
begin
  FStatus :=value;
end;

procedure TfrmBaseMstDtl.setTable(value: string);
begin
  FTable :=value;
end;

end.
