program PrjMRP;

uses
  Vcl.Forms,
  eMRP in 'eMRP.pas' {frmMrp},
  dm in 'dm.pas' {dmMRP: TDataModule},
  uStgBase in 'uStgBase.pas' {frmStgBase},
  uSite in 'uSite.pas' {frmSite},
  fBaseFind in 'fBaseFind.pas' {frmBaseFind},
  uAccGroup in 'uAccGroup.pas' {frmAccGroup},
  uProductCode in 'uProductCode.pas' {frmProductCode},
  uProductFamily in 'uProductFamily.pas' {frmProductFamily},
  uUOM in 'uUOM.pas' {frmUOM},
  uWarehouse in 'uWarehouse.pas' {frmWarehouse};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMRP, dmMRP);
  Application.CreateForm(TfrmMrp, frmMrp);
  Application.Run;
end.
