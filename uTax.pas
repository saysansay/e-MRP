unit uTax;

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
  TfrmTaxCode = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTaxCode: TfrmTaxCode;

implementation

{$R *.dfm}

procedure TfrmTaxCode.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmTaxCode.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM tax_tab limit 100');
end;

procedure TfrmTaxCode.btnSaveClick(Sender: TObject);
begin
  inherited;
    if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM tax_tab WHERE taxcode='+QuotedStr(qrStgBase.FieldByName('taxcode').AsString))=true then
    begin
       MessageDlg('TaxCode already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmTaxCode.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM tax_tab limit 100');
end;

end.
