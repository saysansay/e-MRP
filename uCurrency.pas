unit uCurrency;

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
  TfrmCurrency = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCurrency: TfrmCurrency;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmCurrency.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmCurrency.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT currency_code as CURRENCY_CODE,description as DESCRIPTION FROM currency_tab');
  frmBaseFind.sSQLFind :='SELECT currency_code as CURRENCY_CODE,description as DESCRIPTION FROM currency_tab WHERE currency_code LIKE :f1 OR description LIKE :f1 ';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM currency_tab WHERE currency_code LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmCurrency.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM currency_tab limit 100');
end;

procedure TfrmCurrency.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM currency_tab WHERE currency_code='+QuotedStr(qrStgBase.FieldByName('currency_code').AsString))=True then
    begin
       MessageDlg('Currency Code already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmCurrency.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmCurrency.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM currency_tab limit 100');
end;

end.
