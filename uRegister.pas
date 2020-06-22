unit uRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses,
  dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxLayoutLookAndFeels, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmRegister = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    txtUserName: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    txtPassword: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    txtCPassword: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cbSite: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    btnRegister: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    qrSite: TUniQuery;
    procedure btnRegisterClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    Procedure ShowSite;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

{$R *.dfm}

uses dm, eMRP;

procedure TfrmRegister.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
const FSalt = 140686;
var FRandom :Integer;
begin
  if Length(trim(txtUserName.Text))=0 then
  begin
     MessageDlg('User Name cannot empty!',mtInformation,[mbOK],0);
     txtUserName.SetFocus;
     Abort;
  end;
  if Length(trim(txtPassword.Text))=0 then
  begin
     MessageDlg('Password cannot empty!',mtInformation,[mbOK],0);
     txtPassword.SetFocus;
     Abort;
  end;
  if Length(trim(txtCPassword.Text))=0 then
  begin
     MessageDlg('Confirmation Password cannot empty!',mtInformation,[mbOK],0);
     txtCPassword.SetFocus;
     Abort;
  end;
  if txtPassword.Text <> txtCPassword.Text then
  begin
     MessageDlg('Password and Confirmation Passworf not match!',mtInformation,[mbOK],0);
     txtPassword.SetFocus;
     Abort;
  end;
  if Length(trim(cbSite.Text))=0 then
  begin
     MessageDlg('Site cannot empty!',mtInformation,[mbOK],0);
     cbSite.SetFocus;
     Abort;
  end;
  FRandom := Random(FSalt);
  if dmMRP.RegisterUser(txtUserName.Text,txtPassword.Text,txtCPassword.Text,cbSite.Text,FRandom)=True then
  begin
    MessageDlg('Success Register User, Please wait for admin verified!',mtInformation,[mbOK],0);
    //clear
    Close;
  end
  else
    MessageDlg('Username already register!',mtInformation,[mbOK],0);
  
end;

procedure TfrmRegister.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  ShowSite;
end;

procedure TfrmRegister.ShowSite;
begin
  with qrSite do
  begin
    Close;
    SQL.Text :='SELECT site from site_tab';
    Open;
  end;
  qrSite.First;
  cbSite.Properties.Items.Clear;
  while not qrSite.Eof do
  begin
    cbSite.Properties.Items.Add(qrSite.FieldByName('site').AsString);
    qrSite.Next;
  end;
end;

end.
