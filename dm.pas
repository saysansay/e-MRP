unit dm;

interface

uses
  System.SysUtils, System.Classes, UniProvider, MySQLUniProvider, Data.DB,
  DBAccess, Uni, UniDacVcl,System.JSON,System.IOUtils,Forms, Vcl.ImgList,
  Vcl.Controls, cxImageList, cxGraphics, MemDS;

type
  TdmMRP = class(TDataModule)
    dbMySQL: TUniConnection;
    mySQL: TMySQLUniProvider;
    dlgMySQL: TUniConnectDialog;
    imgbutton: TcxImageList;
    qrSite: TUniQuery;
    dsSite: TUniDataSource;
    qrWarehouse: TUniQuery;
    dsWarehouse: TUniDataSource;
    qrCurrency: TUniQuery;
    dsCurrency: TUniDataSource;
    qrRateType: TUniQuery;
    dsRateType: TUniDataSource;
    qrPartType: TUniQuery;
    dsPartType: TUniDataSource;
    qrPCode: TUniQuery;
    dsPCode: TUniDataSource;
    qrUom: TUniQuery;
    dsUom: TUniDataSource;
    qrPaymentTerm: TUniQuery;
    dsPayment: TUniDataSource;
    qrSupplier: TUniQuery;
    dsSupplier: TUniDataSource;
    qrPart: TUniQuery;
    dsPart: TUniDataSource;
    qrTax: TUniQuery;
    dsTax: TUniDataSource;
    qrSelect: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FQtyFormat,FPriceFormat :string;
    Procedure SetQtyFormat(Value :string);
    function GetQtyFormat :string;
    procedure SetPriceFormat(Value:string);
    function GetPriceFormat:string;
    function GetQtyFormatBySite(FSite:string):string;
    function GetPriceFormatBySite(FSite:string):string;
  public
    { Public declarations }
    ServerName :string;
    StatusDB :string;
    procedure SaveConn();
    procedure ReadConn();
    function EncryptStr(const S :WideString; Key: Word): String;
    function DecryptStr(const S: String; Key: Word): String;
    procedure OpenSite;
    procedure OpenWarehouse;
    procedure OpenCurrency;overload;
    procedure OpenCurrency(FRatetype :string);overload;
    procedure OpenRatetype;
    procedure OpenPartType;
    procedure OpenProductCode;
    procedure OpenUom;
    procedure OpenTerm;
    procedure OpenSupplier;
    procedure OpenInvParts;
    procedure OpenTax;

    property QtyDisplayFormat :string read GetQtyFormat write SetQtyFormat;
    property PriceDisplayFormat :string read GetPriceFormat write SetPriceFormat;

  end;
  const CKEY1 = 30812;
        CKEY2 = 14786;
var
  dmMRP: TdmMRP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses eMRP;

{$R *.dfm}

{ TdmMRP }

procedure TdmMRP.DataModuleCreate(Sender: TObject);
begin
  ReadConn;
  FQtyFormat :=GetQtyFormatBySite('2W');
  FPriceFormat :=GetPriceFormatBySite('2W');
end;

function TdmMRP.DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result:= UTF8ToString(RStr);

end;

