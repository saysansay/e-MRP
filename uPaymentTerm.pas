unit uPaymentTerm;

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
  TfrmPaymentTerm = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaymentTerm: TfrmPaymentTerm;

implementation

{$R *.dfm}

uses fBaseFind;

procedure TfrmPaymentTerm.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmPaymentTerm.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT TERM_CODE,DESCRIPTION,TERM_DAY FROM paymentterm_tab');
  frmBaseFind.sSQLFind :='SELECT TERM_CODE,DESCRIPTION,TERM_DAY FROM paymentterm_tab WHERE term_code LIKE :f1 OR description LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM paymentterm_tab WHERE term_code LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmPaymentTerm.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM paymentterm_tab LIMIT 100');
end;

procedure TfrmPaymentTerm.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM paymentterm_tab WHERE term_code='+QuotedStr(qrStgBase.FieldByName('term_code').AsString))=True then
    begin
       MessageDlg('Term Code already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmPaymentTerm.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM paymentterm_tab LIMIT 100');
end;

end.
