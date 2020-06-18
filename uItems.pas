unit uItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, cxContainer, cxEdit, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, Data.DB, DBAccess, Uni, MemDS, dxLayoutContainer,
  cxClasses, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxBarBuiltInMenu, cxPC, cxCheckBox;

type
  TfrmItems = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutItem11: TdxLayoutItem;
    LY0005: TdxLayoutGroup;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    cxPageControl1: TcxPageControl;
    dxLayoutItem20: TdxLayoutItem;
    tabStorage: TcxTabSheet;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxDBTextEdit4: TcxDBTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    tabInv: TcxTabSheet;
    tabOther: TcxTabSheet;
    cxDBTextEdit5: TcxDBTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutItem25: TdxLayoutItem;
    cxDBTextEdit8: TcxDBTextEdit;
    dxLayoutItem26: TdxLayoutItem;
    cxDBTextEdit9: TcxDBTextEdit;
    dxLayoutItem27: TdxLayoutItem;
    cxDBTextEdit10: TcxDBTextEdit;
    dxLayoutItem28: TdxLayoutItem;
    cxDBCheckBox2: TcxDBCheckBox;
    dxLayoutItem29: TdxLayoutItem;
    cxDBCheckBox3: TcxDBCheckBox;
    dxLayoutItem30: TdxLayoutItem;
    cxDBCheckBox4: TcxDBCheckBox;
    dxLayoutItem31: TdxLayoutItem;
    cxDBTextEdit11: TcxDBTextEdit;
    dxLayoutItem32: TdxLayoutItem;
    cxDBTextEdit12: TcxDBTextEdit;
    dxLayoutItem33: TdxLayoutItem;
    cxDBComboBox1: TcxDBComboBox;
    dxLayoutItem34: TdxLayoutItem;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    dxLayoutItem35: TdxLayoutItem;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    cxDBTextEdit13: TcxDBTextEdit;
    dxLayoutItem36: TdxLayoutItem;
    cxDBTextEdit14: TcxDBTextEdit;
    dxLayoutItem37: TdxLayoutItem;
    cxDBTextEdit15: TcxDBTextEdit;
    dxLayoutItem38: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItems: TfrmItems;

implementation

{$R *.dfm}

uses dm, fBaseFind;

procedure TfrmItems.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmItems.btnFindClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT PARTNO,PARTNAME FROM inv_parts_tab');
  frmBaseFind.sSQLFind :='SELECT PARTNO,PARTNAME FROM inv_parts_tab WHERE partno LIKE :f1 OR Partname LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM inv_parts_tab WHERE partno LIKE'+QuotedStr(frmBaseFind.ReturnValue));

end;

procedure TfrmItems.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM inv_parts_tab LIMIT 100');
   dmMRP.OpenPartType;
   dmMRP.OpenProductCode;
   dmMRP.OpenUom;
end;

procedure TfrmItems.btnSaveClick(Sender: TObject);
begin
  inherited;
   if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM inv_parts_tab WHERE partno='+QuotedStr(qrStgBase.FieldByName('partno').AsString))=True then
    begin
       MessageDlg('Part No already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmItems.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmItems.FormShow(Sender: TObject);
begin
  inherited;
   OpenSQL('SELECT * FROM inv_parts_tab LIMIT 100');
   dmMRP.OpenPartType;
   dmMRP.OpenProductCode;
   dmMRP.OpenUom;
   cxPageControl1.ActivePageIndex :=0;
end;

end.
