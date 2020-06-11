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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
    ServerName :string;
    StatusDB :string;
    procedure SaveConn();
    procedure ReadConn();
    function EncryptStr(const S :WideString; Key: Word): String;
    function DecryptStr(const S: String; Key: Word): String;
    procedure OpenSite;
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

procedure TdmMRP.OpenSite;
begin
  with qrSite do
  begin
    Close;
    SQL.Text :='SELECT site,description FROM site_tab';
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

end.
