unit eMRP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2013White,
  cxClasses, dxBar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, cxStyles, cxPC, dxBarBuiltInMenu,
  dxTabbedMDI, Vcl.ImgList, cxImageList, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmMrp = class(TForm)
    dxBar: TdxBarManager;
    dxStsBar: TdxStatusBar;
    dxDock: TdxBarDockControl;
    dxBarBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    M1000: TdxBarSubItem;
    cxStyle: TcxStyleRepository;
    stlMenu: TcxStyle;
    MDI: TdxTabbedMDIManager;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    M1001: TdxBarButton;
    M1002: TdxBarButton;
    M1003: TdxBarButton;
    M1004: TdxBarButton;
    dxBarBar2: TdxBar;
    dxBarSeparator1: TdxBarSeparator;
    M2001: TdxBarButton;
    M30000: TdxBarSubItem;
    M3001: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    M6001: TdxBarLargeButton;
    smlimg: TcxImageList;
    M3002: TdxBarButton;
    M3003: TdxBarButton;
    M1005: TdxBarButton;
    lrgImg: TcxImageList;
    M6002: TdxBarLargeButton;
    M6003: TdxBarLargeButton;
    M3004: TdxBarButton;
    M3005: TdxBarButton;
    M1006: TdxBarButton;
    M1007: TdxBarButton;
    M4000: TdxBarSubItem;
    M4001: TdxBarButton;
    M4002: TdxBarButton;
    M4003: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    M0001: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    M0002: TdxBarButton;
    M0006: TdxBarButton;
    M0003: TdxBarButton;
    M0004: TdxBarButton;
    M0005: TdxBarButton;
    dxBarButton1: TdxBarButton;
    M1008: TdxBarButton;
    m1009: TdxBarButton;
    m1010: TdxBarButton;
    m1011: TdxBarButton;
    m1012: TdxBarButton;
    dxBarButton2: TdxBarButton;
    m5000: TdxBarSubItem;
    M5001: TdxBarButton;
    M5003: TdxBarButton;
    Header: TcxStyle;
    M5002: TdxBarButton;
    procedure M2001Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M1001Click(Sender: TObject);
    procedure M1002Click(Sender: TObject);
    procedure M1003Click(Sender: TObject);
    procedure M1004Click(Sender: TObject);
    procedure M1005Click(Sender: TObject);
    procedure M1006Click(Sender: TObject);
    procedure M0006Click(Sender: TObject);
    procedure M1007Click(Sender: TObject);
    procedure M1008Click(Sender: TObject);
    procedure m1009Click(Sender: TObject);
    procedure M3001Click(Sender: TObject);
    procedure M3005Click(Sender: TObject);
    procedure m1011Click(Sender: TObject);
    procedure M3002Click(Sender: TObject);
    procedure m1012Click(Sender: TObject);
    procedure M5001Click(Sender: TObject);
    procedure M0003Click(Sender: TObject);
    procedure M0002Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLogin :Boolean;
    FSite,FUser  :string;
    procedure setLogin(value :Boolean);
    function  getLogin :Boolean;
    procedure setSite(value:string);
    function getSite:string;
    procedure setUser(value:string);
    function getUser :string;
    procedure ShowForm(frmID :Integer);
    procedure closeChild;

  public
    { Public declarations }
    property IsLogin : boolean read getLogin write setLogin;
    property Site : string read getSite write setSite;
    property UserName : string read getUser write setUser;
  end;
 {Catatan Penamaan Menu
 : Setting : M100,M2001
   Master Data : M300

 }
var
  frmMrp: TfrmMrp;

implementation

{$R *.dfm}

uses dm, uSite, uAccGroup, uProductCode, uProductFamily, uUOM, uWarehouse,
  uLocation, uCurrency, uRateType, uItems, uSupplier, uPaymentTerm,
  uPurchasePart, uTax, uBaseMstDtl, uPR, uRegister, uLogin;

function TfrmMrp.getLogin: Boolean;
begin
  Result :=FLogin;
end;

function TfrmMrp.getSite: string;
begin
  Result :=FSite;
end;

function TfrmMrp.getUser: string;
begin
  Result :=FUser;
end;

procedure TfrmMrp.M0002Click(Sender: TObject);
begin
  if (IsLogin=False)and (M0002.Caption='Login') then
  begin
    Application.CreateForm(TfrmLogin,frmLogin);
    frmLogin.ShowModal
  end
  else
     if (IsLogin=True)and (M0002.Caption='Logout') then
     begin
       IsLogin :=False;
       M0002.Caption:='Login';
       closeChild;
       Application.CreateForm(TfrmLogin,frmLogin);
       frmLogin.ShowModal
     end;
end;

procedure TfrmMrp.M0003Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRegister,frmRegister);
  frmRegister.ShowModal;
end;

