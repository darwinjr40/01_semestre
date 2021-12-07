program Demo;
uses
  System.SysUtils,
  Numero in 'Numero.pas';

var
  numero, x : cardinal;
begin

  x := 10;
  while (x >= 0) do begin
      write('Ingrese una nota: ');
    readln(numero);      //74287365
    writeln(numero);
  end;


//  writeln('el digito mayor es: ' , DigitoMayorDe4Dig(numero));
  //writeln('la cantidad de digitos es: ' , CantidadDeDigitos(numero));
  readln;
end.
