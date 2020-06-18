unit uSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, cxContainer, cxEdit, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, Data.DB, DBAccess, Uni, MemDS, dxLayoutContainer,
  cxClasses, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmSupplier = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    cxDBTextEdit8: TcxDBTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    cxDBTextEdit9: TcxDBTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    cxDBTextEdit10: TcxDBTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem25: TdxLayoutItem;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    dxLayoutItem26: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSupplier: TfrmSupplier;

implementation

{$R *.dfm}

uses fBaseFind, dm;

procedure TfrmSupplier.btnDuplicateClick(Sender: TObject);
begin
  inherited;
   CopyRow;
end;

procedure TfrmSupplier.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT SUPPLIER_CODE,SUPPLIER_NAME FROM supplier_tab');
  frmBaseFind.sSQLFind :='SELECT SUPPLIER_CODE,SUPPLIER_NAME FROM supplier_tab WHERE supplier_code LIKE :f1 OR supplier_name LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM supplier_tab WHERE supplier_code LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmSupplier.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM supplier_tab LIMIT 100');
  dmMRP.OpenCurrency;
  dmMRP.OpenTerm;
end;

procedure TfrmSupplier.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM supplier_tab WHERE supplier_code='+QuotedStr(qrStgBase.FieldByName('supplier_code').AsString))=True then
    begin
       MessageDlg('Supplier Code already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmSupplier.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM supplier_tab LIMIT 100');
  dmMRP.OpenCurrency;
  dmMRP.OpenTerm;
end;

end.
