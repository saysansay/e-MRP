unit uPurchasePart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, cxContainer, cxEdit, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, Data.DB, DBAccess, Uni, MemDS, dxLayoutContainer,
  cxClasses, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxDBEdit, cxCheckBox, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmPurchasePart = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem12: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    dxLayoutItem22: TdxLayoutItem;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    dxLayoutItem23: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    dxLayoutItem25: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure cxDBCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPurchasePart: TfrmPurchasePart;

implementation

{$R *.dfm}

uses dm, fBaseFind;

procedure TfrmPurchasePart.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmPurchasePart.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT PURCH_PARTNO,PURCH_PARTNAME,PRIMARY_SUPPLIER FROM purchasepart_tab');
  frmBaseFind.sSQLFind :='SELECT PURCH_PARTNO,PURCH_PARTNAME,PRIMARY_SUPPLIER FROM purchasepart_tab  WHERE purch_partno LIKE :f1 OR purch_partname LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM purchasepart_tab WHERE purch_partno LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmPurchasePart.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM purchasepart_tab LIMIT 100');
  dmMRP.OpenSupplier;
  dmMRP.OpenInvParts;
  dmMRP.OpenTax;
end;

procedure TfrmPurchasePart.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM purchasepart_tab WHERE purch_partno='+QuotedStr(qrStgBase.FieldByName('purch_partno').AsString)+
    ' AND primary_supplier='+QuotedStr(qrStgBase.FieldByName('primary_supplier').AsString))=true then
    begin
       MessageDlg('Purchase Partno already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmPurchasePart.cxDBCheckBox1PropertiesChange(Sender: TObject);
begin
  inherited;
  if cxDBCheckBox1.State = cbsChecked then
  begin
    cxDBLookupComboBox1.Text :='';
    cxDBLookupComboBox1.Enabled :=False;
  end
  else
    cxDBLookupComboBox1.Enabled :=True;

end;

procedure TfrmPurchasePart.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM purchasepart_tab LIMIT 100');
  dmMRP.OpenSupplier;
  dmMRP.OpenInvParts;
  dmMRP.OpenTax;
end;

end.
