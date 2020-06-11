unit uProductCode;

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
  TfrmProductCode = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProductCode: TfrmProductCode;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmProductCode.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmProductCode.btnFindClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT productcode as PRODUCT_CODE,description as DESCRIPTION FROM productcode_tab');
  frmBaseFind.sSQLFind :='SELECT productcode as PRODUCT_CODE,description as DESCRIPTION FROM productcode_tab WHERE productcode LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM productcode_tab WHERE productcode LIKE'+QuotedStr(frmBaseFind.ReturnValue));
end;

procedure TfrmProductCode.btnRefreshClick(Sender: TObject);
begin
  inherited;
   OpenSQL('SELECT * FROM productcode_tab limit 100');
end;

procedure TfrmProductCode.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM productcode_tab WHERE productcode='+QuotedStr(qrStgBase.FieldByName('productcode').AsString))=True then
    begin
       MessageDlg('Product Code already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmProductCode.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmProductCode.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM productcode_tab limit 100');
end;

end.