function TdmMRP.EncryptStr(const S: WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;

end;

function TdmMRP.GetPriceFormat: string;
begin
  Result :=FPriceFormat;
end;

function TdmMRP.GetPriceFormatBySite(FSite: string): string;
begin
   with qrSelect do
  begin
    Close;
    SQL.Text :='SELECT currency_format FROM site_tab WHERE site='+QuotedStr(FSite);
    Open;
  end;
  if qrSelect.FieldByName('currency_format').AsString <>'' then
     Result :=qrSelect.FieldByName('currency_format').AsString
  else
     Result :='0.###;(0.###)';
end;

function TdmMRP.GetQtyFormat: string;
begin
  Result :=FQtyFormat;
end;

function TdmMRP.GetQtyFormatBySite(FSite: string): string;
begin
  with qrSelect do
  begin
    Close;
    SQL.Text :='SELECT qty_format FROM site_tab WHERE site='+QuotedStr(FSite);
    Open;
  end;
  if qrSelect.FieldByName('qty_format').AsString <>'' then
     Result :=qrSelect.FieldByName('qty_format').AsString
  else
     Result :='0.0000;(0.0000)';

end;

procedure TdmMRP.OpenCurrency;
begin
  with qrCurrency do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT currency_code,description from currency_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenCurrency(FRatetype: string);
begin
  with qrCurrency do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT currency_code,description from currency_tab WHERE currency_code IN (SELECT currency_code FROM ratetype_tab WHERE ratetype=:f1)';
    ParamByName('f1').AsString :=FRatetype;
    Open;
  end;
end;

procedure TdmMRP.OpenInvParts;
begin
  with qrPart do
  begin
    Close;
    SQL.Text :='SELECT partno,partname FROM inv_parts_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenPartType;
begin
  with qrPartType do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT * FROM parttype_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenProductCode;
begin
  with qrPCode do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT * FROM productcode_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenRatetype;
begin
  with qrRateType do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='SELECT rate_type,description,currency_code FROM ratetype_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenSite;
begin
  with qrSite do
  begin
    Close;
    SQL.Text :='SELECT site,description FROM site_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenSupplier;
begin
  with qrSupplier do
  begin
    Close;
    SQL.Text :='SELECT supplier_code,supplier_name FROM supplier_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenTax;
begin
  with qrTax do
  begin
    Close;
    SQL.Text :='SELECT taxcode,description FROM tax_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenTerm;
begin
  with qrPaymentTerm do
  begin
    Close;
    SQL.Text :='SELECT term_code,description from paymentterm_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenUom;
begin
  with qrUom do
  begin
    Close;
    SQL.Text :='SELECT * FROM uom_tab';
    Open;
  end;
end;

procedure TdmMRP.OpenWarehouse;
begin
  with qrWarehouse do
  begin
    Close;
    SQL.Text :='SELECT * FROM warehouse_tab';
    Open;
  end;
end;

procedure TdmMRP.ReadConn;
var
  fileName: TFileName;
  JSONValue, jv: TJSONValue;
begin
   dbMySQL.Connected :=False;
   try
     fileName := ExtractFilePath(Application.ExeName)+'/connection.json' ;
     JSONValue := TJSONObject.ParseJSONValue(TFile.ReadAllText(fileName));
     dbMySQL.Server :=DecryptStr(JsonValue.GetValue<string>('server'),CKEY1);
     dbMySQL.Username :=DecryptStr(JsonValue.GetValue<string>('user'),CKEY1);
     dbMySQL.Password :=DecryptStr(JsonValue.GetValue<string>('password'),CKEY1);
     dbMySQL.Database :=DecryptStr(JsonValue.GetValue<string>('database'),CKEY1);
     try
       dbMySQL.Connected :=True;
       ServerName :=dbMySQL.Server;
       StatusDB :='Connected';
     except
       on e:exception do
          e.Create(e.Message);
     end;
   finally
      JsonValue.Free;
   end;
end;

procedure TdmMRP.SaveConn;
var
  lJsonObj: TJSONObject;
begin
   try
      lJsonObj := TJSONObject.Create;
      lJsonObj.AddPair('server', EncryptStr(dbMySQL.Server,CKEY1));
      lJsonObj.AddPair('user', EncryptStr(dbMySQL.Username,CKEY1));
      lJsonObj.AddPair('password', EncryptStr(dbMySQL.Password,CKEY1));
      lJsonObj.AddPair('database', EncryptStr(dbMySQL.Database,CKEY1));
      TFile.WriteAllText('connection.json', lJsonObj.ToString);
   finally
      lJsonObj.Free;
   end;

end;

procedure TdmMRP.SetPriceFormat(Value: string);
begin
  FPriceFormat :=Value;
end;

procedure TdmMRP.SetQtyFormat(Value: string);
begin
  FQtyFormat :=Value;
end;

end.
