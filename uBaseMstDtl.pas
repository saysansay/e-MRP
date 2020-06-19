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
  cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni, QImport3Wizard;

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
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
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
    btnDImport: TdxBarButton;
    dtlImport: TQImport3Wizard;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsMSTStateChange(Sender: TObject);
    procedure btnDNewClick(Sender: TObject);
    procedure btnDEditClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnDdeleteClick(Sender: TObject);
    procedure btnHNewClick(Sender: TObject);
    procedure btnHEditClick(Sender: TObject);
    procedure btnHDeleteClick(Sender: TObject);
    procedure btnHCancelClick(Sender: TObject);
    procedure dsDTLStateChange(Sender: TObject);
  private
    { Private declarations }
    FParentID :string;

    procedure SetParent(value :string);
    function GetParent : string;
    procedure CopyRow;
  protected
     procedure OpenMST(sSQL :string);
     procedure OpenDTL(sSQL :string);
     function ParentNotEmpty(FParentID:string):Boolean;
     function AutoNumber(Prefix,Separator,Suffix,FTableName :string):string;
  public
    { Public declarations }
    property ParentID :string read GetParent write SetParent;
  end;

var
  frmBaseMstDtl: TfrmBaseMstDtl;

implementation

{$R *.dfm}

uses dm, eMRP;

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

procedure TfrmBaseMstDtl.btnDdeleteClick(Sender: TObject);
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
  qrMST.Delete;
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

procedure TfrmBaseMstDtl.dsDTLStateChange(Sender: TObject);
begin
   if qrDTL.State in [dsInsert,dsEdit] then
  begin
    BtnDNew.Enabled :=False;
    btnDEdit.Enabled :=False;
    btnDDel.Enabled :=False;
    btnDImport.Enabled :=False;
  end
  else
    begin
      BtnDNew.Enabled :=True;
      btnDEdit.Enabled :=True;
      btnDDel.Enabled :=True;
      btnDImport.Enabled :=True;
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
end;

procedure TfrmBaseMstDtl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
  frmBaseMstDtl :=nil;
end;

function TfrmBaseMstDtl.GetParent: string;
begin
  Result :=FParentID;
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

procedure TfrmBaseMstDtl.SetParent(value: string);
begin
  FParentID :=value;
end;

end.
