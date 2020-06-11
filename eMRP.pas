unit eMRP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2013White,
  cxClasses, dxBar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxStatusBar, cxStyles, cxPC, dxBarBuiltInMenu,
  dxTabbedMDI, Vcl.ImgList, cxImageList;

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
    procedure M2001Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M1001Click(Sender: TObject);
    procedure M1002Click(Sender: TObject);
    procedure M1003Click(Sender: TObject);
    procedure M1004Click(Sender: TObject);
    procedure M1005Click(Sender: TObject);
    procedure M1006Click(Sender: TObject);
    procedure M0006Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowForm(frmID :Integer);
  public
    { Public declarations }
  end;
 {Catatan Penamaan Menu
 : Setting : M100,M2001
   Master Data : M300

 }
var
  frmMrp: TfrmMrp;

implementation

{$R *.dfm}

uses dm, uSite, uAccGroup, uProductCode, uProductFamily, uUOM, uWarehouse;

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

procedure TfrmMrp.M2001Click(Sender: TObject);
begin
  if dmMRP.dlgMySQL.Execute then
     dmMRP.SaveConn;

end;

procedure TfrmMrp.ShowForm(frmID: Integer);
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
  end;
end;

procedure TfrmMrp.FormShow(Sender: TObject);
begin
  dxStsBar.Panels[1].Text :=dmMRP.ServerName;
end;

end.
