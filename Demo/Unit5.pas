unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DTCatraca;

type
  TForm5 = class(TForm)
    edtCaminho: TEdit;
    Label1: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    edtComanda: TEdit;
    Memo1: TMemo;
    cboTipo: TComboBox;
    Label3: TLabel;
    DTCatraca1: TDTCatraca;

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  System.TypInfo;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
RetXML   : string;
Comandas : TStringList;
  I: Integer;
begin
       DTCatraca1.PathDoXml     := edtCaminho.Text;

       case cboTipo.ItemIndex of
          0: DTCatraca1.ModeloCatraca := ctHenry;
          1: DTCatraca1.ModeloCatraca := ctBlantech;
          2: DTCatraca1.ModeloCatraca := ctOtton;
          3: DTCatraca1.ModeloCatraca := ctNenhum;
        end;

       if  DTCatraca1.ModeloCatraca in [ctHenry,ctOtton] then
       begin
           if RadioGroup1.ItemIndex = 0 then
           begin
               RetXML := DTCatraca1.GerarXML( edtComanda.Text , stcBloqueada );
           end else begin
               RetXML := DTCatraca1.GerarXML( edtComanda.Text , stcLivre );
           end;
       end;

       if DTCatraca1.ModeloCatraca = ctBlantech then
       begin
             Comandas := TStringList.Create;
             for I := 1 to 10 do
              Comandas.Add(i.ToString);

             RetXML := DTCatraca1.GerarXMLComandasLivres(Comandas);
       end;

       Memo1.Lines.Clear;
       Memo1.Lines.Add( RetXML );
       ShowMessage('Xml gerado');
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  Modelo: TModeloCatraca;
begin
  cboTipo.Items.Clear;
  for Modelo := Low(TModeloCatraca) to High(TModeloCatraca) do
    cboTipo.Items.Add(GetEnumName(TypeInfo(TModeloCatraca), Ord(Modelo)));

  cboTipo.ItemIndex := 2;

end;

end.
