unit uWarehouse;

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
  TfrmWarehouse = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem10: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWarehouse: TfrmWarehouse;

implementation

{$R *.dfm}

uses dm, fBaseFind;

procedure TfrmWarehouse.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmWarehouse.btnFindClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT warehouse as WAREHOUSE,site as SITE,description as DESCRIPTION FROM warehouse_tab');
  frmBaseFind.sSQLFind :='SELECT warehouse as WAREHOUSE,site as SITE,description as DESCRIPTION FROM warehouse_tab WHERE warehouse LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM warehouse_tab WHERE warehouse LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmWarehouse.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM warehouse_tab LIMIT 100');
  dmMRP.OpenSite;
end;

procedure TfrmWarehouse.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM warehouse_tab WHERE site='+QuotedStr(qrStgBase.FieldByName('site').AsString)+' AND warehouse='+QuotedStr(qrStgBase.FieldByName('warehouse').AsString))=True then
    begin
       MessageDlg('Warehouse already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmWarehouse.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if qrStgBase.State = dsEdit then
   begin
     cxDBTextEdit1.Enabled :=False;
     cxDBLookupComboBox1.Enabled :=False;
   end
  else
    begin
     cxDBTextEdit1.Enabled :=True;
     cxDBLookupComboBox1.Enabled :=True;
    end;
end;

procedure TfrmWarehouse.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM warehouse_tab LIMIT 100');
  dmMRP.OpenSite;
end;

end.
