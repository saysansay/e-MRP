unit uPR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMstDtl, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  dxLayoutContainer, DBAccess, Uni, MemDS, dxBar, cxClasses, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, QImport3Wizard, cxButtonEdit,
  cxSpinEdit, cxCurrencyEdit, cxLabel, cxBarEditItem, dxRibbon;

type
  TfrmPR = class(TfrmBaseMstDtl)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutItem3: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    grDetailDBpurch_partno: TcxGridDBColumn;
    grDetailDBpurch_partname: TcxGridDBColumn;
    grDetailDBpr_qty: TcxGridDBColumn;
    grDetailDBpurch_uom: TcxGridDBColumn;
    grDetailDBtax_code: TcxGridDBColumn;
    grDetailDBamount: TcxGridDBColumn;
    grDetailDBbuyer: TcxGridDBColumn;
    grDetailDBColumn1: TcxGridDBColumn;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    dxLayoutItem8: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure qrMSTBeforePost(DataSet: TDataSet);
    procedure btnHSaveClick(Sender: TObject);
    procedure grDetailDBCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnDNewClick(Sender: TObject);
    procedure grDetailDBpurch_partnoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnDEditClick(Sender: TObject);
    procedure qrDTLBeforePost(DataSet: TDataSet);
    procedure qrDTLAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnDSaveClick(Sender: TObject);
    procedure btnDCancelClick(Sender: TObject);
    procedure btnHDeleteClick(Sender: TObject);
    procedure qrMSTBeforeDelete(DataSet: TDataSet);
    procedure btnHRefreshClick(Sender: TObject);
  private
    { Private declarations }
    function GrossAmount(FPRNo :string):Double;
  public
    { Public declarations }
  end;

var
  frmPR: TfrmPR;

implementation

{$R *.dfm}

uses fBaseFind, dm;

procedure TfrmPR.btnDCancelClick(Sender: TObject);
begin
  inherited;
   if qrDTL.State in [dsInsert,dsEdit] then
      qrDTL.Cancel;
end;

procedure TfrmPR.btnDEditClick(Sender: TObject);
begin
  inherited;
  qrDTL.Edit;
end;

procedure TfrmPR.BtnDNewClick(Sender: TObject);
begin
  inherited;
  //qrDTL.Insert;
end;

procedure TfrmPR.btnDSaveClick(Sender: TObject);
begin
  inherited;
  if qrDTL.State in [dsInsert,dsEdit] then
     qrDTL.Post;
end;

procedure TfrmPR.btnHDeleteClick(Sender: TObject);
begin
  inherited;
//  ShowMessage(ParentNo +' '+ TableDetail +' '+FieldDetail);
end;

procedure TfrmPR.btnHRefreshClick(Sender: TObject);
begin
  inherited;
  OpenMST('SELECT * FROM pr_head_tab ORDER BY created DESC LIMIT 100');
  OpenDTL('SELECT * FROM pr_detail_tab');
  AssingStatus;
end;

procedure TfrmPR.btnHSaveClick(Sender: TObject);
begin
  inherited;
  qrMST.Post;
end;

procedure TfrmPR.FormCreate(Sender: TObject);
begin
  inherited;
  grDetailDBpr_qty.PropertiesClass :=TcxCurrencyEditProperties;
  TcxCurrencyEditProperties(grDetailDBpr_qty.Properties).DisplayFormat :=dmMRP.QtyDisplayFormat;
  grDetailDBColumn1.PropertiesClass :=TcxCurrencyEditProperties;
  TcxCurrencyEditProperties(grDetailDBColumn1.Properties).DisplayFormat :=dmMRP.PriceDisplayFormat;
  grDetailDBamount.PropertiesClass :=TcxCurrencyEditProperties;
  TcxCurrencyEditProperties(grDetailDBamount.Properties).DisplayFormat :=dmMRP.PriceDisplayFormat;
  cxDBCurrencyEdit1.Properties.DisplayFormat :=dmMRP.PriceDisplayFormat;
  TableDetail :='pr_detail_tab';
  FieldDetail :='prno';
end;

procedure TfrmPR.FormShow(Sender: TObject);
begin
  inherited;
  OpenMST('SELECT * FROM pr_head_tab ORDER BY created DESC LIMIT 100');
  OpenDTL('SELECT * FROM pr_detail_tab');
  AssingStatus;
end;

procedure TfrmPR.grDetailDBCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  qrDTL.Insert;
end;

procedure TfrmPR.grDetailDBpurch_partnoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT PURCH_PARTNO,PURCH_PARTNAME,PRIMARY_SUPPLIER,PURCH_UOM,PURCH_PRICE,BUYER,TAX_CODE FROM purchasepart_tab');
  frmBaseFind.sSQLFind :='SELECT PURCH_PARTNO,PURCH_PARTNAME,PRIMARY_SUPPLIER,PURCH_UOM,PURCH_PRICE,BUYER,TAX_CODE FROM purchasepart_tab  WHERE purch_partno LIKE :f1 OR purch_partname LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
  begin
    qrDTL.FieldByName('purch_partno').AsString :=frmBaseFind.qrFind.FieldByName('PURCH_PARTNO').AsString;
    qrDTL.FieldByName('purch_partname').AsString :=frmBaseFind.qrFind.FieldByName('purch_partname').AsString;
    qrDTL.FieldByName('pr_qty').AsFloat:=1;
    qrDTL.FieldByName('purch_uom').AsString :=frmBaseFind.qrFind.FieldByName('purch_uom').AsString;
    qrDTL.FieldByName('price').AsFloat :=frmBaseFind.qrFind.FieldByName('purch_price').AsFloat;
    qrDTL.FieldByName('amount').AsFloat := qrDTL.FieldByName('pr_qty').AsFloat * qrDTL.FieldByName('price').AsFloat;
    qrDTL.FieldByName('tax_code').AsString :=frmBaseFind.qrFind.FieldByName('tax_code').AsString;
    qrDTL.FieldByName('buyer').AsString :=frmBaseFind.qrFind.FieldByName('buyer').AsString;
  end;
     //OpenSQL('SELECT * FROM purchasepart_tab WHERE purch_partno LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

function TfrmPR.GrossAmount(FPRNo: string): Double;
begin
  with qrCMD do
  begin
    Close;
    SQL.Text :='SELECT SUM(amount)gross FROM pr_detail_tab WHERE prno=:p';
    ParamByName('p').AsString :=FPRNo;
    Open;
  end;
  if qrCMD.FieldByName('gross').AsString <> '' then
     Result :=qrCMD.FieldByName('gross').AsFloat
  else
     Result :=0;
end;

procedure TfrmPR.qrDTLAfterPost(DataSet: TDataSet);
begin
  inherited;
  qrMST.Edit;
  qrMST.FieldByName('total_gross').AsFloat := GrossAmount(qrMST.FieldByName('prno').AsString);
  qrMST.Post;
end;

procedure TfrmPR.qrDTLBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qrDTL.State in [dsInsert,dsEdit] then
     qrDTL.FieldByName('amount').AsFloat :=qrDTL.FieldByName('pr_qty').AsFloat*qrDTL.FieldByName('price').AsFloat;
end;

procedure TfrmPR.qrMSTBeforeDelete(DataSet: TDataSet);
begin
  inherited;
   if not qrMST.IsEmpty then
    ParentNo :=qrMST.FieldByName('prno').AsString;
end;

procedure TfrmPR.qrMSTBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qrMST.State=dsInsert then
     qrMST.FieldByName('prno').AsString :=AutoNumber('FCC','/','PR','pr_head_tab');
end;

end.
