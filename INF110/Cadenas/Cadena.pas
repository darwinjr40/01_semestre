unit Cadena;

interface
          //valor
procedure CantidadDeNumeros(x : String); overload;
          //referencia
procedure CantidadDeNumeros1(var x : String); overload;


function ObtenerCantidadDeNumeros(x : String): byte;
function EsDigito(caracter : char): boolean;
function EsAbecedarioYEspacio(caracter : char): boolean;
procedure DeleteNoAbecedarioYEspacio(var x : String);
function EsNumeroOEspacio(x : char): boolean;
procedure DeleteNoNumeroOEspacio(var x : String);
implementation
//----------------------------------------------------------
        //cad='aeiou'   x = 'aeiou' = 'abc'
  procedure CantidadDeNumeros(x : String);
  begin
     x := 'abc';
  end;
          //x ->cad = 'aeiou' = '123'
  procedure CantidadDeNumeros1(var x : String);
  begin
     x := '123';
  end;
//----------------------------------------------------------
{
CantidadDeNumeros(x = 'hola10 20')--> 2   x = 'hola10 20'
} 
function ObtenerCantidadDeNumeros(x : String): byte;
var
  i,n, aux, resultado : byte;
begin
  i := 1;
  n := Length(x);
  resultado := 0;
  while (i <= n) do begin// i esta dentro del rango de 1..N
    aux := i;
    while (i <= n) and (EsDigito(x[i])) do
       i := i + 1;
    if (aux <> i) then
       resultado := resultado + 1;
    i := i + 1;
  end;
  result := resultado;
end;

function EsDigito(caracter : char): boolean;
const NUMEROS : set of char = ['0'..'9'];
//const vocales = ['a','e', 'i', 'o', 'u'];
begin
  result := caracter in NUMEROS;
//  result := POS(NUMEROS, CARACTER) > 0;
end;

function EsAbecedarioYEspacio(caracter : char): boolean;
const AbecedarioYEspacio = ['A'..'Z', 'a'..'z', 'á','é','í','ó','ú', ' '];
begin
  result := caracter in AbecedarioYEspacio;
end;

{
Ej. x=”hola45 como ¡”#1están todos!”!267” ➔ “hola como están todos”
}
procedure DeleteNoAbecedarioYEspacio(var x : String);
var
  i,n : byte;
begin
  i := 1;
  n := Length(x);
  while (i <= n) do begin// i esta dentro del rango de 1..N
    if not (EsAbecedarioYEspacio(x[i])) then begin
      Delete(x, i, 1);
      n := n - 1;
    end else begin
      i := i + 1;
    end;
  end;
end;


function EsNumeroOEspacio(x : char): boolean;
begin
  result := EsDigito(x) or (x = ' ');
end;

procedure DeleteNoNumeroOEspacio(var x : String);
var
  i,n : byte;
begin
  i := 1;
  n := Length(x);
  while (i <= n) do begin// i esta dentro del rango de 1..N
    if (EsNumeroOEspacio(x[i])) then begin
      i := i + 1;
    end else begin
      Delete(x, i, 1);
      n := n - 1;
    end;
  end;
end;
end.
