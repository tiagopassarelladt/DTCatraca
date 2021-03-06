unit DTCatraca;

interface

uses
  System.SysUtils, System.Classes, ComObj, XMLIntf, XMLDoc;

type TModeloCatraca = (ctHenry , ctNenhum );
type TStatusCatraca = (stcLivre , stcBloqueada );

type
  TDTCatraca = class(TComponent)
  private
    FPathXML: string;
    FModelo: TModeloCatraca;
    procedure setPathXML(const Value: string);
    procedure setModelo(const Value: TModeloCatraca);

  protected

  public
      function GerarXML(Comanda: string; StatusCatraca: TStatusCatraca): string;
  published
      property PathDoXml:string               read FPathXML     write setPathXML;
      property ModeloCatraca:TModeloCatraca   read FModelo      write setModelo;
  end;

  const

  XMLHenry =
  ' <?xml version="1.0" standalone="yes" ?> ' + #13 +
  ' <DATAPACKET Version="2.0"> ' + #13 +
  ' <METADATA> ' + #13 +
  ' <FIELDS> ' + #13 +
  ' <FIELD attrname="ID_COMANDA" fieldtype="string" WIDTH="20" /> ' + #13 +
  ' <FIELD attrname="EVENTO" fieldtype="string" WIDTH="1" /> ' + #13 +
  ' </FIELDS> ' +  #13 +
  ' <PARAMS /> ' + #13 +
  ' </METADATA> ' +  #13 +
  ' <ROWDATA> ' + #13 +
  ' <ROW RowState="4" ID_COMANDA="#NCOMANDA" EVENTO="#EV" /> ' +  #13 +
  ' </ROWDATA> ' + #13 +
  ' </DATAPACKET> ';


procedure Register;

implementation

procedure Register;
begin
   RegisterComponents('DT Inovacao', [TDTCatraca]);
end;

{ TDTCatraca }

function TDTCatraca.GerarXML(Comanda: string; StatusCatraca: TStatusCatraca):string;
VAR
Stat:string;
vXML:TXMLDocument;
begin
   if StatusCatraca = stcLivre then
   begin
      Stat := 'L';
   end else begin
      Stat := 'C';
   end;

   try
       try
           vXML := TXMLDocument.Create(nil);

           if not DirectoryExists( FPathXML ) then
             ForceDirectories( FPathXML );

           if FileExists( FPathXML + '\' + Comanda.PadLeft(10 , '0' ) + '.xml' ) then
              DeleteFile( FPathXML + '\' + Comanda.PadLeft(10 , '0' ) + '.xml' );

           if ModeloCatraca = ctHenry then
           begin
                vXML.Active     := True;
                vXML.Version    := '1.0';
                vXML.StandAlone := 'yes';

                vXML.XML.Add(' <DATAPACKET Version="2.0"> ');
                vXML.XML.Add(' <METADATA> ');
                vXML.XML.Add(' <FIELDS> ');
                vXML.XML.Add(' <FIELD attrname="ID_COMANDA" fieldtype="string" WIDTH="20" /> ');
                vXML.XML.Add(' <FIELD attrname="EVENTO" fieldtype="string" WIDTH="1" /> ');
                vXML.XML.Add(' </FIELDS> ');
                vXML.XML.Add(' <PARAMS /> ');
                vXML.XML.Add(' </METADATA> ' );
                vXML.XML.Add(' <ROWDATA> ');
                vXML.XML.Add(' <ROW RowState="4" ID_COMANDA="'+  Comanda.PadLeft(10,'0')  +'" EVENTO="'+ Stat +'" /> ');
                vXML.XML.Add(' </ROWDATA> ');
                vXML.XML.Add(' </DATAPACKET> ');
                vXML.Active     := True;
                vXML.SaveToFile( FPathXML + '\' + Comanda.PadLeft(10 , '0' ) + '.xml' );
           end;

       except on e:Exception do
           begin
                raise Exception.Create( e.Message );
           end;
       end;
   finally
       Result := vXML.XML.Text;
       FreeAndNil( vXML );
   end;
end;

procedure TDTCatraca.setModelo(const Value: TModeloCatraca);
begin
  FModelo := Value;
end;

procedure TDTCatraca.setPathXML(const Value: string);
begin
  FPathXML := Value;
end;

end.
