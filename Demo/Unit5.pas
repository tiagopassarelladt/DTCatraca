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
    DTCatraca1: TDTCatraca;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
RetXML:string;
begin
       DTCatraca1.PathDoXml := edtCaminho.Text;

       if RadioGroup1.ItemIndex = 0 then
       begin
           RetXML := DTCatraca1.GerarXML( edtComanda.Text , stcBloqueada );
       end else begin
           RetXML :=  DTCatraca1.GerarXML( edtComanda.Text , stcLivre );
       end;

       Memo1.Lines.Clear;

       Memo1.Lines.Add( RetXML );

       ShowMessage('Xml gerado');
end;

end.
