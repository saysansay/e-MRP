unit uSite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uStgBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White,
  Vcl.Menus, dxLayoutControlAdapters, Data.DB, DBAccess, Uni, MemDS,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxCheckBox,
  cxMaskEdit, cxSpinEdit;

type
  TfrmSite = class(TfrmStgBase)
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    cxDBCheckBox2: TcxDBCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    cxDBCheckBox3: TcxDBCheckBox;
    dxLayoutItem13: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure dsStgBaseDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSite: TfrmSite;

implementation

{$R *.dfm}

uses dm, fBaseFind;

procedure TfrmSite.btnDuplicateClick(Sender: TObject);
begin
  inherited;
  CopyRow;
end;

procedure TfrmSite.btnFindClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmBaseFind,frmBaseFind);
  frmBaseFind.ShowSQL('SELECT site as SITE,description as DESCRIPTION FROM site_tab');
  frmBaseFind.sSQLFind :='SELECT site as SITE,description as DESCRIPTION FROM site_tab WHERE site LIKE :f1';
  if frmBaseFind.ShowModal=mrOk then
     OpenSQL('SELECT * FROM site_tab WHERE site LIKE'+QuotedStr(frmBaseFind.ReturnValue));
end;

procedure TfrmSite.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM site_tab limit 100');
end;

procedure TfrmSite.btnSaveClick(Sender: TObject);
begin
  inherited;
  if qrStgBase.State = dsInsert then
  begin
    if RowExist('SELECT COUNT(*)ct FROM site_tab WHERE site='+QuotedStr(qrStgBase.FieldByName('site').AsString))=True then
    begin
       MessageDlg('Site already exist!',mtInformation,[mbOK],0);
       Abort;
    end
    else
      qrStgBase.Post;
  end;
   if qrStgBase.State = dsEdit then
      qrStgBase.Post;
end;

procedure TfrmSite.dsStgBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qrStgBase.State = dsEdit then
     cxDBTextEdit1.Enabled :=False
  else
     cxDBTextEdit1.Enabled :=True;
end;

procedure TfrmSite.FormShow(Sender: TObject);
begin
  inherited;
  OpenSQL('SELECT * FROM site_tab limit 100');
end;

end.
