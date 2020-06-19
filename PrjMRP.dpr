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
  uWarehouse in 'uWarehouse.pas' {frmWarehouse},
  uLocation in 'uLocation.pas' {frmLocation},
  uCurrency in 'uCurrency.pas' {frmCurrency},
  uRateType in 'uRateType.pas' {frmRateType},
  uRate in 'uRate.pas' {frmRate},
  uBaseMstDtl in 'uBaseMstDtl.pas' {frmBaseMstDtl},
  uItems in 'uItems.pas' {frmItems},
  uSupplier in 'uSupplier.pas' {frmSupplier},
  uPaymentTerm in 'uPaymentTerm.pas' {frmPaymentTerm},
  uPurchasePart in 'uPurchasePart.pas' {frmPurchasePart},
  uTax in 'uTax.pas' {frmTaxCode},
  uPR in 'uPR.pas' {frmPR};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMRP, dmMRP);
  Application.CreateForm(TfrmMrp, frmMrp);
  Application.Run;
end.
