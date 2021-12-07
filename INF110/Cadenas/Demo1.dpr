program Demo1;
uses
  math,
  sysutils,
  Cadena in 'Cadena.pas';
var
    cad : string;
    cantidad : byte;
begin
  write('Ingrese la cadena: ');
  readln(cad);
  //cantidad := ObtenerCantidadDeNumeros(cad);
  //writeln(cantidad);
  //DeleteNoAbecedarioYEspacio(cad);
  DeleteNoNumeroOEspacio(cad);  //'esta es25 una 26 prueba $#$!27'
  Writeln(cad);
  readln;
end.
