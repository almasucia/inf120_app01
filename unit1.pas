unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, unatural;

type

  { TForm1 }

  TForm1 = class(TForm)
    Ejecutar: TButton;
    Crear: TButton;
    Objeto: TLabel;
    Salir: TButton;
    valor: TEdit;
    parametro1: TEdit;
    parametro2: TEdit;
    resultado: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Op_con_digitos: TMenuItem;
    Primos: TMenuItem;
    Mayor: TMenuItem;
    Menor: TMenuItem;
    Invertir: TMenuItem;
    Capicua: TMenuItem;
    Par: TMenuItem;
    Impar: TMenuItem;
    Primo: TMenuItem;
    Binario: TMenuItem;
    Octal: TMenuItem;
    Op_con_enteros: TMenuItem;
    Hexadecimal: TMenuItem;
    BaseN: TMenuItem;
    Romano: TMenuItem;
    Insertar: TMenuItem;
    Obtener: TMenuItem;
    Cantidad: TMenuItem;
    Eliminar: TMenuItem;
    Sumar: TMenuItem;
    Pares: TMenuItem;
    Impares: TMenuItem;
    procedure BaseNClick(Sender: TObject);
    procedure CantidadClick(Sender: TObject);
    procedure CapicuaClick(Sender: TObject);
    procedure CrearClick(Sender: TObject);
    procedure EjecutarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HexadecimalClick(Sender: TObject);
    procedure ImparClick(Sender: TObject);
    procedure ImparesClick(Sender: TObject);
    procedure InsertarClick(Sender: TObject);
    procedure InvertirClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure MayorClick(Sender: TObject);
    procedure MenorClick(Sender: TObject);
    procedure BinarioClick(Sender: TObject);
    procedure OctalClick(Sender: TObject);
    procedure ObtenerClick(Sender: TObject);
    procedure ParClick(Sender: TObject);
    procedure ParesClick(Sender: TObject);
    procedure PrimoClick(Sender: TObject);
    procedure PrimosClick(Sender: TObject);
    procedure RomanoClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure SumarClick(Sender: TObject);
  private
    N:TNatural;    Opcion:integer;    RES:TNatural;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  N:=TNatural.create;
  RES:=TNatural.create;
  Opcion:=0;
end;

procedure TForm1.InsertarClick(Sender: TObject);
begin  Opcion:=1;end;
procedure TForm1.ObtenerClick(Sender: TObject);
begin  Opcion:=2;end;
procedure TForm1.EliminarClick(Sender: TObject);
begin  Opcion:=3;end;
procedure TForm1.CantidadClick(Sender: TObject);
begin  Opcion:=4;end;
procedure TForm1.SumarClick(Sender: TObject);
begin  Opcion:=5;end;
procedure TForm1.ParesClick(Sender: TObject);
begin  Opcion:=6;end;
procedure TForm1.ImparesClick(Sender: TObject);
begin  Opcion:=7;end;
procedure TForm1.PrimosClick(Sender: TObject);
begin  Opcion:=8;end;
procedure TForm1.MayorClick(Sender: TObject);
begin  Opcion:=9;end;
procedure TForm1.MenorClick(Sender: TObject);
begin  Opcion:=10;end;
procedure TForm1.InvertirClick(Sender: TObject);
begin  Opcion:=11;end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.CapicuaClick(Sender: TObject);
begin  Opcion:=12;end;
procedure TForm1.ParClick(Sender: TObject);
begin  Opcion:=13;end;
procedure TForm1.ImparClick(Sender: TObject);
begin  Opcion:=14;end;
procedure TForm1.PrimoClick(Sender: TObject);
begin  Opcion:=15;end;
procedure TForm1.BinarioClick(Sender: TObject);
begin  Opcion:=16;end;
procedure TForm1.OctalClick(Sender: TObject);
begin  Opcion:=17;end;
procedure TForm1.HexadecimalClick(Sender: TObject);
begin  Opcion:=18;end;
procedure TForm1.BaseNClick(Sender: TObject);
begin  Opcion:=19;end;
procedure TForm1.RomanoClick(Sender: TObject);
begin  Opcion:=20;end;

procedure TForm1.SalirClick(Sender: TObject);
begin
  close;
end;


procedure TForm1.CrearClick(Sender: TObject);
var valor_ingresado:integer;
begin
  valor_ingresado:=StrToInt(valor.text);
  N.setValor(valor_ingresado);
  Objeto.caption:=IntToStr(N.getValor());
end;
procedure TForm1.EjecutarClick(Sender: TObject);
var parm1,parm2:integer;
begin
  case Opcion of
    1:
      begin
        RES.setValor(N.getValor);
        parm1:=StrToInt(parametro1.text);
        parm2:=StrToInt(parametro2.text);
        resultado.text:=IntToStr(RES.Insertar(parm1,parm2));
      end;
    2:
      begin
        RES.setValor(N.getValor);
        parm1:=StrToInt(parametro1.text);
        resultado.text:=IntToStr(RES.obtener(parm1));
      end;
    3:
      begin
        RES.setValor(N.getValor);
        parm1:=StrToInt(parametro1.text);
        resultado.text:=IntToStr(RES.eliminar(parm1));
      end;
    4:
      begin
        RES.setValor(N.getValor);
        resultado.text:=IntToStr(RES.Cantidad());
      end;
    5:
      begin
        RES.setValor(N.getValor);
        resultado.text:=IntToStr(RES.sumar());
      end;
    6:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.pares();
      end;
    7:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.impares();
      end;
    8:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.primos();
      end;
    9:
      begin
        RES.setValor(N.getValor);
        resultado.text:=IntToStr(RES.digito_mayor());
      end;
    10:
      begin
        RES.setValor(N.getValor);
        resultado.text:=IntToStr(RES.digito_menor());
      end;
    11:
      begin
        RES.setValor(N.getValor);
        resultado.text:=IntToStr(RES.invertir());
      end;
    12:
      begin
        RES.setValor(N.getValor);
        resultado.text:=BoolToStr(RES.capicua(),True);
      end;
    13:
      begin
        RES.setValor(N.getValor);
        resultado.text:=BoolToStr(RES.par(),True);
      end;
    14:
      begin
        RES.setValor(N.getValor);
        resultado.text:=BoolToStr(RES.impar(),True);
      end;
    15:
      begin
        RES.setValor(N.getValor);
        resultado.text:=BoolToStr(RES.primo(),True);
      end;
    16:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.convertir_a_binario();
      end;
    17:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.convertir_a_octal();
      end;
    18:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.convertir_a_hexadecimal();
      end;
    19:
      begin
        RES.setValor(N.getValor);
        parm1:=StrToInt(parametro1.text);
        resultado.text:=RES.convertir_a_base_N(parm1);
      end;
    20:
      begin
        RES.setValor(N.getValor);
        resultado.text:=RES.convertir_a_romano();
      end;
  end;
end;

end.

