unit uRateType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, cxContainer, cxEdit, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, Data.DB, DBAccess, Uni, MemDS, dxLayoutContainer,
  cxClasses, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit;

type
  TfrmRateType = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem11: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRateType: TfrmRateType;

implementation

{$R *.dfm}

uses dm, fBaseFind;

procedure TfrmRateType.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmRateType.btnFindClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT ratetype as RATE_TYPE,description as DESCRIPTION,currency_code as CURRENCY_CODE FROM ratetype_tab');
  frmBaseFind.sSQLFind :='SELECT ratetype as RATE_TYPE,description as DESCRIPTION,currency_code as CURRENCY_CODE FROM ratetype_tab WHERE ratetype LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM ratetype_tab WHERE ratetype LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmRateType.btnRefreshClick(Sender: TObject);
begin
  inherited;
   OpenSQL('SELECT * FROM ratetype_tab LIMIT 100');
   dmMRP.OpenCurrency;
end;

procedure TfrmRateType.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM ratetype_tab WHERE ratetype='+QuotedStr(qrStgBase.FieldByName('ratetype').AsString))=True then
    begin
       MessageDlg('Rate Type already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmRateType.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM ratetype_tab LIMIT 100');
  dmMRP.OpenCurrency;
end;

end.
