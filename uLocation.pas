unit uLocation;

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
  TfrmLocation = class(TfrmStgBase)
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    dxLayoutItem12: TdxLayoutItem;
    cxDBComboBox2: TcxDBComboBox;
    dxLayoutItem13: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocation: TfrmLocation;

implementation

{$R *.dfm}

uses dm;

procedure TfrmLocation.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmLocation.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM location_tab LIMIT 100');
  dmMRP.OpenWarehouse;
end;

procedure TfrmLocation.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM location_tab WHERE warehouse='+QuotedStr(qrStgBase.FieldByName('warehouse').AsString)+' AND location='+QuotedStr(qrStgBase.FieldByName('location').AsString))=True then
    begin
       MessageDlg('Location already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmLocation.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM location_tab LIMIT 100');
  dmMRP.OpenWarehouse;
end;

end.
