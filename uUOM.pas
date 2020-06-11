unit uUOM;

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
  TfrmUOM = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUOM: TfrmUOM;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmUOM.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmUOM.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT accgroup as ACCOUNTING_GROUP,description as DESCRIPTION FROM accgroup_tab');
  frmBaseFind.sSQLFind :='SELECT accgroup as ACCOUNTING_GROUP,description as DESCRIPTION FROM accgroup_tab WHERE accgroup LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM accgroup_tab WHERE accgroup LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmUOM.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM uom_tab LIMIT 100');
end;

procedure TfrmUOM.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM uom_tab WHERE uom='+QuotedStr(qrStgBase.FieldByName('uom').AsString))=True then
    begin
       MessageDlg('UOM already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmUOM.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM uom_tab LIMIT 100');
end;

end.
