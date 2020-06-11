unit uStgBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses,
  dxLayoutContainer, dxLayoutControl, Vcl.Menus, dxLayoutControlAdapters,
  Vcl.StdCtrls, cxButtons, Data.DB, MemDS, DBAccess, Uni,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit;

type
  TfrmStgBase = class(TForm)
    DL100001Group_Root: TdxLayoutGroup;
    DL100001: TdxLayoutControl;
    LY10001: TdxLayoutGroup;
    LY10002: TdxLayoutGroup;
    btnNew: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    btnEdit: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    btnDelete: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    btnDuplicate: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    btnRefresh: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    btnFind: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    qrStgBase: TUniQuery;
    dsStgBase: TUniDataSource;
    qrCMD: TUniQuery;
    btnSave: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    LY10003: TdxLayoutGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    btnFirst: TcxButton;
    dxLayoutItem14: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem15: TdxLayoutItem;
    txtRecord: TcxSpinEdit;
    dxLayoutItem16: TdxLayoutItem;
    txtTotal: TcxSpinEdit;
    dxLayoutItem17: TdxLayoutItem;
    btnNext: TcxButton;
    dxLayoutItem18: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem19: TdxLayoutItem;
    procedure dsStgBaseStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
    procedure btnFirstClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    {Protected declarations}
    procedure CopyRow;
    procedure ExecSQL(sSQL :string);overload;
    procedure ExecSQL(sSQL ,sWHERE:string);overload;
    procedure OpenSQL(sSQL :string);overload;
    procedure OpenSQL(sSQL,sWHERE :string);overload;
    procedure OpenSQL(sSQL,sWHERE,sOrderBy :string);overload;
    function RowExist(sSQL :string):Boolean;

  public
    { Public declarations }
  end;

var
  frmStgBase: TfrmStgBase;

implementation

{$R *.dfm}

uses dm;

procedure TfrmStgBase.btnCancelClick(Sender: TObject);
begin
  if qrStgBase.State in [dsInsert,dsEdit] then
     qrStgBase.Cancel;
end;

procedure TfrmStgBase.btnDeleteClick(Sender: TObject);
begin
  if not qrStgBase.IsEmpty then
  begin
     if MessageDlg('Delete this record ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        qrStgBase.Delete
  end
  else
    MessageDlg('No data can be delete!',mtInformation,[mbOK],0);
end;

procedure TfrmStgBase.btnEditClick(Sender: TObject);
begin
  if not qrStgBase.IsEmpty then
     qrStgBase.Edit
  else
    MessageDlg('No data can be edit!',mtInformation,[mbOK],0);
end;

procedure TfrmStgBase.btnFirstClick(Sender: TObject);
begin
  qrStgBase.First;
end;

procedure TfrmStgBase.btnNewClick(Sender: TObject);
begin
  qrStgBase.Insert;
end;

procedure TfrmStgBase.btnNextClick(Sender: TObject);
begin
  qrStgBase.Next;
end;

procedure TfrmStgBase.CopyRow;
var varCopyData: Variant;
    i: Integer;
begin
  with dsStgBase.DataSet do
  begin
    varCopyData := VarArrayCreate([0, FieldCount-1], varVariant);
    for i := 1 to FieldCount-1 do
      varCopyData[i] := Fields[i].Value;

    Insert;

    for i := 0 to FieldCount-1 do
      Fields[i].Value := varCopyData[i];
  end;
end;

procedure TfrmStgBase.cxButton1Click(Sender: TObject);
begin
  qrStgBase.Last;
end;

procedure TfrmStgBase.cxButton2Click(Sender: TObject);
begin
  qrStgBase.Prior;
end;

procedure TfrmStgBase.ExecSQL(sSQL: string);
begin
  with qrCMD do
  begin
    Close;
    SQL.Text :=sSQL;
    Execute;
  end;
end;

procedure TfrmStgBase.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  txtRecord.Value :=qrStgBase.RecNo;
  txtTotal.Value :=qrStgBase.RecordCount;
end;

procedure TfrmStgBase.dsStgBaseStateChange(Sender: TObject);
begin
  if qrStgBase.State in [dsInsert,dsEdit] then
  begin
    btnNew.Enabled :=False;
    btnEdit.Enabled :=False;
    btnSave.Enabled :=True;
    btnCancel.Enabled :=True;
    btnDelete.Enabled :=False;
    btnDuplicate.Enabled :=False;
    btnRefresh.Enabled :=False;
    btnFind.Enabled :=False;
  end
  else
    begin
      btnNew.Enabled :=True;
      btnEdit.Enabled :=True;
      btnSave.Enabled :=False;
      btnCancel.Enabled :=False;
      btnDelete.Enabled :=True;
      btnDuplicate.Enabled :=True;
      btnRefresh.Enabled :=True;
      btnFind.Enabled :=True;
    end;
end;

procedure TfrmStgBase.ExecSQL(sSQL, sWHERE: string);
begin
  with qrCMD do
  begin
    Close;
    SQL.Text :=sSQL + sWHERE;
    Execute;
  end;
end;

procedure TfrmStgBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmStgBase :=nil;
end;

procedure TfrmStgBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if qrStgBase.State in [dsInsert,dsEdit] then
  begin
     CanClose := False;
    if MessageDlg('Please save data!',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       qrStgBase.Post
    else
      qrStgBase.Cancel;
     CanClose :=True
  end
end;

procedure TfrmStgBase.OpenSQL(sSQL, sWHERE, sOrderBy: string);
begin
  with qrStgBase do
  begin
    Close;
    SQL.Text :=sSQL + sWHERE + sOrderBy;
    Open;
  end;
end;

function TfrmStgBase.RowExist(sSQL: string): Boolean;
begin
  with qrCMD do
  begin
    Close;
    SQL.Text :=sSQL;
    Open;
  end;
  if qrCMD.FieldByName('ct').AsInteger > 0  then
      Result :=True
  else
     Result :=False;
end;

procedure TfrmStgBase.OpenSQL(sSQL, sWHERE: string);
begin
  with qrStgBase do
  begin
    Close;
    SQL.Text :=sSQL + sWHERE;
    Open;
  end;
end;

procedure TfrmStgBase.OpenSQL(sSQL: string);
begin
  with qrStgBase do
  begin
    Close;
    SQL.Text :=sSQL;
    Open;
  end;
end;

end.