procedure TfrmMrp.M0006Click(Sender: TObject);
begin
  if MessageDlg('Are you sure to exit application ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
     Application.Terminate
end;

procedure TfrmMrp.M1001Click(Sender: TObject);
begin
  ShowForm(M1001.Tag);
end;

procedure TfrmMrp.M1002Click(Sender: TObject);
begin
  ShowForm(M1002.Tag);
end;

procedure TfrmMrp.M1003Click(Sender: TObject);
begin
  ShowForm(M1003.Tag);
end;

procedure TfrmMrp.M1004Click(Sender: TObject);
begin
  ShowForm(M1004.Tag);
end;

procedure TfrmMrp.M1005Click(Sender: TObject);
begin
  ShowForm(M1005.Tag);
end;

procedure TfrmMrp.M1006Click(Sender: TObject);
begin
  ShowForm(M1006.Tag);
end;

procedure TfrmMrp.M1007Click(Sender: TObject);
begin
  ShowForm(M1007.Tag);
end;

procedure TfrmMrp.M1008Click(Sender: TObject);
begin
  ShowForm(m1008.Tag);
end;

procedure TfrmMrp.m1009Click(Sender: TObject);
begin
  ShowForm(m1009.Tag);
end;

procedure TfrmMrp.m1011Click(Sender: TObject);
begin
  ShowForm(m1011.Tag);
end;

procedure TfrmMrp.m1012Click(Sender: TObject);
begin
  ShowForm(m1012.Tag);
end;

procedure TfrmMrp.M2001Click(Sender: TObject);
begin
  if dmMRP.dlgMySQL.Execute then
     dmMRP.SaveConn;

end;

procedure TfrmMrp.M3001Click(Sender: TObject);
begin
  ShowForm(M3001.Tag);
end;

procedure TfrmMrp.M3002Click(Sender: TObject);
begin
  ShowForm(M3002.Tag);
end;

procedure TfrmMrp.M3005Click(Sender: TObject);
begin
  ShowForm(M3005.Tag);
end;

procedure TfrmMrp.M5001Click(Sender: TObject);
begin
  ShowForm(M5001.Tag);
end;

procedure TfrmMrp.setLogin(value: Boolean);
begin
  FLogin :=value;
  if FLogin=True then
     M0002.Caption :='Logout';
end;

procedure TfrmMrp.setSite(value: string);
begin
  FSite :=value;
  dxStsBar.Panels[3].Text :=FSite;
end;

procedure TfrmMrp.setUser(value: string);
begin
  FUser :=value;
end;

procedure TfrmMrp.ShowForm(frmID: Integer);
begin
  if IsLogin = False then
  begin
    MessageDlg('Please Login first!',mtInformation,[mbOK],0);
    Abort;
  end;
  if IsLogin=true then
  begin
    case frmID of
     1001 : begin
       Application.CreateForm(TfrmSite,frmSite);
     end;
     1002 : begin
       Application.CreateForm(TfrmAccGroup,frmAccGroup);
     end;
     1003 : begin
              Application.CreateForm(TfrmProductCode,frmProductCode);
            end;
     1004 : begin
              Application.CreateForm(TfrmProductFamily,frmProductFamily);
            end;
     1005 : begin
              Application.CreateForm(TfrmUOM,frmUOM);
            end;
     1006 : begin
         Application.CreateForm(TfrmWarehouse,frmWarehouse);
     end;
     1007 : begin
              Application.CreateForm(TfrmLocation,frmLocation);
            end;

    1008 : begin
           Application.CreateForm(TfrmCurrency,frmCurrency);
           end;
    1009 : begin
         Application.CreateForm(TfrmRateType,frmRateType);
    end;

    3001 : begin
             Application.CreateForm(TfrmItems,frmItems);
           end;
    3005 : begin
       Application.CreateForm(TfrmSupplier,frmSupplier);
    end;
    1011 : begin
      Application.CreateForm(TfrmPaymentTerm,frmPaymentTerm);
    end;
    3002: begin
      Application.CreateForm(TfrmPurchasePart,frmPurchasePart);
    end;
    1012 : begin
      Application.CreateForm(TfrmTaxCode,frmTaxCode);
    end;
    5001 : begin
       Application.CreateForm(TfrmPR,frmPR);
    end;
    end;
  end;

end;

procedure TfrmMrp.closeChild;
var
  I: Integer;
begin
  with frmMrp do
    for I := MDIChildCount-1 downto 0 do
     MDIChildren[I].Close;
end;

procedure TfrmMrp.FormCreate(Sender: TObject);
begin
   IsLogin :=False;
   WindowState :=wsMaximized;
end;

procedure TfrmMrp.FormShow(Sender: TObject);
begin
  dxStsBar.Panels[1].Text :=dmMRP.ServerName;
end;

end.
