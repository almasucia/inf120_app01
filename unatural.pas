unit unatural;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TNatural=class
  private
    num:integer;
  public
    constructor Create;
    procedure setValor(n:integer);
    function getValor():integer;
    //operaciones sobre digitos
    function insertar(digito,posicion:integer):integer;
    function obtener(posicion:integer):integer;
    function eliminar(posicion:integer):integer;
    function cantidad():integer;
    function sumar(): integer;
    function pares():string;
    function impares():string;
    function primos():string;
    function digito_mayor():integer;
    function digito_menor():integer;
    //operaciones sobre enteros
    function invertir():integer;
    function capicua():boolean;
    function par():boolean;
    function impar():boolean;
    function primo():boolean;
    function convertir_a_binario():string;
    function convertir_a_octal():string;
    function convertir_a_hexadecimal():string;
    function convertir_a_base_N(base:integer):string;
    function convertir_a_romano():string;
    //function convertir_a_literal():string;
  end;

implementation
  constructor TNatural.Create;
  begin
    num:=0;
  end;
  procedure TNatural.setValor(n: integer);
  begin
    num:=n;
  end;
  function TNatural.getValor():integer;
  begin
    result:=num;
  end;

  //con digitos
  function TNatural.insertar(digito,posicion:integer):integer;
  var
    mul,cont,aux:integer;
  begin
    mul:=1;    cont:=0;    aux:=0;
    while num>0 do
    begin

      cont:=cont+1;
      if cont=posicion then
      begin
        aux:=aux+(digito*mul);
        mul:=mul*10;
      end;
      aux:=aux+(num mod 10)*mul;
      num:=num div 10;
      mul:=mul*10
    end;
    if posicion>cont then
    begin
      aux:=aux+(digito*mul);
    end;
    result:=aux;
  end;
  function TNatural.obtener(posicion:integer):integer;
  var
    r,pos:integer;
  begin
    r:=0;
    pos:=1;
    while num>0 do
    begin
      if pos=posicion then
      begin
        r:=num mod 10;
        num:=0;
      end;
      num:=num div 10;
      pos:=pos+1;
    end;
    num:=r;
    result:=r;
  end;
  function TNatural.eliminar(posicion:integer):integer;
  var
    cont,mul,aux:integer;
  begin
    cont:=1;    mul:=1;    aux:=0;
    while num>0 do
    begin
    if cont=posicion then
    begin
      num:=num div 10;
    end;
    aux:=aux+((num mod 10)*mul);
    mul:=mul*10;
    num:=num div 10;
    cont:=cont+1;
    end;
    num:=aux;
    result:=aux;
  end;
  function TNatural.cantidad():integer;
  var aux:integer;
  begin
   aux:=trunc(ln(num)/ln(10)+1);
   result:=(aux);
  end;
  function TNatural.sumar(): integer;
  var suma,dig:integer;
  begin
    suma:=0;
    while num>0 do
     begin
     dig:= num mod 10;
     suma:=suma+dig;
     num:=num div 10;
     end;
    result:=suma;
  end;
  function TNatural.pares():string;
  var cont,dig:integer;  listapares:string;
  begin
    cont:=0;    listapares:='';
    while num>0 do
     begin
     dig:=num mod 10;
     if dig mod 2 = 0 then
     begin
       cont:=cont+1;
       listapares:=listapares+IntToStr(dig)+', ';
     end;
     num:=num div 10;
     end;
    result:=IntToStr(cont)+'pares '+listapares;
  end;
  function TNatural.impares():string;
  var cont,dig:integer;  listaimpares:string;
  begin
    cont:=0;    listaimpares:='';
    while num>0 do
     begin
     dig:=num mod 10;
     if dig mod 2 <> 0 then
     begin
       cont:=cont+1;
       listaimpares:=listaimpares+IntToStr(dig)+', ';
     end;
     num:=num div 10;
     end;
    result:=IntToStr(cont)+'impares '+listaimpares;
  end;
  function TNatural.primos():string;
  var cont,dig:integer;    listaprimos:string;
  begin
    cont:=0;    listaprimos:='';
    while num>0 do
     begin
     dig:=num mod 10;
     if (dig=2) or (dig=3) or (dig=5) or (dig=7)  then
     begin
       cont:=cont+1;
       listaprimos:=listaprimos+IntToStr(dig)+', ';
     end;
     num:=num div 10;
     end;
    result:=IntToStr(cont)+'primos '+listaprimos;
  end;
  function TNatural.digito_mayor():integer;
  var dig,may:integer;
  begin
    dig:=0;    may:=num mod 10;    num:=num div 10;
    while num>0 do
     begin
     dig:=num mod 10;
     if dig>may then
     begin
       may:=dig;
     end;
     num:=num div 10;
     end;
    result:=may;
  end;
  function TNatural.digito_menor():integer;
  var dig,men:integer;
  begin
    dig:=0;    men:=num mod 10;    num:=num div 10;
    while num>0 do
     begin
     dig:=num mod 10;
     if dig<men then
     begin
       men:=dig;
     end;
     num:=num div 10;
     end;
    result:=men;
  end;
  //con enteros
  function TNatural.invertir():integer;
  var dig,r,mul:integer;
  begin
    mul:=1;    r:=0;
    while num>0 do
     begin
     dig:=num mod 10;
     r:=(r*mul)+dig;
     mul:=10;
     num:=num div 10;
     end;
    result:=r;
  end;
  function TNatural.capicua():boolean;
  begin
    result:=(num=invertir());
  end;
  function TNatural.par():boolean;
  begin
    result:=(num mod 2 = 0);
  end;
  function TNatural.impar():boolean;
  begin
    result:=(num mod 2 <> 0);
  end;
  function TNatural.primo():boolean;
  var cont,i:integer;
  begin
    cont:=1;
    for i:=1 to num do
    begin
    if num mod i=0 then
    begin
    cont:=cont+1;
    end;
    end;
    result:=(cont=2);
  end;
  function TNatural.convertir_a_binario():string;
  var dig:integer;    aux:string;
  begin
    aux:='';
    while num>0 do
     begin
     dig:=num mod 2;
     aux:=IntToStr(dig)+aux;
     num:=num div 2;
     end;
    result:=aux;
  end;
  function TNatural.convertir_a_octal():string;
  var dig:integer;    aux:string;
  begin
    aux:='';
    while num>0 do
     begin
     dig:=num mod 8;
     aux:=IntToStr(dig)+aux;
     num:=num div 8;
     end;
    result:=aux;
  end;
  function TNatural.convertir_a_hexadecimal():string;
  var dig:integer;    digstr:char;    aux:string;
  begin
    aux:='';
    while num>0 do
     begin
     dig:=num mod 16;
     if dig<10 then
     begin
     aux:=IntToStr(dig)+aux;
     end else
     begin
     if (dig=10) then digstr:='A';if (dig=11) then digstr:='B';
     if (dig=12) then digstr:='C';if (dig=13) then digstr:='D';
     if (dig=14) then digstr:='E';if (dig=15) then digstr:='F';
     if (dig=16) then digstr:='G';
     aux:=digstr+aux;
     end;
     num:=num div 16;
     end;
    result:=aux;
  end;
  function TNatural.convertir_a_base_N(base:integer):string;
  var dig:integer;    digstr:char;    aux:string;
  begin
    aux:='';
    while num>0 do
     begin
     dig:=num mod base;
     if dig<10 then
     begin
     aux:=IntToStr(dig)+aux;
     end else
     begin
     if (dig=10) then digstr:='A';if (dig=11) then digstr:='B';
     if (dig=12) then digstr:='C';if (dig=13) then digstr:='D';
     if (dig=14) then digstr:='E';if (dig=15) then digstr:='F';
     if (dig=16) then digstr:='G';
     aux:=digstr+aux;
     end;
     num:=num div base;
     end;
    result:=aux;
  end;
  function TNatural.convertir_a_romano():string;
  const
    valores: array[1..13] of integer=(1000,900,500,400,100,90,50,40,10,9,5,4,1);
    romanos: array[1..13] of string=('M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I');
  var i:integer;    res:string;
  begin
    res:='';
    for i:=1 to 13 do
    begin
    while num>=valores[i] do
     begin
     res:=res+romanos[i];
     num:=num-valores[i];
     end;
    end;
    result:=res;
  end;
  {function TNatural.convertir_a_literal():string;
  begin
  end;}




end.
