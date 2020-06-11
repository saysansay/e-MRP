unit uProductFamily;

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
  TfrmProductFamily = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProductFamily: TfrmProductFamily;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmProductFamily.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmProductFamily.btnFindClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT productfamily as PRODUCT_FAMILY,description as DESCRIPTION FROM productfamily_tab');
  frmBaseFind.sSQLFind :='SELECT productfamily as PRODUCT_FAMILY,description as DESCRIPTION FROM productfamily_tab WHERE productfamily LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM productfamily_tab WHERE productfamily LIKE'+QuotedStr(frmBaseFind.ReturnValue));
end;

procedure TfrmProductFamily.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM productfamily_tab LIMIT 100');
end;

procedure TfrmProductFamily.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM productfamily_tab WHERE productfamily='+QuotedStr(qrStgBase.FieldByName('productfamily').AsString))=True then
    begin
       MessageDlg('Product Family already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmProductFamily.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmProductFamily.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM productfamily_tab LIMIT 100');
end;

end.
