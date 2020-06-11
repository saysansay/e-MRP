unit uAccGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, cxContainer, cxEdit, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, Data.DB, DBAccess, Uni, MemDS, dxLayoutContainer,
  cxClasses, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxDBEdit;

type
  TfrmAccGroup = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccGroup: TfrmAccGroup;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmAccGroup.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmAccGroup.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT accgroup as ACCOUNTING_GROUP,description as DESCRIPTION FROM accgroup_tab');
  frmBaseFind.sSQLFind :='SELECT accgroup as ACCOUNTING_GROUP,description as DESCRIPTION FROM accgroup_tab WHERE accgroup LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM accgroup_tab WHERE accgroup LIKE'+QuotedStr(frmBaseFind.ReturnValue));
end;

procedure TfrmAccGroup.btnRefreshClick(Sender: TObject);
begin
  inherited;
   OpenSQL('SELECT * FROM accgroup_tab');
end;

procedure TfrmAccGroup.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM accgroup_tab WHERE accgroup='+QuotedStr(qrStgBase.FieldByName('accgroup').AsString))=True then
    begin
       MessageDlg('Accounting Group already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmAccGroup.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmAccGroup.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM accgroup_tab limit 100');
end;

end.
