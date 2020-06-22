unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, cxClasses,
  dxLayoutContainer, dxLayoutControl, dxGDIPlusClasses, Vcl.ExtCtrls,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.StdCtrls, cxTextEdit,
  dxLayoutControlAdapters, Vcl.Menus, cxButtons, dxLayoutLookAndFeels, Data.DB,
  MemDS, DBAccess, Uni;

type
  TfrmLogin = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    Image1: TImage;
    dxLayoutItem1: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    Label1: TLabel;
    dxLayoutItem4: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    qrSelect: TUniQuery;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCtWrong :Word;
    function GetSiteByUserName(FUser:string):string;
    procedure LockedAccount(FUserName:string);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses dm, eMRP;

procedure TfrmLogin.cxButton1Click(Sender: TObject);
//var ctWrong :Word;
begin
  if Length(trim(cxTextEdit1.Text))=0 then
  begin
     MessageDlg('User Name cannot empty!',mtInformation,[mbOK],0);
     cxTextEdit1.SetFocus;
     Abort;
  end;
  if Length(trim(cxTextEdit2.Text))=0 then
  begin
     MessageDlg('Password cannot empty!',mtInformation,[mbOK],0);
     cxTextEdit2.SetFocus;
     Abort;
  end;
  if dmMRP.Login(cxTextEdit1.Text,cxTextEdit2.Text)=True then
  begin
    frmMrp.IsLogin :=True;
    frmMrp.Site :=GetSiteByUserName(cxTextEdit1.Text);
    frmMrp.UserName :=cxTextEdit1.Text;
    Close;
  end
  else
    begin
      MessageDlg('Wrong username or password or Account Locked!',mtWarning,[mbOK],0);
      FCtWrong := FCtWrong + 1;
      if FCtWrong = 3  then
      begin
        MessageDlg('Account will be locked!',mtWarning,[mbOK],0);
        LockedAccount(cxTextEdit1.Text);
        Close;
      end;
    end;

  
end;

procedure TfrmLogin.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
     cxTextEdit2.SetFocus;
end;

procedure TfrmLogin.cxTextEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
     cxButton1Click(Sender);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FCtWrong :=0;
end;

function TfrmLogin.GetSiteByUserName(FUser: string): string;
begin
  with qrSelect do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT site FROM users_tab WHERE username='+QuotedStr(FUser);
    Open
  end;
  Result :=qrSelect.FieldByName('site').AsString;
end;

procedure TfrmLogin.LockedAccount(FUserName:string);
begin
  with qrSelect do
  begin
    Close;
    SQL.Text :='UPDATE users_tab SET locked='+QuotedStr('Y')+' WHERE username='+QuotedStr(FUserName);
    Execute;
  end;
end;

end.
